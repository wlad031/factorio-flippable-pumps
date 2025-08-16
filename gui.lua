local GUI_NAME = "flippable_pump_gui"
local SIGNAL_PICKER_NAME = "fp_signal_picker"

local function destroy_gui(player)
  local r = player.gui and player.gui.relative and player.gui.relative[GUI_NAME]
  if r then r.destroy() end
end

local function build_gui(player, entity)
  destroy_gui(player)

  local root = player.gui.relative.add({
    type = "frame",
    name = GUI_NAME,
    anchor = {
      gui = defines.relative_gui_type.pump_gui,
      position = defines.relative_gui_position.bottom
    },
    direction = "vertical"
  })
  local row = root.add({
    type = "flow",
    direction = "horizontal"
  })
  row.style.vertical_align = "center"
  row.add({
    type = "label",
    caption = "Flip when"
  })
  local picker = row.add({
    type = "choose-elem-button",
    name = SIGNAL_PICKER_NAME,
    elem_type = "signal",
    tags = { fp_unit = entity.unit_number }
  })
  row.add({
    type = "label",
    caption = "> 0"
  })
  local pump = storage.pumps[entity.unit_number]
  if pump.signal then
    picker.elem_value = pump.signal
  end
end

------------
-- Events
------------

script.on_event(defines.events.on_gui_opened, function(event)
  if event.gui_type ~= defines.gui_type.entity then
    return
  end
  local player = game.get_player(event.player_index)
  if not player then
    return
  end
  local entity = event.entity
  if is_flippable(entity) then
    build_gui(player, entity)
  else
    destroy_gui(player)
  end
end)

script.on_event(defines.events.on_gui_closed, function(event)
  local player = game.get_player(event.player_index)
  if not player then
    return
  end
  destroy_gui(player)
end)

script.on_event(defines.events.on_gui_elem_changed, function(event)
  local player = game.get_player(event.player_index)
  if not player then
    return
  end

  local element = event.element
  if not (element and element.valid and element.name == SIGNAL_PICKER_NAME) then
    return
  end

  local unit = element.tags and element.tags.fp_unit
  local pump = storage.pumps[unit]

  local entity = pump and pump.entity or player.opened
  if not is_flippable(entity) then
    return
  end

  pump.signal = element.elem_value
end)

