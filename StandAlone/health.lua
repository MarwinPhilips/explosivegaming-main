
-- not made by cooldude :O - still i just copyed from a mod and made a few editing
-- https://mods.factorio.com/mods/chocolateTthunder/Show_Health
-- edits include: tick limit to avoid lag, only shows health when it is lost


Event.register(defines.events.on_tick, function(event)
	if not (event.tick % 15 == 0) then return end
  	for _,player in pairs(game.connected_players) do
		if player.character then
			if player.character.health == nil then return end
			local index = player.index
			local health = math.ceil(player.character.health)
			if global.player_health == nil then global.player_health = {} end
			if global.player_health[index] == nil then global.player_health[index] = health end
			if global.player_health[index] ~= health then
				if health < global.player_health[index] then
					if health > 200 then
						player.surface.create_entity{name="flying-text", color={b = 0.2, r= 0.1, g = 1, a = 0.8}, text=(health), position= {player.position.x, player.position.y-2}}
					elseif health > 100 then
						player.surface.create_entity{name="flying-text", color={r = 1, g = 1, b = 0}, text=(health), position= {player.position.x, player.position.y-2}}
					else
						player.surface.create_entity{name="flying-text", color={b = 0.1, r= 1, g = 0, a = 0.8}, text=(health), position= {player.position.x, player.position.y-2}}
					end
				end
				global.player_health[index] = health
			end
    	end
  	end
end)