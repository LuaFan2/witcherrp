local PLAYER = FindMetaTable( "Player" )

function InitCharacter(ply, name, model)
	rp.sql.CreateCharacter(ply, name, model)
	InitPlayerVars(ply)
end

function InitPlayerVars(ply)
	name = ValidateName(ply:GetSQLValue("name"))
    money = ply:GetSQLValue("money")
	utime = ply:GetSQLValue("time")
	model = ply:GetSQLValue("model")
	
	ply:SetModel(model)
	ply:SetName(name)
	ply:SetMoney(money)
	ply:SetTime(utime)
	
	ply:SetNetVar( "Job", 1 )
	ply:SetNetVar("Gunlicense", false)
end