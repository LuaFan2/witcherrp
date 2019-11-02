AddCSLuaFile ()
DEFINE_BASECLASS('magic_base')


if SERVER then 
 	SWEP.Weight = 5
elseif CLIENT then
	SWEP.PrintName = "Magic Weapon Base"
	SWEP.Slot = 2
	SWEP.SlotPos = 1
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end
 
SWEP.Author = "N/A"
 
SWEP.Category = "Magic"
 
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
 
SWEP.ViewModel = "models/weapons/c_pistol.mdl" -- This is the model used for clients to see in first person.
SWEP.WorldModel = "models/weapons/c_pistol.mdl" -- This is the model shown to all other clients and in third-person.

SWEP.Primary.ClipSize = -1
 
SWEP.Primary.DefaultClip = -1
 
SWEP.Primary.Automatic = false
 
SWEP.Primary.Ammo = "none"
 
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.ManaGain = 1

SWEP.ManaStorage = 0
SWEP.Mana = 0
SWEP.ManaCost = 0
 
local ShootSound = Sound("Weapon_MegaPhysCannon.ChargeZap")
 
function SWEP:SetupDataTables()
	self:NetworkVar("Float", 0, "NextReload")
end

function SWEP:Initialize()
	self:SetHoldType(self.HoldType)
	timer.Create("hpwrewrite_adnimation_" .. self:EntIndex(), 1, 0, function()
			if IsValid(self) and self.Mana < self.ManaStorage then self.Mana = self.Mana + self.ManaGain end
		end)
end

function SWEP:PrimaryAttack()
	if self.Mana < self.ManaCost then return end
	self.Mana = self.Mana - self.ManaCost
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
end

function SWEP:SecondaryAttack()
	if self.Mana < self.ManaCost then return end
	self.Mana = self.Mana - self.ManaCost
	self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)
end

function SWEP:Reload()
	self:SetNextReload(CurTime() + self._Reload.Delay)
end

function SWEP:CanReload()
	return CurTime() > self:GetNextReload()
end

function SWEP:Holster()
	return true
end

function SWEP:Think()
	if not self.ManaUpdate or self.PlayerUpdate < CurTime() then
		if self.Mana > self.ManaStorage then self.Mana = self.ManaStorage end
		self.ManaUpdate = CurTime() + 1
	end

end