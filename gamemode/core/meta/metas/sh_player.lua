local PLAYER = FindMetaTable( "Player" )

function PLAYER:GetMoney()
	return tonumber(self:GetNetVar("Money", 1000))
end

function PLAYER:GetName()
	return self:GetNetVar("Name", self:Nick())
end

function PLAYER:GetTime()
	return tonumber(self:GetNetVar("Time", 0))
end

function PLAYER:GetColor()
    return Color(0,0,0)
end

function PLAYER:CanAfford(c)
	if self:GetMoney() >= c then return true end
	return false
end