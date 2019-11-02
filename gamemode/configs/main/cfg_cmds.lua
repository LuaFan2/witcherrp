rp.Config = rp.Config or {}

rp.Config.Cmds = rp.Config.Cmds or {}

rp.Config.Cmds["dice"] = {cback = function (ply, args) rp.Action("бросил шестигранный кубик. Выпало число " .. math.random(6), ply) end}

rp.Config.Cmds["roll"] = {cback = function (ply, args) rp.Action("выпало число " .. math.random(100) .. " из 100", ply) end}

rp.Config.Cmds["card"] = {cback = function(ply, args)
suits = {'пик', 'треф', 'бубен', 'червей'}
nominals = {'2', '3', '4', '5', '6', '7', '8', '9', '10', 'валет', 'дама', 'король', 'туз', "шут"}
r_nominal = nominals[math.random( #nominals )]
if r_nominal == "шут" then
	reply = "достал " .. r_nominal .. "а" .. " из колоды"
else
	reply = "достал карту " .. nominals[math.random( #nominals )] .. " " .. suits[math.random( #suits )] .. " из колоды"
end 
rp.Action(reply, ply)
end}

rp.Config.Cmds["cheque"] = {cback = function(ply, args)
	local name, sorted = util.ConcateArgs(args, 1)
	rp.Cheque(ply, name, tonumber(sorted[1]))
end}

rp.Config.Cmds["dropmoney"] = {cback = function(ply, args) 
	rp.dropMoney(args[1], ply, "drop")
end}

rp.Config.Cmds["name"] = {cback = function(ply, args)
	local name = util.ConcateArgs(args)
	if IsValidName(name) then
		ply:SetName(name)
	end
end}

rp.Config.Cmds["give"] = {cback = function(ply, args)
	victim = ply:GetEyeTrace().Entity
	if victim:IsPlayer() then
		rp.GiveMoney(ply, victim, args[1])
	end
end}

rp.Config.Cmds["changejob"] = {delay = 60, cback = function(ply, args)
	ply:ChangeJob(args[1])
end}