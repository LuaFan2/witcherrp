rp.Command.Add("give", 0, function(ply, args)
	victim = ply:GetEyeTrace().Entity
	if victim:IsPlayer() then
		rp.GiveMoney(ply, victim, args[1])
	end
end)