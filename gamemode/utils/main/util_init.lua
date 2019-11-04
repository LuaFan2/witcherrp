local PLAYER = FindMetaTable( "Player" )

function InitCharacter(ply, name, model)
	q = rp.sql.CreateCharacter(ply, name, model)
	if q then
		InitPlayerVars(ply)
		return true
	end
	return false
end

function LoginCharacter(ply)
    if ply:GetSQLValue("name") then
        InitPlayerVars(ply)
        return true
    end
    return false
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