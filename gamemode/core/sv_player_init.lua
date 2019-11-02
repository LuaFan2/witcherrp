local PLAYER = FindMetaTable( "Player" )

hook.Add( "PlayerInitialSpawn", "SetPlayerData", function( ply )
	InitPlayer(ply)
end )

hook.Add( "Initialize", "initalize_sql", function()
	rp.sql.CreateUserTable()
end)

hook.Add( "PlayerDisconnected", "playerdisconnected", function(ply) ply:SaveTime() end)

hook.Add( "ShutDown", "shutingdown", function() for k, v in ipairs(player.GetAll()) do v:SaveTime() end end )