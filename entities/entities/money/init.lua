AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_c17/SuitCase_Passenger_Physics.mdl")
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    self:SetCollisionGroup(COLLISION_GROUP_WEAPON)

    self.nodupe = true

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:Wake()
		phys:SetMass(1)
    end
end

function ENT:Use(activator, caller)
    if self.USED or self.hasMerged then return end
    local amount = self:Getamount()
    activator:AddMoney(amount)
    self:Remove()
end

function ENT:OnTakeDamage(dmg)
    self:TakePhysicsDamage(dmg)

    local typ = dmg:GetDamageType()
    if bit.band(typ, bit.bor(DMG_FALL, DMG_VEHICLE, DMG_DROWN, DMG_RADIATION, DMG_PHYSGUN)) > 0 then return end

    self.USED = true
    self.hasMerged = true
    self:Remove()
end

function ENT:StartTouch(ent)
    -- the .USED var is also used in other mods for the same purpose
    if ent:GetClass() ~= "money" or self.USED or ent.USED or self.hasMerged or ent.hasMerged then return end

    -- Both hasMerged and USED are used by third party mods. Keep both in.
    ent.USED = true
    ent.hasMerged = true
	ent:Remove()
    self:Setamount(self:Getamount() + ent:Getamount())
end