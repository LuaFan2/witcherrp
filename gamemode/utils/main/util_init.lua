local PLAYER = FindMetaTable( "Player" )

function InitPlayer(ply)
	rp.sql.CreateUser(ply)
	InitPlayerVars(ply)
	StartPlayTimer(ply)
end

function InitPlayerVars(ply)
	name = ValidateName(ply:GetSQLValue("name"))
    money = ply:GetSQLValue("money")
	utime = ply:GetSQLValue("time")
	ply:SetName(name)
	ply:SetMoney(money)
	ply:SetTime(utime)
	ply:SetNetVar( "Job", 1 )
	ply:SetNetVar("Gunlicense", false)
end

function StartPlayTimer(ply)
	timer.Create( "time_" .. ply:UserID(), 1, 0, function() ply:AddTime() end)
end