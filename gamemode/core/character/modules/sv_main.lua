local character = {}

util.AddNetworkString("witcher.character.Init")
util.AddNetworkString("witcher.character.Delete")
util.AddNetworkString("witcher.character.Result")
util.AddNetworkString("witcher.character.Login")

function character.Init(len, ply)
	local name = net.ReadString()
	local model = net.ReadString()
	local result
	
	if InitCharacter(ply, name, model) then
		result = true
	else
		result = false
	end
	
	net.Start("witcher.character.Result")
	net.WriteBool(result)
	net.Send(ply)
end

function character.Login(len, ply)
	local result
	
    if LoginCharacter(ply, name, model) then
		result = true
	else
		result = false
	end
	
	net.Start("witcher.character.Result")
	net.WriteBool(result)
	net.Send(ply)
end

function character.Delete(len)
	local name = net.ReadString()
end

net.Receive("witcher.character.Init", character.Init)
net.Receive("witcher.character.Delete", character.Delete)
net.Receive("witcher.character.Login", character.Login)