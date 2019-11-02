AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_lab/clipboard.mdl")
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    self.nodupe = true
    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:Wake()
		phys:SetMass(1)
    end
end


function ENT:Use(activator, caller)
    local owner = self:Getowner()
    local recipient = self:Getrecipient()
    local amount = self:Getamount() or 0

    if (IsValid(activator) and IsValid(recipient)) and activator == recipient then
        activator:AddMoney(amount)
        self:Remove()
    elseif IsValid(owner) and owner == activator then
        owner:AddMoney(self:Getamount()) -- return the money on the cheque to the owner.
        self:Remove()
    elseif not IsValid(recipient) then self:Remove()
    end
end

function ENT:OnTakeDamage(dmg)
    self:TakePhysicsDamage(dmg)

    local typ = dmg:GetDamageType()
    if bit.band(typ, bit.bor(DMG_FALL, DMG_VEHICLE, DMG_DROWN, DMG_RADIATION, DMG_PHYSGUN)) > 0 then return end

    self.USED = true
    self.hasMerged = true
    self:Remove()
end

function ENT:onPlayerDisconnected(ply)
    if self:Getowner() == ply or self:Getrecipient() == ply then
        self:Remove()
    end
end