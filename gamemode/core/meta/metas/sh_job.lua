local PLAYER = FindMetaTable( "Player" )

rp.Jobs = rp.Jobs or {}

if CLIENT then
	net.Receive("get_jt", function(len, ply) rp.Jobs = net.ReadTable() end)
end

function getJobTable()
 net.Start("get_jt")
 net.SendToServer()
end

function PLAYER:GetJob()
    if CLIENT then
        getJobTable()
    end
	return rp.Jobs[self:GetNetVar("Job")]
end

function PLAYER:GetJobColor()
	return self:GetJob().color
end

function PLAYER:GetJobTitle()
	local job = self:GetJob()
	if job then
		return job.name
	else
		return "Undefined"
	end
end