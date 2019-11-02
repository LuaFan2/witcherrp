rp.Command.Add("roll", 0, function(ply, args)
 rp.Action("выпало число " .. math.random(100) .. " из 100", ply)
end)