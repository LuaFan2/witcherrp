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

local plyModel = rp.Config.StartModels[math.random(#rp.Config.StartModels)]

function PANEL:Init()	
	self:SetSize(ScrW(), ScrH())
	self:MakePopup()
	
	local f = ui.Create("ui_newchar_field", self)
	f:Center()
	local x, y = f:GetPos()
	f:SetPos(x, 0)
	f:SetData("Name")
	
	local model = ui.Create("DModelPanel", self)
	model:SetSize(400, 600)
	model:Center()
	model:SetDirectionalLight( BOX_TOP, Color( 255, 255, 255 ) )
	model:SetDirectionalLight( BOX_FRONT, Color( 255, 255, 255 ) )
	model:SetAmbientLight( Color( 255, 0, 0, 255 ) )
	model:SetModel(plyModel)
	
	model.LayoutEntity = function() return end
	
	model.OnMousePressed = function() 
		plyModel = rp.Config.StartModels[math.random(#rp.Config.StartModels)]
		model:SetModel(plyModel)
	end
	
	local button = ui.Create("ui_wbutton", self)
	button:SetText(v)
	button:Center()
	button:SetText("Create character")
	local x, y = button:GetPos()
	button:SetPos(x, ScrH()*0.95)
	
	button.onClick = function()
		net.Start("witcher.character.Init")
		net.WriteString(f:GetValue())
		net.WriteString(plyModel)
		net.SendToServer()
		
		net.Receive("witcher.character.Result", function(len, ply) 
			result = net.ReadBool()
			
			if not result then
				alert = ui.Create("ui_walert", self)
				alert:SetText("Character name entered is not available")
			else
				self:Remove()
			end
		end)
	end
end

function PANEL:Paint(w, h)
	surface.SetMaterial(Material( "black.jpg" ))
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawTexturedRect(0, 0, w, h)
end

vgui.Register("ui_newchar", PANEL, 'EditablePanel')