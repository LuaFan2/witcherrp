rp = rp or {}

function rp.RunCmd(cmd, args)
		net.Start('rp.RunCmd')
		net.WriteString(cmd)
		net.WriteTable(args)
		net.SendToServer()
end