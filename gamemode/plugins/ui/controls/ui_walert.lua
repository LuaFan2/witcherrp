local PANEL = {}

local panel
local alert

function PANEL:SetText(text)
	alert:SetText(text)
end

function PANEL:Init()
	self:SetSize(ScrW(), ScrH())
	self:MakePopup()
	
	panel = self
	
	alert = ui.Create("DLabel", panel)
	alert:SetFont("ui.witcher")
	alert:Center()
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
end

vgui.Register('ui_walert', PANEL, 'Panel')