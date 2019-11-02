GM.Version = "0.0.1"
GM.Name = "RpBox"
GM.Author = "Deleted"

DeriveGamemode("sandbox")
DEFINE_BASECLASS("gamemode_sandbox")
GM.Sandbox = BaseClass

AddCSLuaFile("cl_init.lua")

-- [[ Load Help Files and Configs
local root = GM.FolderName .. "/gamemode/utils/"
local _, folders = file.Find(root .. "*", "LUA")

for _, folder in SortedPairs(folders, true) do
	for _, File in SortedPairs(file.Find(root .. folder .. '/*.lua', "LUA"), true) do
		if string.match(File, "util_.*.lua") then include(root .. folder .. "/" .. File) AddCSLuaFile(root .. folder .. "/" .. File) end
	end
end

local root = GM.FolderName .. "/gamemode/configs/"
local _, folders = file.Find(root .. "*", "LUA")

for _, folder in SortedPairs(folders, true) do
	for _, File in SortedPairs(file.Find(root .. folder .. '/*.lua', "LUA"), true) do
		if string.match(File, "cfg_.*.lua") then include(root..folder..'/'..File) AddCSLuaFile(root .. folder .. "/" .. File) end
	end
end

--]]

--[[
 Load Modules
--]]

local root = GM.FolderName .. "/gamemode/core/"
local files, folders = file.Find(root .. "*", "LUA")

for _, v in pairs(files) do
    if string.GetExtensionFromFilename(v) ~= "lua" then continue end
    include(root .. v)
end

for _, folder in SortedPairs(folders, true) do
	for _, File in SortedPairs(file.Find(root .. folder .. '/*.lua', "LUA"), true) do
		if string.match(File, "sh_.*.lua") then AddCSLuaFile(root .. folder .. "/" .. File) include(root .. folder .. "/" .. File) end
		if string.match(File, "cl_.*.lua") then AddCSLuaFile(root .. folder .. "/" .. File) end
		if string.match(File, "sv_.*.lua") then include(root .. folder .. "/" .. File) end
	end
end

--[[ LM End --]]

local root = GM.FolderName .. "/gamemode/plugins/"
local files, folders = file.Find(root .. "*", "LUA")

for _, folder in SortedPairs(folders, true) do
	for _, File in SortedPairs(file.Find(root .. folder .. '/*.lua', "LUA"), true) do
		if string.match(File, "sh_.*.lua") then AddCSLuaFile(root .. folder .. "/" .. File) include(root .. folder .. "/" .. File) end
		if string.match(File, "cl_.*.lua") then AddCSLuaFile(root .. folder .. "/" .. File) end
		if string.match(File, "sv_.*.lua") then include(root .. folder .. "/" .. File) end
	end
end
