local PANEL = {}

local panel

local buttons = {["Load game"] = function() print("Yes") end, ["New game"] = function() PANEL:Close() ui.Create("ui_newchar") end, ["Credits"] = function() end, ["Exit"] = function() LocalPlayer():ConCommand("disconnect" ) end}
local bSort = {"Load game", "New game", "Credits", "Exit"}

function PANEL:Init()
	self:SetSize(ScrW(), ScrH())
	self:MakePopup()
	
	panel = self
	
	surface.PlaySound( "menu_theme.mp3" )

	for k, v in ipairs(bSort) do
		local button = ui.Create("ui_wbutton", self)
		button:SetText(v)
		button:SetPos(112, 250 + (table.index(v, bSort)*40))
		
		button.onClick = function()
			buttons[v]()
		end
	end
end

function PANEL:Close()
	panel:Remove()
end

function PANEL:Paint(w, h)
	surface.SetMaterial(Material( "main/bg.jpg" ))
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect(0, 0, w, h)
	
	surface.DrawLine( 110, 0, 110, h )
	
	surface.SetDrawColor( 0, 0, 0, 200 )
	draw.LinearGradient(111, 0, 215, 1024, {
		{offset = 0, color = Color(0, 0, 0, 255)},
		{offset = 0.5, color = Color(0, 0, 0, 255)},
		{offset = 1, color = Color(0, 0, 0, 200)}
	}, false)
	
	surface.SetDrawColor( 255,255,255,255 )
	surface.DrawLine( 325, 0, 325, h )
	
	surface.SetMaterial(Material( "main/logo.png" ))
	surface.DrawTexturedRect( 110, 40, 225, 100 )
	
	draw.SimpleTextOutlined('v '..GAMEMODE.Version, 'ui.witcher', 220, h * 0.9, ui.col.White, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, ui.col.Black)
end

vgui.Register('ui_main', PANEL, 'Panel')