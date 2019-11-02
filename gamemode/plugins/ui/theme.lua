local SKIN 	= {
	PrintName 	= 'SUP',
	Author 	 	= 'aStonedPenguin'
}

local color_sup 			= ui.col.SUP
local color_background 		= ui.col.Background
local color_outline 		= ui.col.Outline
local color_hover 			= ui.col.Hover
local color_button 			= ui.col.Button
local color_button_hover	= ui.col.ButtonHover
local color_close 			= ui.col.Close
local color_close_bg 		= ui.col.CloseBackground
local color_close_hover 	= ui.col.CloseHovered

local color_offwhite 		= ui.col.OffWhite
local color_flat_black 		= ui.col.FlatBlack
local color_black 			= ui.col.Black
local color_white 			= ui.col.White
local color_red 			= ui.col.Red

-- Frames    
function SKIN:PaintFrame(self, w, h)
	draw.Blur(self)
	draw.OutlinedBox(0, 0, w, h, color_background, color_outline)
	draw.OutlinedBox(0, 0, w, 28, color_background, color_outline)
end

function SKIN:PaintPanel(self, w, h)
	draw.OutlinedBox(0, 0, w, h, color_background, color_outline)
end

function SKIN:PaintShadow() end


-- Buttons    
function SKIN:PaintButton(self, w, h)
	if (not self.m_bBackground) then return end

	if self:GetDisabled() then
		draw.OutlinedBox(0, 0, w, h, color_flat_black, color_outline)
	elseif (self.Active == true) then
		draw.OutlinedBox(0, 0, w, h, self.BackgroundColor or color_sup, color_outline)
	else
		draw.OutlinedBox(0, 0, w, h, (self.Hovered and  color_button_hover or self.BackgroundColor or color_button), (self.Hovered and color_outlineHovered or color_outline))
	end

	self:SetTextColor((self.Hovered and (not self:GetDisabled()) and (not self.Active)) and color_black or color_white)

	if (not self.fontset) then
		self:SetFont('ui.20')
		self.fontset = true
	end
end

function SKIN:PaintAvatarImage(self, w, h)
	if self.Hovered then
		draw.Box(0, 0, w, h, color_hover)
	end
end


-- Close Button                                               
function SKIN:PaintWindowCloseButton(panel, w, h)
	if (not panel.m_bBackground) then return end

	draw.OutlinedBox(0, 0, w, h, (panel.Hovered and color_close_hover or color_close_bg), color_outline)

	surface.SetDrawColor(color_close)
		
	local xX = math.floor((w / 2) - 5)
	local xY = math.floor((h / 2) - 5)
		
	surface.DrawLine(xX, xY, xX + 10, xY + 10)
	surface.DrawLine(xX, xY + 10, xX + 10, xY)
end


-- Scrollbar
function SKIN:PaintVScrollBar(self, w, h) end
function SKIN:PaintButtonUp(self, w, h) end
function SKIN:PaintButtonDown(self, w, h) end
function SKIN:PaintButtonLeft(self, w, h) end
function SKIN:PaintButtonRight(self, w, h) end

function SKIN:PaintScrollBarGrip(self, w, h)
	draw.Box(0, 0, w, h, color_sup)
end

function SKIN:PaintScrollPanel(self, w, h)
	draw.OutlinedBox(0, 0, w, h, color_background, color_outline)
end

function SKIN:PaintUIScrollBar(self, w, h)
	draw.Box(0, self.scrollButton.y, w, self.height, color_sup)
end


-- Slider
function SKIN:PaintUISlider(self, w, h)
	SKIN:PaintPanel(self, w, h)
	draw.Box(1, 1, self:GetValue() * w - self:GetValue() * 16, h - 2, color_sup)
end


-- Text Entry
function SKIN:PaintTextEntry(self, w, h)
	draw.OutlinedBox(0, 0, w, h, color_offwhite, color_outline)

	self:DrawTextEntryText(color_black, color_sup, color_black)
end


-- List View
function SKIN:PaintUIListView(self, w, h) 
	draw.OutlinedBox(0, 0, w, h, color_offwhite, color_outline)
end


