ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Money"
ENT.Author = "Deleted"
ENT.Spawnable = false
ENT.IsSpawnedMoney = true

function ENT:SetupDataTables()
    self:NetworkVar("Int",0,"amount")
end