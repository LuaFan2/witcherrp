fastincludes.includeSV 'config.lua'

local files, _ = file.Find(GM.FolderName .. '/gamemode/plugins/propprotect/modules/*.lua', 'LUA')
for k, v in ipairs(files) do
	fastincludes.includeSV(GM.FolderName .. "/gamemode/plugins/propprotect/modules/" .. v)
end