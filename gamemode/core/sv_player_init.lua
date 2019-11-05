local PLAYER = FindMetaTable( "Player" )

timer.Create( 'witcher_timeplayed', 1, 0, function()
	for k,v in pairs( player.GetAll() ) do
		v:AddTime()
	end
end)

hook.Add( "Initialize", "initalize_sql", function()
	rp.sql.CreateCharacterTable()
end)

hook.Add( "PlayerDisconnected", "playerdisconnected", function(ply) ply:SaveTime() end)

hook.Add( "ShutDown", "shutingdown", function() for k, v in ipairs(player.GetAll()) do v:SaveTime() end end )