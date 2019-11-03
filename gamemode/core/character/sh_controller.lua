local files, _ = file.Find(GM.FolderName .. '/gamemode/core/character/modules/*.lua', 'LUA')

for k, v in ipairs(files) do
	if string.match(v, "cl_.*.lua") then fastincludes.includeCL(GM.FolderName .. "/gamemode/core/character/modules/" .. v) end
	if string.match(v, "sv_.*.lua") then fastincludes.includeSV(GM.FolderName .. "/gamemode/core/character/modules/" .. v) end
	if string.match(v, "sh_.*.lua") then fastincludes.includeSH(GM.FolderName .. "/gamemode/core/character/modules/" .. v) end
end