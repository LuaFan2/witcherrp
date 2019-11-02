local radius = rp.Config.Talk.talkRadius

function GM:PlayerCanHearPlayersVoice(listener, player)
	if not rp.Config.Talk.localVoice then return true end

	if not (player:IsValid() and listener:IsValid()) then return end

	local distToSqr = player:GetPos():DistToSqr(listener:GetPos())

	-- Can hear if alive, close to us, and conscious.
	if player:Alive() and distToSqr <= radius and not player:isUnconscious() then
		return true
	end

	-- Cant hear.
	return false
end