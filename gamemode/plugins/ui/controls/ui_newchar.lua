local PANEL = {}

function PANEL:SetData(name)
	self.name = name
end

function PANEL:GetValue()
	return self.entry:GetValue()
end

function PANEL:SetValue(v)
	self.entry:SetValue(v)
end

function PANEL:GetData()
	return self.name
end

function PANEL:Paint(w, h)
	surface.SetDrawColor( 255, 255, 255, 255 )
	
	local n = self:GetData()
	
	surface.DrawRect(1, 0, w, 40)
	draw.SimpleTextOutlined(n, 'ui.witcher', w*0.5, h * 0.3, ui.col.White, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, ui.col.Black)
end

function PANEL:Init()
	self:SetSize(349, 60)
	
	self.entry = ui.Create("DTextEntry", self)
	self.entry:SetPos(1,40)
	self.entry:SetSize(349,20)
end

vgui.Register("ui_newchar_field", PANEL, 'Panel')

PANEL = {}

function PANEL:Init()
	
end

function PANEL:Paint(w, h)
	
end

vgui.Register("ui_newchar_blank", PANEL, 'Panel')

PANEL = {}

function PANEL:Init()	
	self:SetSize(ScrW(), ScrH())
	self:MakePopup()
	
	f = ui.Create("ui_newchar_field", self)
	f:Center()
	local x, y = f:GetPos()
	f:SetPos(x, 0)
	f:SetData("Name")
	
	model = ui.Create("DModelPanel", self)
	model:SetSize(400, 800)
	model:Center()
	model:SetDirectionalLight( BOX_TOP, Color( 255, 255, 255 ) )
	model:SetDirectionalLight( BOX_FRONT, Color( 255, 255, 255 ) )
	model:SetModel(LocalPlayer():GetModel())
end

function PANEL:Paint(w, h)
	surface.SetMaterial(Material( "black.jpg" ))
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect(0, 0, w, h)
end

vgui.Register("ui_newchar", PANEL, 'EditablePanel')