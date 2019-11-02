if (SERVER) then
	local function getLogName(entity)
		local class = entity:GetClass():lower()

		if (class:find("prop")) then
			local propType = class:sub(6)

			if (propType == "physics") then
				propType = "prop"
			end

			class = propType.." ("..entity:GetModel()..")"
		end

		return class
	end

	function GM:PlayerSpawnObject(client, model, skin)
		if (!client:IsAdmin() and PROP_BLACKLIST[model:lower()]) then
			return false
		end
		return true
	end

	function GM:PhysgunPickup(client, entity)
		if (entity:GetCreator() == client) then
			return true
		end
	end

	function GM:CanProperty(client, property, entity)
		if (entity:GetCreator() == client and (property == "remover" or property == "collision")) then
			return true
		end
	end

	function GM:CanTool(client, trace, tool)
		local entity = trace.Entity

		if (IsValid(entity) and entity:GetCreator() == client) then
			return true
		end
	end

	function GM:PlayerSpawnedEntity(client, entity)
		entity:SetCreator(client)
	end

	function GM:PlayerSpawnedProp(client, model, entity)
		hook.Run("PlayerSpawnedEntity", client, entity)
	end

	GM.PlayerSpawnedEffect = GM.PlayerSpawnedProp
	GM.PlayerSpawnedRagdoll = GM.PlayerSpawnedProp

	function GM:PlayerSpawnedNPC(client, entity)
		hook.Run("PlayerSpawnedEntity", client, entity)
	end

	GM.PlayerSpawnedSENT = GM.PlayerSpawnedNPC
	GM.PlayerSpawnedVehicle = GM.PlayerSpawnedNPC
end