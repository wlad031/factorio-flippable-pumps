require("helpers")
require("gui")

local function ensure_storage()
  storage.pumps = storage.pumps or {}
  storage.debug = storage.debug or false
end

local function ensure_base_overlay(pump)
  if not pump or not pump.entity then return end

  local orientation = dir_to_orientation(pump.base_dir or pump.entity.direction)

  if pump.base_dir_overlay then
    if pump.base_dir_overlay.orientation == orientation then
      return
    else
      pump.base_dir_overlay.sprite.destroy()
    end
  end

  pump.base_dir_overlay = {
    orientation = orientation,
    sprite = rendering.draw_sprite({
      sprite       = "utility/indication_arrow",
      target       = pump.entity,
      surface      = pump.entity.surface,
      orientation  = orientation,
      x_scale      = 0.55,
      y_scale      = 0.55,
      render_layer = "entity-info-icon",
      tint         = { r = 0.20, g = 0.80, b = 1.00, a = 0.95 }
    })
  }
end

local function register(entity)
  ensure_storage()
  if not is_flippable(entity) then
    return
  end

  local pump = storage.pumps[entity.unit_number] or {}
  pump.entity = entity
  pump.base_dir = pump.base_dir or entity.direction
  pump.signal = pump.signal or {
    type = "virtual",
    name = "signal-F"
  }

  ensure_base_overlay(pump)

  storage.pumps[entity.unit_number] = pump

  return pump
end

local function unregister(entity)
  ensure_storage()
  if not is_flippable(entity) then
    return
  end

  local pump = storage.pumps[entity.unit_number]

  if pump.base_dir_overlay then
    pump.base_dir_overlay.sprite.destroy()
    pump.base_dir_overlay = nil
  end

  storage.pumps[entity.unit_number] = nil
end

local function get_signal_value(pump)
  local signals = pump.entity.get_signals(
    defines.wire_connector_id.circuit_red,
    defines.wire_connector_id.circuit_green
  )
  if signals and #signals > 0 then
    for _, signal in pairs(signals) do
      if signal.signal.name == pump.signal.name then
        return signal.count
      end
    end
  end
  return 0
end

local function rescan_all()
  for _, s in pairs(game.surfaces) do
    for _, e in pairs(s.find_entities_filtered { type = "pump" }) do
      if is_flippable(e) then register(e) end
    end
  end
end

------------
-- Events
------------

-- script.on_init(init)
-- script.on_configuration_changed(init)
script.on_load(function()
end)

script.on_event({
  defines.events.on_built_entity,
  defines.events.on_robot_built_entity,
  defines.events.script_raised_built
}, function(event)
  ensure_storage()
  register(event.entity)
end)

script.on_event({
  defines.events.on_entity_cloned,
}, function(event)
  ensure_storage()
  register(event.destination)
end)

script.on_event({
  defines.events.on_pre_player_mined_item,
  defines.events.on_robot_pre_mined,
  defines.events.on_entity_died,
  defines.events.script_raised_destroy
}, function(event)
  ensure_storage()
  unregister(event.entity)
end)

script.on_nth_tick(15, function()
  ensure_storage()
  for _, surface in pairs(game.surfaces) do
    for _, entity in pairs(surface.find_entities_filtered { type = "pump" }) do
      if is_flippable(entity) then
        local pump = register(entity)
        if pump and pump.signal then
          local val = get_signal_value(pump)
          if (val > 0 and pump.entity.direction == pump.base_dir)
              or (val <= 0 and pump.entity.direction ~= pump.base_dir) then
            local _ = pump.entity.rotate()
          end
        end
      end
    end
  end
end)

script.on_event(defines.events.on_player_rotated_entity, function(event)
  ensure_storage()
  if not is_flippable(event.entity) then
    return
  end

  register(event.entity)
  local pump = storage.pumps[event.entity.unit_number]
  pump.base_dir = event.entity.direction
  ensure_base_overlay(pump)
end)

commands.add_command("fp-debug", "Toggle debug", function()
  ensure_storage()
  storage.debug = not storage.debug
  dbg("Debug " .. (storage.debug and "ON" or "OFF"))
end)

