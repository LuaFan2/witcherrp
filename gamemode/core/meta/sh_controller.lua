local files, _ = file.Find(GM.FolderName .. '/gamemode/core/meta/metas/*.lua', 'LUA')

for k, v in ipairs(files) do
	if string.match(v, "sv_.*.lua") then fastincludes.includeSV(GM.FolderName .. "/gamemode/core/meta/metas/" .. v) end
	if string.match(v, "sh_.*.lua") then fastincludes.includeSH(GM.FolderName .. "/gamemode/core/meta/metas/" .. v) end
end