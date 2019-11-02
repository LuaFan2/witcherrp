util.AddNetworkString "revive"

net.Receive("revive", function (len, ply) if(ply:IsPlayer() and not ply:Alive()) then ply:Spawn() end end)

function GM:PlayerDeathThink( ply )
    if (not rp.Config.HUD.DeathScreen) then
	if ( ply.NextSpawnTime && ply.NextSpawnTime > CurTime() ) then return end

	if ( ply:IsBot() || ply:KeyPressed( IN_ATTACK ) || ply:KeyPressed( IN_ATTACK2 ) || ply:KeyPressed( IN_JUMP ) ) then

		ply:Spawn()

	end
	else
	return;
	end
end

function GM:PlayerDeath( victim, inflictor, attacker )
	rp.dropMoney(0, victim, "death")
end