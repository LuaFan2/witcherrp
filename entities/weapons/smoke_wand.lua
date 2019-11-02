AddCSLuaFile()

SWEP.Base = 'magic_base'

SWEP.Category = "Magic"

SWEP.Purpose = ""



SWEP.Weight = 5

SWEP.AvoidCheck = true

SWEP.Spawnable	= true

SWEP.UseHands	= true

SWEP.DrawAmmo	= true



SWEP.ViewModelFOV	= 70

SWEP.Slot			= 2

SWEP.SlotPos		= 5



--[[ ЗОНА НАСТРОЙКИ ]]--

SWEP.PrintName	= "Резонирующий двемерский посох дыма"	-- название свепа

SWEP.Primary.ClipSize		= -1			-- кол-во патрон в обойме (-1, если не требуется)

SWEP.Primary.DefaultClip	= 0			-- кол-во патрон, которое выдается при спавне (-1, если не требуется)

SWEP.DrawCrosshair = true



SWEP.HoldType = "knife"

SWEP.ViewModelFlip = false

SWEP.UseHands = true

SWEP.ShowViewModel = false

SWEP.ShowWorldModel = false

function SWEP:SecondaryAttack()
	ParticleEffect( "ExplosionCore_wall", self.Owner:EyePos() + (self.Owner:GetAimVector() * 16), Angle( 0, 0, 0 ) )
end

--[[ КОНЕЦ ЗОНЫ НАСТРОЙКИ! За этой линией нет параметров, которые нужно настраивать. ]]--