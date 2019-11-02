local PANEL = {}

local panel

local buttons = {["Settings"] = function() gui.ActivateGameUI() panel:Close() end, ["Exit"] = function() LocalPlayer():ConCommand("disconnect" ) end}
local bSort = {"Settings", "Exit"}

function PANEL:Init()
	self:SetSize(ScrW(), ScrH())
	self:MakePopup()
	
	panel = self
	
	for k, v in ipairs(bSort) do
		local button = ui.Create("ui_wbutton", self)
		button:SetText(v)
		button:Center()
		
		local x, y = button:GetPos()
		
		button:SetPos(x, y-80 + (table.index(v, bSort) * 40))
		
		button.onClick = function()
			buttons[v]()
		end
	end
end

function PANEL:Close()
	panel:Remove()
end

function PANEL:Paint(w, h)
	surface.SetDrawColor( 0, 0, 0, 200 )
	surface.DrawRect(0, 0, w, h)
end

vgui.Register('esc_menu', PANEL, 'Panel')