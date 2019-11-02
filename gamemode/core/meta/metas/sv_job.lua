local PLAYER = FindMetaTable( "Player" )

function PLAYER:ChangeJob(id)
	id = tonumber(id)
    local job
    for k, v in pairs(rp.Jobs) do
        if rp.Jobs[k].id == id then job = rp.Jobs[k] end
    end
	if job then
		if job.time and job.time > self:GetTime() and self:GetJob().id == job.id then return ; end
		ParticleEffectAttach( "generic_smoke", PATTACH_ABSORIGIN_FOLLOW, self, 1 )
		self:SetNetVar("Job", id)
	end
end