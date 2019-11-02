Plugin = {}
Plugin.__index = Plugin

function Plugin:Create(name, description)
	local obj = {
		name = name or "Unknown",
		description = description or "",
		folders = {},
		files = {},
		types = {
			'rs',
			'sh',
			'sv',
			'cl'
		}
	}
	
	setmetatable(obj, Plugin)
	return obj
end

function Plugin:_IncludeFolder(f, t)
	local Files, Folders = file.Find(f.."/*.lua", "LUA")
	for k, v in pairs(Files) do
		if t == "cl" then
			util.includeCL(f.."/"..v)
		elseif t == "sv" then
			util.includeCL(f.."/".. v)
		elseif t == "sh" then
			util.includeSH(f.."/"..v)
		else 
			if string.Left(v, 3) == "cl_" then
				util.includeCL(f.."/"..v)
			elseif string.Left(v, 3) == "sv_" then
				util.includeSV(f.."/"..v)
			else
				util.includeSH(f.."/"..v)
			end
		end
	end
end

function Plugin:_IncludeFile(file, type)
	
end

function Plugin:Register()
	if self.files and next(self.files) ~= nil then
		for i = 1, #self.files do
			local f = self.files[i][1]
			local t = self.files[i][2]
			
			if type == "cl" then
				util.includeCL(file)
			elseif type == "sv" then
				util.includeCL(file)
			elseif type == "sh" then
				util.includeSH(file)
			else 
				if string.Left(v, 3) == "cl_" then
					util.includeCL(file)
				elseif string.Left(v, 3) == "sv_" then
					util.includeSV(file)
				else
					util.includeSH(file)
				end
			end
		end
	end
	if self.folders and next(self.folders) ~= nil then
		for i = 1, #self.folders do
			local f = self.folders[i][1]
			local t = self.folders[i][2]
			
			local Files, Folders = file.Find(f.."/*.lua", "LUA")
			for k, v in pairs(Files) do
				if t == "cl" then
					util.includeCL(f.."/"..v)
				elseif t == "sv" then
					util.includeCL(f.."/".. v)
				elseif t == "sh" then
					util.includeSH(f.."/"..v)
				else 
					if string.Left(v, 3) == "cl_" then
						util.includeCL(f.."/"..v)
					elseif string.Left(v, 3) == "sv_" then
						util.includeSV(f.."/"..v)
					else
						util.includeSH(f.."/"..v)
					end
				end
			end
		end
	end
end

function Plugin:Include(f, t)
	if not table.index(t, self.types) then return end
	table.insert(self.folders, {f,t})
end

function Plugin:IncludeFile(f, t)
	if not table.index(t, self.types) then return end
	table.insert(self.files, {f,t})
end

function Plugin:SetName(n)
	self.name = n
end

function Plugin:SetDescription(d)
	self.description = d
end

function Plugin:GetName()
	return self.name
end

function Plugin:GetDescription()
	return self.description
end