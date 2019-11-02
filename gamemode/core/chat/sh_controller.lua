fastincludes.includeSH 'modules/sh.lua'
fastincludes.includeSV 'modules/sv.lua'
fastincludes.includeCL 'modules/cl.lua'

local files, _ = file.Find(GM.FolderName .. '/gamemode/core/chat/commands/*.lua', 'LUA')
for k, v in ipairs(files) do
	fastincludes.includeSV(GM.FolderName .. "/gamemode/core/chat/commands/" .. v)
end