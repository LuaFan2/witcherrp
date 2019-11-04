local PANEL = {}

local panel
local atext

function PANEL:SetText(text)
	atext = text
end

function PANEL:Init()
	self:SetSize(ScrW(), ScrH())
	self:MakePopup()
	
	panel = self
	
	timer.Create( 'alerttimer'..math.random(10), 2, 1, function()
		self:Close()
	end)
end

function PANEL:Close()
	panel:Remove()
end

function PANEL:Paint(w, h)
	surface.SetDrawColor( 0, 0, 0, 200 )
	surface.DrawRect(0, 0, w, h)
	
	draw.SimpleTextOutlined(atext, 'ui.witcher', w*0.5, h * 0.5, ui.col.White, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, ui.col.Black)
end

vgui.Register('ui_walert', PANEL, 'Panel')