rp.sql = rp.sql or {}

local files, _ = file.Find(GM.FolderName .. '/gamemode/core/sql/sql/*.lua', 'LUA')
for k, v in ipairs(files) do
	fastincludes.includeSV(GM.FolderName .. "/gamemode/core/sql/sql/" .. v)
end