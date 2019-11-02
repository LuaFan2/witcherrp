include("shared.lua")

function ENT:Draw()
    self:DrawModel()
    local Pos = self:GetPos()
    local Ang = self:GetAngles()

    surface.SetFont("ChatFont")
    local text = rp.formatMoney(self:Getamount())
    local TextWidth = surface.GetTextSize(text)

    cam.Start3D2D(Pos + Ang:Up() * 0.82, Ang, 0.1)
        draw.WordBox(2, -TextWidth * 0.5, -10, text, "ChatFont", Color(140, 0, 0, 100), Color(255, 255, 255, 255))
    cam.End3D2D()

    Ang:RotateAroundAxis(Ang:Right(), 180)

    cam.Start3D2D(Pos, Ang, 0.1)
        draw.WordBox(2, -TextWidth * 0.5, -10, text, "ChatFont", Color(140, 0, 0, 100), Color(255, 255, 255, 255))
    cam.End3D2D()
end

function ENT:Think()
end
