rp.Command.Add("drop", 0, function(ply, args)
	ply:DropWeapon(ply:GetActiveWeapon())
end)