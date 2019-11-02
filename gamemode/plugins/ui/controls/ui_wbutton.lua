local PANEL = {}

function PANEL:Init()
	self:SetSize(212, 30)
	self:SetMouseInputEnabled( true )
end

function PANEL:Paint(w,h)
	local TextX, TextY = 0, 0
	local TextColor = Color( 255, 000, 000, 255 )

	draw.SOutlinedBox(0, 0, w, h, 1, ui.col.Black)

	if self:IsHovered() then
		draw.SOutlinedBox(0, 0, w, h, 2, ui.col.ButtonHover)
	end
	
	draw.SimpleTextOutlined(self:GetText(), 'ui.witcher', w*0.5, h * 0.5, ui.col.White, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, ui.col.Black)
end

function PANEL:SetText( t )
	self.text = tostring( t )
end

function PANEL:GetText()
	return self.text or ""
end

function PANEL:OnMousePressed(mc)
	if mc == 107 then
		self.onClick()
	end
end

vgui.Register("ui_wbutton", PANEL, 'Panel')