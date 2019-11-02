local PANEL = {}

function PANEL:SetData(name, ftype)
	self.name = name
	self.type = ftype
end

function PANEL:GetValue()
	return self.val
end

function PANEL:SetValue(v)
	self.val = v
end

function PANEL:GetData()
	return self.name, self.type
end

function PANEL:Paint(w, h)
	surface.SetDrawColor( 255, 255, 255, 255 )
	
	local n, t = self:GetData()
	
	surface.DrawRect(0, 0, w, 40)
	
	draw.SimpleTextOutlined(n, 'ui.witcher', w*0.5, h * 0.3, ui.col.White, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, ui.col.Black)
end

function PANEL:Init()
	self:SetSize(449, 60)
	self.val = ""
	
	local entry = ui.Create("DTextEntry", self)
	entry:SetPos(0,40)
	entry:SetSize(450,20)
end

vgui.Register("ui_newchar_field", PANEL, 'Panel')

PANEL = {}

local fields = {{pos = 1, name = "Nick", ftype = "text"}, {pos = 2, name = "Age", ftype = "text"}}

function PANEL:Init()
	self:SetSize(ScrW(), ScrH())
	self:MakePopup()
	
	table.SortByMember(fields, "pos", true)
	
	for k, v in ipairs(fields) do
		local p = fields[k].pos - 1
		f = ui.Create("ui_newchar_field", self)
		f:SetPos(0, p*70)
		f:SetData(fields[k].name, fields[k].ftype)
	end
end

function PANEL:Paint(w, h)
	surface.SetMaterial(Material( "black.jpg" ))
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect(0, 0, w, h)
	
	surface.DrawLine(450, 0, 450, h)
	surface.DrawLine(800, 0, 800, h)
end

vgui.Register("ui_newchar_blank", PANEL, 'Panel')

PANEL = {}

function PANEL:Init()
	local blank = ui.Create("ui_newchar_blank", self)
end

function PANEL:Paint(w, h)

end

vgui.Register("ui_newchar", PANEL, 'Panel')