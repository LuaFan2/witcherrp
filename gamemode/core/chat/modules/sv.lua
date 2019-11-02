rp = rp or {}

rp.cmds = rp.cmds or {}

rp.Command = rp.Command or {}

util.AddNetworkString( "rp.RunCmd" )

function rp.Command.Add(name, delay, cback)
	table.insert(rp.cmds, {name, delay = delay or 1, cback = cback})
end

function rp.RunCmd(...)
    -- 1 arg - ply, 2 - сmd, 3 - args
    local args = {...}
    for i = 1, #rp.cmds do
        if rp.cmds[i][1] == args[2] then
            return rp.cmds[i].cback(args[1], args[3])
        end
    end
end

net.Receive( "rp.RunCmd", function( len, pl )
    local cmd = net.ReadString()
    local args = net.ReadTable()
    rp.RunCmd(pl, cmd, args)
end )

function GM:PlayerSay( ply, text )
    self.BaseClass:PlayerSay( ply, text );
    local args = {}
    for word in text:gmatch("%w+") do table.insert(args, word) end
    if next(args) ~= nil then
        local cmd = args[1]:gsub('/', '')
        table.remove(args, 1)
        for i = 1, #rp.cmds do
            if (rp.cmds[i][1] == cmd) then
				rp.CDelays = rp.CDelays or {}
				delay = rp.cmds[i].delay
				if delay and rp.CDelays[rp.cmds[i][1]] and rp.CDelays[rp.cmds[i][1]] > CurTime() - delay then
					return ""
				end
				rp.CDelays[rp.cmds[i][1]] = CurTime()
                rp.RunCmd(ply, cmd, args)
                return ""
            end
        end
    end
    rp.RangeChat(text, ply );
    return ""
end