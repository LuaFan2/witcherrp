function rp.Cheque(owner, nick, amount)
	if type(nick) == "string" and type(amount) == "number" then
		if amount > owner:GetMoney() or amount < 0 then
			return ;
		end
		for k, v in pairs(player.GetAll()) do
			if v:GetName() == nick then
					owner:AddMoney(-amount)
					rp.createCheque(owner:Forward(), owner, v, amount)
				    return;
			end
		end
	end
end

function rp.GiveMoney(owner, victim, amount)
	if amount > owner:GetMoney() and type(tonumber(amount)) ~= "number" then return ; end
	amount = tonumber(amount)
	owner:AddMoney(-amount)
	victim:AddMoney(amount)
end

function rp.dropMoney(drop, ply, dtype)
	if type(tonumber(drop)) ~= "number" then return ; end
	drop = tonumber(drop)
	pos = ply:Forward()
	if dtype == "death" then
		drop = ply:GetMoney() / 100 * 10
		pos = ply:GetPos()
	else
		if drop > ply:GetMoney() then
			return ;
		end
	end
	ply:SetMoney(ply:GetMoney() - drop)
	rp.createMoneyBag(pos, drop)
end

function rp.createMoneyBag(pos, amount)
    local money = ents.Create("money")
    money:SetPos(pos)
    money:Setamount(amount)
    money:Spawn()
    money:Activate()
    return money
end

function rp.createCheque(pos, owner, recipient, amount)
	local cheque = ents.Create("cheque")
	cheque:SetPos(pos)
	cheque:Setowner(owner)
	cheque:Setrecipient(recipient)
	cheque:Setamount(amount)
	cheque:Spawn()
	cheque:Activate()
	return cheque
end