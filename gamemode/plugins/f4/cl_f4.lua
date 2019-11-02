local F4

function F4M()
	if IsValid(F4) then F4:SetVisible(false) end
	local w, h = ScrW() * 0.75, ScrH() * 0.7 + 30 * 0

	F4 = ui.Create('ui_frame', function(self)
		self:SetTitle('Меню Сервера')
		self:SetSize(w, h)
		self:MakePopup()
		self:Center()
		local keydown = false

		function self:Think()
			if input.IsKeyDown(KEY_F4) and keydown then
				self:Close()
			elseif (not input.IsKeyDown(KEY_F4)) then
				keydown = true
			end
		end
	end)
	
	local tabs = ui.Create('ui_tablist', F4)
	tabs.Paint = function() end 
	tabs._yoffset = nil
	tabs:DockToFrame()
	
	-- Commands
	tabs:AddTab('Действия', ui.Create("rp_cmds"), true)
end

net.Receive( "f4menu", F4M)