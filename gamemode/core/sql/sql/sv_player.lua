local PLAYER = FindMetaTable( "Player" )

function rp.sql.CreateCharacterTable()
	sql.Begin()
	q = sql.Query('CREATE TABLE IF NOT EXISTS witcher_characters(SteamID TEXT UNIQUE, name TEXT UNIQUE, model TEXT, money INTEGER, time INTEGER)')
	sql.Commit()
	return q
end

function rp.sql.CreateCharacter(ply, name, model)
    local q

	sql.Begin()
	exists = sql.Query("SELECT * FROM witcher_characters WHERE SteamID = '"..ply:SteamID().."' OR name = '"..name.."'")
	if exists == nil then
		sql.Query("INSERT INTO witcher_characters( SteamID, name, model, money, time ) VALUES( '"..ply:SteamID().."', '"..name.."', '"..model.."', '"..rp.Config.StartMoney.."', 0)")
		q = true
	else
		q = false
	end
	sql.Commit()
	return q
end

function rp.sql.UpdateCharacter(ply, name, model, money)
	sql.Begin()
	q = sql.Query( "UPDATE witcher_characters SET name='"..name.."', model='"..model.."', money='"..money.."' WHERE SteamID='"..ply:SteamID().."'" )
	sql.Commit()
	return q
end

function rp.sql.UpdateValue(ply, value, val)
	sql.Begin()
	q = sql.Query( "UPDATE witcher_characters SET "..value.."='"..val.."' WHERE SteamID='"..ply:SteamID().."'" )
	sql.Commit()
	return q
end

function PLAYER:GetSQLValue(value)
	sql.Begin()
	q = sql.QueryValue( "SELECT ".. value .. " FROM witcher_characters WHERE SteamID='"..self:SteamID().."'")
	sql.Commit()
	return q
end