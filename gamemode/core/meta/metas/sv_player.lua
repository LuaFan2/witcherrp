local PLAYER = FindMetaTable( "Player" )

function PLAYER:SetName(str)
	self:SetNetVar("Name", str)
	self:SaveName()
end

function PLAYER:SaveName()
	local name = self:GetName()
	rp.sql.UpdateValue(self, "name", name)
end

function PLAYER:SaveTime()
	local utime = self:GetTime()
	rp.sql.UpdateValue(self, "time", utime)
end

function PLAYER:AddTime()
	self:SetNetVar("Time", 1 + self:GetTime())
end

function PLAYER:SetTime(utime)
	self:SetNetVar("Time", utime)
end

function PLAYER:SaveMoney()
	local cash = self:GetMoney()
	rp.sql.UpdateValue(self, "money", cash)
end

function PLAYER:AddMoney(amount)
	self:SetNetVar("Money", amount + self:GetMoney())
	self:SaveMoney()
end

function PLAYER:SetMoney(amount)
	self:SetNetVar("Money", amount)
	self:SaveMoney()
end