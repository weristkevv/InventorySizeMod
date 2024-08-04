local function update_inventory_size(player)
  if player and player.character then
    local inventory_size = settings.get_player_settings(player)["inventory-size"].value
    player.character_inventory_slots_bonus = inventory_size - 80
  end
end

script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
  if event.setting == "inventory-size" then
    local player = game.players[event.player_index]
    update_inventory_size(player)
  end
end)

script.on_init(function()
  for _, player in pairs(game.players) do
    update_inventory_size(player)
  end
end)

script.on_configuration_changed(function()
  for _, player in pairs(game.players) do
    update_inventory_size(player)
  end
end)

script.on_event(defines.events.on_player_created, function(event)
  local player = game.players[event.player_index]
  update_inventory_size(player)
end)
