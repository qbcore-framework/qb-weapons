--*[[ Weapon Pseudo-Class ]]

--* Init data objects
Weapon = {}
Weapon.Data = {}
Weapon.Updater = {}
Weapon.Actions = {}

--* Weapon Methods
Weapon.Reset = function()
	Weapon.Ammo = 0
	Weapon.LastAmmo = 0
	Weapon.Hash = `WEAPON_UNARMED`
	Weapon.Name = ''
	Weapon.CanFire = true
	Weapon.IsFiring = false
	Weapon.Recoil = 0
	Weapon.Magazine = 0
	Weapon.MaxAmmo = 0
	Weapon.AmmoType = ''
	Weapon.UsesHolster = false
	if Config.debug then TriggerEvent('table', Weapon) end
end

Weapon.Actions.NewWeapon = function(data, canfire)
	Player.Update()
	--? Check to see if a weapon was passed
	if data then
		Weapon.Data = data
		Weapon.Hash = GetHashKey(data.name)
		Weapon.Name = data.name:upper()
		Weapon.Ammo = data.info.ammo
		Weapon.LastAmmo = data.info.ammo
		_, Weapon.MaxAmmo = GetMaxAmmo(Player.Ped, Weapon.Hash)
		Weapon.CanFire = canfire
		Weapon.Recoil = Config.Recoils[Weapon.Hash] or 0
		Weapon.Updater.UsesHolster()
		Weapon.Magazine = GetAmmoInClip(Player.Ped, Weapon.Hash)
		Weapon.AmmoType = QBCore.Shared.Weapons[Weapon.Hash]['ammotype']
		Player.Actions.DrawWeapon()
	--? If no data was passed, we're disarming
	else
		Player.Actions.HolsterWeapon()
		Weapon.Reset()
	end
end

Weapon.Actions.UpdateServer = function()
	local diff = Weapon.LastAmmo - Weapon.Ammo
	if diff > 0 then
		TriggerServerEvent('weapons:server:UpdateWeaponQuality', Weapon.Data, tonumber(diff))
		Weapon.LastAmmo = Weapon.Ammo
	end
	Weapon.Ammo = GetAmmoInPedWeapon(Player.Ped, Weapon.Hash)
	Weapon.Magazine = GetAmmoInClip(Player.Ped, Weapon.Hash)
	TriggerServerEvent('weapons:server:UpdateWeaponAmmo', Weapon.Data, tonumber(Weapon.Ammo))
end

Weapon.Updater.Ammo = function()
	-- TODO: I'm pretty sure inventory needs to be edited to store weapon ammo and magazine ammo properly.
	Weapon.Actions.UpdateServer()
end

Weapon.Updater.UsesHolster = function()
	if Config.HolsterWeapons[Weapon.Hash] then
		Weapon.UsesHolster = true
	else
		Weapon.UsesHolster = false
	end
end

Weapon.Actions.ApplyRecoil = function()
	if Weapon.Recoil > 0 then
		local recoilApplied = 0
		local camPitch = 0
		if GetFollowPedCamViewMode() ~= 4 then
			repeat
				Wait(0)
				camPitch = GetGameplayCamRelativePitch()
				SetGameplayCamRelativePitch(camPitch + 0.1, 0.2)
				recoilApplied = recoilApplied + 0.1
			until recoilApplied >= Weapon.Recoil
		else
			repeat
				Wait(0)
				camPitch = GetGameplayCamRelativePitch()
				if Weapon.Recoil > 0.1 then
					SetGameplayCamRelativePitch(camPitch + 0.6, 1.2)
					recoilApplied = recoilApplied + 0.6
				else
					SetGameplayCamRelativePitch(camPitch + 0.016, 0.333)
					recoilApplied = recoilApplied + 0.1
				end
			until recoilApplied >= Weapon.Recoil
		end
	end
end

Weapon.Updater.IsFiring = function()
	if IsPedShooting(Player.Ped) or IsControlJustPressed(0, 24) or EnableControlAction(0, 257, true) then
		Weapon.Updater.Ammo()
		Weapon.IsFiring = true
		TriggerEvent('inventory:client:CheckWeapon', Weapon.Name)

		--? Handle the 'leave a round in chamber, or put weapon away' case
		if Weapon.Ammo <= 0 then
			Weapon.CanFire = false
			Wait(650)	-- Minimum for this to work is 620 (on my machine)
			SetCurrentPedWeapon(Player.Ped, Weapon.Hash, true)
			Wait(100)
			Weapon.CanFire = true
		end

		if IsPedDoingDriveby(Player.Ped) then
			Weapon.Actions.ApplyRecoil()
		end
	else
		Weapon.IsFiring = false
	end
	if Config.debug then TriggerEvent('table', Weapon) end
end


Weapon.Actions.Reload = function(ammoType, ammoData, amount)
	if Weapon.Hash ~= `WEAPON_UNARMED` and Weapon.AmmoType == ammoType:upper() then
		Weapon.Updater.Ammo()
		if Weapon.Ammo < Weapon.MaxAmmo then
			QBCore.Functions.Progressbar('taking_bullets', 'Loading bullets..', math.random(4000, 6000), false, true, {
				disableMovement = false,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
				if QBCore.Shared.Weapons[Weapon.Hash] then
					AddAmmoToPed(Player.Ped, Weapon.Hash, amount)
					TaskReloadWeapon(Player.Ped)
					TriggerServerEvent('weapons:server:AddWeaponAmmo', Weapon.Data, Weapon.Ammo + amount)
					TriggerServerEvent('QBCore:Server:RemoveItem', ammoData.name, 1, ammoData.slot)
					-- TriggerEvent('inventory:client:ItemBox', ammoData.name, 'remove')
					TriggerEvent('QBCore:Notify', 'Reloaded', 'success')
				end
			end, function()
				QBCore.Functions.Notify('Reload canceled', 'error')
			end)
		else
			QBCore.Functions.Notify('Your weapon can\'t hold any more.', 'error')
		end
	else
		QBCore.Functions.Notify('That\'s the wrong ammo for this weapon!', 'error')
	end
end
