rp = rp or {}

rp.Jobs = rp.Jobs or {}
rp.Job = rp.Job or {}

util.AddNetworkString "get_jt"

function rp.Job.Add(t)
	t.id = #rp.Jobs + 1
	t.salary = t.salary or 0
	t.color = t.color or Color(0,76,153)
	t.name = t.name or "Unknown"
	table.insert(rp.Jobs, t)
end

net.Receive("get_jt", function(len, ply) net.Start("get_jt") net.WriteTable(rp.Jobs) net.Send(ply) end)