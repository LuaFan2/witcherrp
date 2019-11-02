if SERVER then
	AddCSLuaFile("player_infocard.lua")
	AddCSLuaFile("player_row.lua")
	AddCSLuaFile("scoreboard.lua")
else
	include("scoreboard.lua")

	CreateScoreboard = function()
		if IsValid(ScoreBoard) then
			ScoreBoard:SetVisible(false)
		end

		ScoreBoard = ui.Create("scoreboard")

		return true
	end

	function GM:ScoreboardShow()
		if (not IsValid(ScoreBoard)) then
			CreateScoreboard()
		end
		gui.EnableScreenClicker(true)
		ScoreBoard:SetVisible(true)
		ScoreBoard:UpdateScoreboard(true)
		ScoreBoard:OpenAnimation()
		ScoreBoard:MoveToFront()
	end

	function GM:ScoreboardHide()
		gui.EnableScreenClicker(false)

		if (ScoreBoard and ScoreBoard:IsValid()) then
			ScoreBoard:CloseAnimation()
		end
	end
end