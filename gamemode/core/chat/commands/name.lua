rp.Command.Add("name", 0, function(ply, args)
	local name = util.ConcateArgs(args)
	if IsValidName(name) then
		ply:SetName(name)
	end
end)