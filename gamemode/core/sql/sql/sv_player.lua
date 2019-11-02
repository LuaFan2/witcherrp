local PLAYER = FindMetaTable( "Player" )

function rp.sql.CreateUserTable()
	sql.Begin()
	q = sql.Query('CREATE TABLE IF NOT EXISTS rp_players(SteamID TEXT UNIQUE, name TEXT, money INTEGER, time INTEGER)')
	sql.Commit()
	return q
end

function rp.sql.CreateUser(ply)
	sql.Begin()
	exists = sql.Query("SELECT * FROM rp_players WHERE SteamID = '"..ply:SteamID().."'")
	if not exists then
	q = sql.Query("INSERT INTO rp_players( SteamID, name, money, time ) VALUES( '"..ply:SteamID().."', '"..ValidateName(ply:GetName()).."', '"..rp.Config.StartMoney.."', 0)")
	end
	sql.Commit()
	return q
end

function rp.sql.UpdateUser(ply, name, money)
	sql.Begin()
	q = sql.Query( "UPDATE rp_players SET name='"..name.."', money='"..money.."' WHERE SteamID='"..ply:SteamID().."'" )
	sql.Commit()
	return q
end

function rp.sql.UpdateValue(ply, value, val)
	sql.Begin()
	q = sql.Query( "UPDATE rp_players SET "..value.."='"..val.."' WHERE SteamID='"..ply:SteamID().."'" )
	sql.Commit()
	return q
end

function PLAYER:GetSQLValue(value)
	sql.Begin()
	q = sql.QueryValue( "SELECT ".. value .. " FROM rp_players WHERE SteamID='"..self:SteamID().."'")
	sql.Commit()
	return q
end