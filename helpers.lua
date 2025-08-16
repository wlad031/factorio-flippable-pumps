function dir_to_orientation(d)
      if d == defines.direction.north then return 0.00
  elseif d == defines.direction.east  then return 0.25
  elseif d == defines.direction.south then return 0.50
  elseif d == defines.direction.west  then return 0.75
  else return 0 end
end

function is_flippable(entity)
  return entity and entity.valid and entity.name:match("^flippable%-")
end

function dbg(msg)
  if not (storage and storage.debug) then return end
  log("[FlippablePumps] " .. msg)
  for _, p in pairs(game.connected_players) do
    p.print({ "", "[FlippablePumps] ", msg })
  end
end
