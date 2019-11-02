function util.includeCL(file, time_dl)
	if SERVER then 
		AddCSLuaFile(file)
	else --if CLIENT then 
		include(file) 
	end
end

function util.includeSH(file)
	if SERVER then
		AddCSLuaFile(file) 
	end
	include(file) 
end

function util.includeSV(file)
	if SERVER then 
		include(file) 
	end			
end

--------------------------------------------------------------------

--------------------------------------------------------------------

function util.includeCLFolder(folder, r)
	local Files, Folders = file.Find(folder.."/*.lua", "LUA")
	
	if #Files == 0 then return false end
		
	for k, v in pairs(Files) do
		util.includeCL(folder.."/"..v)
	end
	if r then
		for k, v in pairs(Folders) do
			util.includeCLFolder(folder.."/"..v, true)
		end
	end
	
	return true, Files
end

function util.includeSHFolder(folder, r)
	local Files, Folders = file.Find(folder.."/*.lua", "LUA")
	
	if #Files == 0 then return false end
		
	for k, v in pairs(Files) do
		util.includeSH(folder.."/"..v)
	end
	
	if r then
		for k, v in pairs(Folders) do
			util.includeSHFolder(folder.."/"..v, true)
		end
	end
	
	return true, Files
end

function util.includeSVFolder(folder, r)
	local Files, Folders = file.Find(folder.."/*.lua", "LUA")
	
	if #Files == 0 then return false end
		
	for k, v in pairs(Files) do
		util.includeSV(folder.."/"..v)
	end
	
	if r then
		for k, v in pairs(Folders) do
			util.includeSVFolder(folder.."/"..v, true)
		end
	end
	
	return true, Files
end

function fastincludes.includeRSFolder(folder, r)
	local Files, Folders = file.Find(folder.."/*.lua", "LUA")
	
	if #Files == 0 then return false end
		
	for k, v in pairs(Files) do
		if string.Left(v, 3) == "cl_" then
			util.includeCL(folder.."/"..v)
		elseif string.Left(v, 3) == "sv_" then
			util.includeSV(folder.."/"..v)
		else
			util.includeSH(folder.."/"..v)
		end
	end
	
	if r then
		for k, v in pairs(Folders) do
			util.includeRSFolder(folder.."/"..v, true)
		end
	end
	
	return true, Files
end