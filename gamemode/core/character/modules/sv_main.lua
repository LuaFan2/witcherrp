local character = {}

util.AddNetworkString( "witcher.character.Init" )
util.AddNetworkString( "witcher.character.Delete" )

function character.Init(len, ply)
	local name = net.ReadString()
	local model = net.ReadString()
	
	InitCharacter(ply, name, model)
end

function character.Delete(len)
	local name = net.ReadString()
end

net.Receive("witcher.character.Init", character.Init)
net.Receive("witcher.character.Delete", character.Delete)