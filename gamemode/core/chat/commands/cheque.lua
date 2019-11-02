rp.Command.Add("cheque", 0, function(ply, args)
	local name, sorted = util.ConcateArgs(args, 1)
	rp.Cheque(ply, name, tonumber(sorted[1]))
end)