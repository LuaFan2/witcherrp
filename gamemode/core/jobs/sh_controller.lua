fastincludes.includeSV 'modules/sv.lua'

local files, _ = file.Find(GM.FolderName .. '/gamemode/core/jobs/jobs/*.lua', 'LUA')
for k, v in ipairs(files) do
	fastincludes.includeSV(GM.FolderName .. "/gamemode/core/jobs/jobs/" .. v)
end