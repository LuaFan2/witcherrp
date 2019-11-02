include("shared.lua")

ENT.TextColors = {
    OtherToSelf = Color(0, 255, 0, 255),
    SelfToSelf = Color(255, 255, 0, 255),
    SelfToOther = Color(0, 0, 255, 255),
    OtherToOther = Color(255, 0, 0, 255)
}

function ENT:Draw()
    self:DrawModel()

    local owner = self:Getowner()
	local oPlayer = owner:IsPlayer()
    local recipient = self:Getrecipient()
	local rPlayer = recipient:IsPlayer()
    local localplayer = LocalPlayer()

    local Pos = self:GetPos()
    local Ang = self:GetAngles()
    local Up = Ang:Up()
    Up:Mul(0.9)
    Pos:Add(Up)

    surface.SetFont("ChatFont")
    local text = "Cheque for " .. (rPlayer and recipient:GetName() or "unknown") .. "\n" .. rp.formatMoney(self:Getamount()) .. "\n" .. "Signed by " .. (oPlayer and owner:Nick() or "unknown")

    cam.Start3D2D(Pos, Ang, 0.1)
        draw.DrawText(text, "ChatFont", surface.GetTextSize(text) * -0.5, -25, localplayer:IsValid() and (oPlayer and localplayer == owner and (rPlayer and localplayer == recipient and self.TextColors.SelfToSelf or self.TextColors.SelfToOther) or rPlayer and localplayer == recipient and self.TextColors.OtherToSelf) or self.TextColors.OtherToOther, 0)
    cam.End3D2D()
end