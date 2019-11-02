rp = rp or {}

if SERVER then 
    util.AddNetworkString( "ChatMessage" )
end

function util.ConcateArgs(args, offset)
	offset = offset or 0
	local str = ""
    local iter = 1
		for i = 1, #args-offset do
			str = str .. args[i]
			if table.index(args[i], args) ~= #args-offset then str = str .. " " end
            iter = iter + 1
		end
	local sorted = {}
	if offset ~= 0 then
		for i = iter, #args do
			table.insert(sorted, args[i])
		end
	end
	return str, sorted
end

function rp.RangeChat(msg, ply)
	if( ply:Alive() ) then
		local sphere = ents.FindInSphere(ply:EyePos(), rp.Config.Talk.talkRadius)
		for k, v in pairs(sphere) do
			if ( v:IsPlayer() ) then
				net.Start( "ChatMessage" )
                net.WriteString( msg )
			    net.WriteInt(1, 32)
                net.Send( v )
			end
		end
	end
end

function rp.Action(msg, ply)
	if( ply:Alive() ) then
		local sphere = ents.FindInSphere(ply:EyePos(), rp.Config.Talk.actionRadius)
		for k, v in pairs(sphere) do
			if ( v:IsPlayer() ) then
				net.Start( "ChatMessage" )
                net.WriteString( msg )
			    net.WriteInt(2, 32)
                net.Send( v )
			end
		end
	end
end

if CLIENT then 
    function ChatMsg()
        local str = net.ReadString()
		local ply = LocalPlayer()
		local mtype = net.ReadInt(32)
		if mtype == 1 then
			chat.AddText(ply:GetJobColor(), ply:Nick() .. ": ", rp.Config.Chat.TextColor, str )
		end
		if mtype == 2 then
			chat.AddText(rp.Config.Chat.ActionColor, ply:Nick() .. " " .. str )
		end
    end
    net.Receive( "ChatMessage", ChatMsg )
end