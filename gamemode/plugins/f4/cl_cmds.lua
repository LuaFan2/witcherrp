local commands = {}
rp = rp or {}

function rp.AddMenuCommand(cat, name, cback, custom)
	if (not commands[cat]) then
		commands[cat] = {}
	end

	table.insert(commands[cat], {
		name = name,
		cback = cback,
		custom = custom or function() return true end
	})
end

cat = 'Деньги'

rp.AddMenuCommand(cat, 'Передать деньги', function()
	ui.StringRequest('Количество', 'Сколько вы хотите передать?', '', function(a)
		rp.RunCmd('give', {tonumber(a)})
	end)
end)

rp.AddMenuCommand(cat, "Выбросить деньги", function() ui.StringRequest('Количество', 'Сколько вы хотите бросить?', '', function(a)
		rp.RunCmd('dropmoney', {tonumber(a)})
	end)
end)

rp.AddMenuCommand(cat, 'Выписать чек', function()
ui.PlayerRequest(function(v)
		ui.StringRequest('Чек', 'Сколько вы хотите выписать?', '', function(a)
			if IsValid(v) then
				rp.RunCmd('cheque', {v:GetName(), tonumber(a)})
			end
		end)
	end)
end)

cat = 'Roleplay'

rp.AddMenuCommand(cat, "Сменить имя", function() ui.StringRequest('Смена имени', 'Какое имя вы бы хотели иметь?', '', function(n)
		rp.RunCmd('name', {tostring(n)})
	end)
end)

cat = 'Рандом'

rp.AddMenuCommand(cat, 'Случайное число', 'roll')
rp.AddMenuCommand(cat, 'Бросить кубики', 'dice')
rp.AddMenuCommand(cat, 'Вытащить карту', 'card')

local PANEL = {}

function PANEL:Init()
	self.Cats = {}
	self.Rows = {}
	self.List = ui.Create('ui_listview', self)
	self.List.Paint = function() end
	self:AddCat('Деньги', commands['Деньги'])
	self:AddCat('Roleplay', commands['Roleplay'])
	for k, v in pairs(commands) do
		self:AddCat(k, v)
	end
end

function PANEL:PerformLayout()
	self.List:SetPos(5, 5)
	self.List:SetSize(self:GetWide() - 10, self:GetTall() - 10)
end

function PANEL:Close()
	self:Close()
end

function PANEL:AddCat(cat, tab)
	tab = table.FilterCopy(tab, function(v) return v.custom() end)

	if (#tab > 0) then
		if (not self.Cats[cat]) then
			self.List:AddSpacer(cat):SetSize(self.List:GetWide(), 25)

			for k, v in ipairs(tab) do
				local row = self.List:AddRow(v.name)
				row:SetSize(self.List:GetWide(), 25)

				row.DoClick = isstring(v.cback) and function()
					rp.RunCmd(v.cback, {})
				end or v.cback
				table.insert(self.Rows, row)
			end
			self.Cats[cat] = true
		end
	end
end

vgui.Register('rp_cmds', PANEL, 'Panel')