local PLAYER = FindMetaTable( "Player" )

function PLAYER:Forward()
	local tr = {}
	tr.start = self:EyePos()
	tr.endpos = self:EyePos() + 95 * self:GetAimVector()
	tr.filter = self
	local trace = util.TraceLine(tr)
	return trace.HitPos
end

function PLAYER:GetCountry()
	local country
	local ip = self:IPAddress():match("%d+%.%d+%.%d+%.%d+") or ""
	local query_string = string.format("http://ip-api.com/json/%s", ip)
	http.Fetch(query_string,
		function(json, len, headers, status)
			local t = util.JSONToTable(json)
			country = t.countryCode
		end,
		function(err)
		end)
	return country
end

function PLAYER:GetOS()
	local OS
	if system.IsWindows() then OS = "windows" elseif system.IsLinux() then OS = "linux" elseif system.IsOSX() then OS = "osx"
	else
	 OS = "other"
	end
	return OS
end