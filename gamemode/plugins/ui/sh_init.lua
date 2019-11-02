if (CLIENT) then
	ui = ui or {}
else
	resource.AddFile( "resource/fonts/morpheus.ttf" )
	resource.AddFile("sound/menu_theme.mp3")
end

fastincludes.includeCL 'colors.lua'
fastincludes.includeCL 'theme.lua'
fastincludes.includeCL 'util.lua'

local files, _ = file.Find(GM.FolderName .. '/gamemode/plugins/ui/controls/ui_*.lua', 'LUA')
for k, v in ipairs(files) do
	fastincludes.includeCL(GM.FolderName .. "/gamemode/plugins/ui/controls/" .. v)
end