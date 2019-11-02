rp.Command.Add("dice", 0, function(ply, args)
 rp.Action("бросил шестигранный кубик. Выпало число " .. math.random(6), ply)
end)