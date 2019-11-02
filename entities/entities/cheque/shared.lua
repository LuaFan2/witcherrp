ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Cheque"
ENT.Author = "Deleted"
ENT.Spawnable = false
ENT.IsDarkRPCheque = true

function ENT:SetupDataTables()
    self:NetworkVar("Entity", 0, "owner")
    self:NetworkVar("Entity", 1, "recipient")
    self:NetworkVar("Int", 0, "amount")
end
