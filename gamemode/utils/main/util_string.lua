function string.formatTime(t)
if not t then return 'N/A' end
		
	local hours = math.floor(t / 3600)
	local minutes = math.floor((t % 3600) / 60)
	local seconds = math.floor(t - (hours * 3600) - (minutes * 60))
		
	return (hours .. ':' .. minutes .. ':' .. seconds)
end