-- 
-- 3D2D Escape Menu by thelastpenguin aka Gareth
-- The author of this script takes no responsability for damages incured in it's use including loss or disruption of service or otherwise.
-- All derivitave scripts must keep this credit banner to the author and must credit the author thelastpenguin in any releases
-- other than that you can do whatever the fvck you want with it :)
-- 

local panel

hook.Add('PreRender', 'escMenu', function()
	if input.IsKeyDown(KEY_ESCAPE) then
		if input.IsKeyDown(KEY_ESCAPE) and gui.IsGameUIVisible() then
		if ValidPanel(panel) then
			gui.HideGameUI()
			panel:Close()
		else
			gui.HideGameUI()
			panel = ui.Create("esc_menu")
		end
	end
	end
end)