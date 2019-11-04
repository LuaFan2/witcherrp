GM.Version = "0.0.1"
GM.Name = "WitcherRP"
GM.Author = "Deleted"

DeriveGamemode("sandbox")
DEFINE_BASECLASS("gamemode_sandbox")
GM.Sandbox = BaseClass

local function LoadModules()
    local root = GM.FolderName .. "/gamemode/core/"
    local _, folders = file.Find(root .. "*", "LUA")
	
    for _, folder in SortedPairs(folders, true) do
		for _, File in SortedPairs(file.Find(root .. folder .. '/*.lua', "LUA"), true) do
			if string.match(File, "sh_.*.lua") then include(root .. folder .. "/" .. File) end
			if string.match(File, "cl_.*.lua") then include(root .. folder .. "/" .. File) end
		end
	end
end

local function LoadPlugins()
	local root = GM.FolderName .. "/gamemode/plugins/"
    local _, folders = file.Find(root .. "*", "LUA")
	
	for _, folder in SortedPairs(folders, true) do
		for _, File in SortedPairs(file.Find(root .. folder .. '/*.lua', "LUA"), true) do
			if string.match(File, "sh_.*.lua") then include(root .. folder .. "/" .. File) end
			if string.match(File, "cl_.*.lua") then include(root .. folder .. "/" .. File) end
		end
	end
end

local function LoadUtils()
    local root = GM.FolderName .. "/gamemode/utils/"
    local _, folders = file.Find(root .. "*", "LUA")

	for _, folder in SortedPairs(folders, true) do
		for _, File in SortedPairs(file.Find(root .. folder .. '/*.lua', "LUA"), true) do
			if string.match(File, "util_.*.lua") then include(root .. folder .. "/" .. File) end
		end
	end
end

local function LoadConfs()
    local root = GM.FolderName .. "/gamemode/configs/"
    local files, folders = file.Find(root .. "*", "LUA")
	
	for _, folder in SortedPairs(folders, true) do
		for _, File in SortedPairs(file.Find(root .. folder .. '/*.lua', "LUA"), true) do
			if string.match(File, "cfg_.*.lua") then include(root .. folder .. "/" .. File) end
		end
	end
end

rp = {}

LoadConfs()
LoadUtils()
LoadModules()
LoadPlugins()

ui.Create("ui_main")