function SKIN:PaintListView(self, w, h) 
	--draw.OutlinedBox(0, 0, w, h, color_offwhite, color_outline)
end

function SKIN:PaintListViewLine(self, w, h) -- todo, just make a new control and never use this
	if self.m_bAlt then
		draw.Box(0, 0, w, h, (self:IsSelected() or self:IsHovered()) and color_sup or color_hover)
	else
		draw.Box(0, 0, w, h, (self:IsSelected() or self:IsHovered()) and color_sup or color_background)
	end

	for k, v in ipairs(self.Columns) do
		if (self:IsSelected() or self:IsHovered()) then
			v:SetTextColor(color_black)
			v:SetFont('ui.20')
		else
			v:SetTextColor(color_white)
			v:SetFont('ui.17')
		end
	end
end


-- Checkbox
function SKIN:PaintCheckBox(self, w, h)
	draw.OutlinedBox(0, 0, w, h, color_background, (self:GetChecked() and color_outline or color_outline))

	if self:GetChecked() then 
		draw.Box(4, 4, w - 8, h - 8, color_sup)
	end
end


-- Tabs
function SKIN:PaintTabButton(self, w, h)
	draw.OutlinedBox(0, 0, w, h, color_background, color_outline)

	self:SetTextColor(color_white)

	if self.Hovered then
		draw.Box(1, 1, 6, h - 2, color_sup)
		draw.Box(w - 6, 1, 6, h - 2, color_sup)
	elseif self.Active then
		draw.Box(1, 1, 3, h - 2, color_sup)
		draw.Box(w - 3, 1, 6, h - 2, color_sup)
	end
end

function SKIN:PaintTabListPanel(self, w, h)
	draw.OutlinedBox(149, 0, w - 149, h, color_background, color_outline)
end


-- ComboBox
function SKIN:PaintComboBox(self, w, h)
	if IsValid(self.Menu) and (not self.Menu.SkinSet) then
		self.Menu:SetSkin('SUP')
		self.Menu.SkinSet = true
	end

	self:SetTextColor(((self.Hovered or self.Depressed or self:IsMenuOpen()) and color_black or color_white))

	draw.OutlinedBox(0, 0, w, h, ((self.Hovered or self.Depressed or self:IsMenuOpen()) and color_button_hover or color_background), color_outline)
end

function SKIN:PaintComboDownArrow(self, w, h)
	surface.SetDrawColor(color_sup)
	draw.NoTexture()
	surface.DrawPoly({
		{x = 0, y = w * .5},
		{x = h, y = 0},
		{x = h, y = w}
	})
end


-- DMenu
function SKIN:PaintMenu(self, w, h)
	draw.OutlinedBox(0, 0, w, h, color_background, color_outline)
end

function SKIN:PaintMenuOption(self, w, h)
	if (not self.FontSet) then
		self:SetFont('ui.22')
		self:SetTextInset(5, 0)
		self.FontSet = true
	end
	
	self:SetTextColor(color_white)

	draw.OutlinedBox(0, 0, w, h + 1, color_background, color_outline)
	
	if self.m_bBackground and (self.Hovered or self.Highlight) then
		draw.OutlinedBox(0, 0, w, h + 1, color_sup , color_outline)
		self:SetTextColor(color_button_hover)
	end
end


-- DPropertySheet
local propbackground = Color(200, 200, 200)
local prophovered = ui.col.ButtonHover
local propactive = Color(color_sup.r, color_sup.g, color_sup.b - 20)

function SKIN:PaintPropertySheet(self, w, h)
	draw.Box(0, self:GetActiveTab():GetTall(), w, h - self:GetActiveTab():GetTall(), propbackground)
end

function SKIN:PaintTab(self, w, h)
	local active = self:GetPropertySheet():GetActiveTab() == self
	
	if (active) then
		self:SetTextColor(propactive)
		draw.Box(0, 0, w, h, propbackground)
	elseif (self:IsHovered()) then
		self:SetTextColor(prophovered)
	else
		self:SetTextColor(propbackground)
	end
end

derma.DefineSkin('SUP', 'SUP\'s derma skin', SKIN)