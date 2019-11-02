rp.Command.Add("card", 0, function(ply, args)
	suits = {'пик', 'треф', 'бубен', 'червей'}
	nominals = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'валет', 'дама', 'король', 'туз', "шут"}
	r_nominal = nominals[math.random( #nominals )]
	if r_nominal == "шут" then
		reply = "достал " .. r_nominal .. "а" .. " из колоды"
	else
		reply = "достал карту " .. nominals[math.random( #nominals )] .. " " .. suits[math.random( #suits )] .. " из колоды"
	end 
	rp.Action(reply, ply)
end)