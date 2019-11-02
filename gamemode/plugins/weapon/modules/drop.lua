local ply = FindMetaTable("Player")


function GM:canDropWeapon(ply, weapon)
    if not IsValid(weapon) then return false end
    local class = string.lower(weapon:GetClass())

    local jobTable = ply:getJob()
    if jobTable.weapons and table.HasValue(jobTable.weapons, class) then return false end

    if drop.Disallow[class] then return false end

    if not drop.ResctrictDrop then return true end

    return false
end


function ply:dropDRPWeapon(weapon)
    if drop.ResctrictDrop then
        return
    end

    local primAmmo = self:GetAmmoCount(weapon:GetPrimaryAmmoType())
    self:DropWeapon(weapon) -- Drop it so the model isn't the viewmodel

    local ent = ents.Create("weapon")
    local model = (weapon:GetModel() == "models/weapons/v_physcannon.mdl" and "models/weapons/w_physics.mdl") or weapon:GetModel()
    model = util.IsValidModel(model) and model or "models/weapons/w_rif_ak47.mdl"

    ent:SetPos(self:GetShootPos() + self:GetAimVector() * 30)
    ent:SetModel(model)
    ent:SetSkin(weapon:GetSkin() or 0)
    ent:SetWeaponClass(weapon:GetClass())
    ent.nodupe = true
    ent.clip1 = weapon:Clip1()
    ent.clip2 = weapon:Clip2()
    ent.ammoadd = primAmmo

    self:RemoveAmmo(primAmmo, weapon:GetPrimaryAmmoType())
    self:RemoveAmmo(self:GetAmmoCount(weapon:GetSecondaryAmmoType()), weapon:GetSecondaryAmmoType())

    ent:Spawn()

    weapon:Remove()
end

ply._DropWeapon = ply.DropWeapon

function ply:DropWeapon()
    local ent = self:GetActiveWeapon()
    if not ent:IsValid() or ent:GetModel() == "" then
        return 
    end

    local canDrop = GM:canDropWeapon(self, ent)
    if not canDrop then
        return 
    end

    ply:DoAnimationEvent(ACT_GMOD_GESTURE_ITEM_DROP)

    timer.Simple(1, function()
        if IsValid(self) and IsValid(ent) and self:Alive() and ent:GetModel() ~= "" and not IsValid(ply:GetObserverTarget()) then
            self:dropDRPWeapon(ent)
        end
    end)
    return 
end