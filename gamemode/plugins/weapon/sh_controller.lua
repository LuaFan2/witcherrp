fastincludes.includeSV 'config.lua'

local files, _ = file.Find(GM.FolderName .. '/gamemode/plugins/weapon/modules/*.lua', 'LUA')

for k, v in ipairs(files) do
	fastincludes.includeSV(GM.FolderName .. "/gamemode/plugins/weapon/modules/" .. v)
end