--*[[ Variables ]]
local IsLoggedIn = false

--*[[ Events ]]

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	IsLoggedIn = true
	Player.Update()
	Weapon.Reset()
	for k, data in pairs(Config.RepairLocations) do
		Config.RepairLocations[k].IsRepairing = data.IsRepairing
		Config.RepairLocations[k].RepairingData = data.RepairingData
	end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    IsLoggedIn = false
	Player.Reset()
	Weapon.Reset()
    for k, v in pairs(Config.RepairLocations) do
        Config.RepairLocations[k].IsRepairing = false
        Config.RepairLocations[k].RepairingData = {}
    end
end)

RegisterNetEvent('weapons:client:SyncRepairShops', function(NewData, key)
    Config.RepairLocations[key].IsRepairing = NewData.IsRepairing
    Config.RepairLocations[key].RepairingData = NewData.RepairingData
end)

--? This gets called from inventory, when equipping a weapon
RegisterNetEvent('weapons:client:SetCurrentWeapon', function(data, bool)
	-- TODO: This causes drawing the weapon on resource start, probably fine but could be fixed
    Weapon.Actions.NewWeapon(data, bool)
end)

--? This gets called from inventory if a weapon if broken
RegisterNetEvent('weapons:ResetHolster', function()
	QBCore.Functions.Notify('This weapon is broken, you need to get it reapired first!', 'error')
	Player.Actions.HolsterWeapon()
	Weapon.Reset()
end)

RegisterNetEvent('weapon:client:AddAmmo', function(ammoType, amount, ammoData)
    if Weapon.Data then
        Weapon.Actions.Reload(ammoType, ammoData, amount)
    else
        QBCore.Functions.Notify('You\'re not holding a weapon.', 'error')
    end
end)

RegisterNetEvent('weapons:client:SetWeaponQuality', function(amount)
    if Weapon.Data and next(Weapon.Data) then
        TriggerServerEvent('weapons:server:SetWeaponQuality', Weapon.Data, amount)
    end
end)

RegisterNetEvent('weapons:client:EquipAttachment', function(ItemData, attachment)
    if Weapon.Hash ~= `WEAPON_UNARMED` then
        if Config.Attachments[Weapon.Name] then
            if Config.Attachments[Weapon.Name][attachment] then
                TriggerServerEvent('weapons:server:EquipAttachment', ItemData, Weapon.Data, Config.Attachments[Weapon.Name][attachment])
            else
                QBCore.Functions.Notify('That attachment can\'t be used on this weapon.', 'error')
            end
        end
    else
        QBCore.Functions.Notify('You\'re not holding a weapon.', 'error')
    end
end)

RegisterNetEvent('addAttachment', function(component)
    GiveWeaponComponentToPed(Player.Ped, Weapon.Hash, GetHashKey(component))
end)

RegisterNetEvent('weapons:client:EquipTint', function(tint)
    SetPedWeaponTintIndex(Player.Ped, Weapon.Hash, tint)
end)



--*[[ CONTROL THREADS ]]

CreateThread(function()
	Weapon.Reset()
	Player.Reset()
	while true do
		local sleep = 10
		if IsLoggedIn then
			--? Lockout shooting if required
			if not Player.CanShoot or not Weapon.CanFire then
				DisableControlAction(0, 24, true) -- Attack
				DisableControlAction(0, 257, true) -- Attack 2
				DisablePlayerFiring(Player.Ped, true)
				if IsPedInAnyVehicle(Player.Ped, true) then
					SetPlayerCanDoDriveBy(Player.ID, false)
				end
				sleep = 0
			else
				EnableControlAction(0, 24, true) -- Attack
				EnableControlAction(0, 257, true) -- Attack 2
				if IsPedInAnyVehicle(Player.Ped, true) then
					SetPlayerCanDoDriveBy(Player.ID, true)
				end
				--? Make the weapon handle firing
				Weapon.Updater.IsFiring()
				if Weapon.IsFiring then sleep = 1 end
			end
		else
			sleep = 1000
		end
		Wait(sleep)
	end
end)
