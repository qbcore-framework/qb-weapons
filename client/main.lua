-- Variables
local QBCore = exports['qb-core']:GetCoreObject({ 'Functions', 'Shared' })
local PlayerData = QBCore.Functions.GetPlayerData()
local CurrentWeaponData, CanShoot, MultiplierAmount, currentWeapon = {}, true, 0, nil

-- Handlers

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    QBCore.Functions.TriggerCallback('qb-weapons:server:GetConfig', function(RepairPoints)
        for k, data in pairs(RepairPoints) do
            Config.WeaponRepairPoints[k].IsRepairing = data.IsRepairing
            Config.WeaponRepairPoints[k].RepairingData = data.RepairingData
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    for k in pairs(Config.WeaponRepairPoints) do
        Config.WeaponRepairPoints[k].IsRepairing = false
        Config.WeaponRepairPoints[k].RepairingData = {}
    end
end)

-- Functions

local function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    BeginTextCommandDisplayText('STRING')
    SetTextCentre(true)
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(x, y, z, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- Events

RegisterNetEvent('qb-weapons:client:SyncRepairShops', function(NewData, key)
    Config.WeaponRepairPoints[key].IsRepairing = NewData.IsRepairing
    Config.WeaponRepairPoints[key].RepairingData = NewData.RepairingData
end)

RegisterNetEvent('qb-weapons:client:EquipTint', function(weapon, tint)
    local player = PlayerPedId()
    SetPedWeaponTintIndex(player, weapon, tint)
end)

RegisterNetEvent('qb-weapons:client:SetCurrentWeapon', function(data, bool)
    if data and data ~= false then
        CurrentWeaponData = data
    else
        CurrentWeaponData = {}
    end

    CanShoot = bool ~= false
end)

RegisterNetEvent('qb-weapons:client:SetWeaponQuality', function(amount)
    if CurrentWeaponData and next(CurrentWeaponData) then
        TriggerServerEvent('qb-weapons:server:SetWeaponQuality', CurrentWeaponData, amount)
    end
end)

RegisterNetEvent('qb-weapons:client:AddAmmo', function(ammoType, amount, itemData)
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)

    if not CurrentWeaponData then
        QBCore.Functions.Notify(Lang:t('error.no_weapon'), 'error')
        return
    end

    if QBCore.Shared.Weapons[weapon]['name'] == 'weapon_unarmed' then
        QBCore.Functions.Notify(Lang:t('error.no_weapon_in_hand'), 'error')
        return
    end

    if QBCore.Shared.Weapons[weapon]['ammotype'] ~= ammoType:upper() then
        QBCore.Functions.Notify(Lang:t('error.wrong_ammo'), 'error')
        return
    end

    local total = GetAmmoInPedWeapon(ped, weapon)
    local _, maxAmmo = GetMaxAmmo(ped, weapon)

    if total >= maxAmmo then
        QBCore.Functions.Notify(Lang:t('error.max_ammo'), 'error')
        return
    end

    QBCore.Functions.Progressbar('taking_bullets', Lang:t('info.loading_bullets'), Config.ReloadTime, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()              -- Done
        weapon = GetSelectedPedWeapon(ped) -- Get weapon at time of completion

        if QBCore.Shared.Weapons[weapon]?.ammotype ~= ammoType then
            return QBCore.Functions.Notify(Lang:t('error.wrong_ammo'), 'error')
        end

        AddAmmoToPed(ped, weapon, amount)
        TaskReloadWeapon(ped, false)
        TriggerServerEvent('qb-weapons:server:UpdateWeaponAmmo', CurrentWeaponData, total + amount)
        TriggerServerEvent('qb-weapons:server:removeWeaponAmmoItem', itemData)
        TriggerEvent('qb-inventory:client:ItemBox', QBCore.Shared.Items[itemData.name], 'remove')
        TriggerEvent('QBCore:Notify', Lang:t('success.reloaded'), 'success')
    end, function()
        QBCore.Functions.Notify(Lang:t('error.canceled'), 'error')
    end)
end)

RegisterNetEvent('qb-weapons:client:UseWeapon', function(weaponData, shootbool)
    local ped = PlayerPedId()
    local weaponName = tostring(weaponData.name)
    local weaponHash = joaat(weaponData.name)
    if currentWeapon == weaponName then
        TriggerEvent('qb-weapons:client:DrawWeapon', nil)
        SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
        RemoveAllPedWeapons(ped, true)
        TriggerEvent('qb-weapons:client:SetCurrentWeapon', nil, shootbool)
        currentWeapon = nil
    elseif weaponName == 'weapon_stickybomb' or weaponName == 'weapon_pipebomb' or weaponName == 'weapon_smokegrenade' or weaponName == 'weapon_flare' or weaponName == 'weapon_proxmine' or weaponName == 'weapon_ball' or weaponName == 'weapon_molotov' or weaponName == 'weapon_grenade' or weaponName == 'weapon_bzgas' then
        TriggerEvent('qb-weapons:client:DrawWeapon', weaponName)
        GiveWeaponToPed(ped, weaponHash, 1, false, false)
        SetPedAmmo(ped, weaponHash, 1)
        SetCurrentPedWeapon(ped, weaponHash, true)
        TriggerEvent('qb-weapons:client:SetCurrentWeapon', weaponData, shootbool)
        currentWeapon = weaponName
    elseif weaponName == 'weapon_snowball' then
        TriggerEvent('qb-weapons:client:DrawWeapon', weaponName)
        GiveWeaponToPed(ped, weaponHash, 10, false, false)
        SetPedAmmo(ped, weaponHash, 10)
        SetCurrentPedWeapon(ped, weaponHash, true)
        TriggerServerEvent('qb-inventory:server:snowball', 'remove')
        TriggerEvent('qb-weapons:client:SetCurrentWeapon', weaponData, shootbool)
        currentWeapon = weaponName
    else
        TriggerEvent('qb-weapons:client:DrawWeapon', weaponName)
        TriggerEvent('qb-weapons:client:SetCurrentWeapon', weaponData, shootbool)
        local ammo = tonumber(weaponData.info.ammo) or 0

        if weaponName == 'weapon_petrolcan' or weaponName == 'weapon_fireextinguisher' then
            ammo = 4000
        end

        GiveWeaponToPed(ped, weaponHash, ammo, false, false)
        SetPedAmmo(ped, weaponHash, ammo)
        SetCurrentPedWeapon(ped, weaponHash, true)

        if weaponData.info.attachments then
            for _, attachment in pairs(weaponData.info.attachments) do
                GiveWeaponComponentToPed(ped, weaponHash, joaat(attachment.component))
            end
        end

        if weaponData.info.tint then
            SetPedWeaponTintIndex(ped, weaponHash, weaponData.info.tint)
        end

        currentWeapon = weaponName
    end
end)

RegisterNetEvent('qb-weapons:client:CheckWeapon', function(weaponName)
    if currentWeapon ~= weaponName:lower() then return end
    local ped = PlayerPedId()
    TriggerEvent('qb-weapons:ResetHolster')
    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
    RemoveAllPedWeapons(ped, true)
    currentWeapon = nil
end)

-- Threads

local ThrowableWeapons = {}
for _, throwable in pairs(Config.Throwables or {}) do
    ThrowableWeapons[joaat(('weapon_%s'):format(throwable))] = true
end

local function HasCurrentWeapon()
    return CurrentWeaponData and next(CurrentWeaponData) ~= nil
end

local function SyncCurrentWeapon(ped, weapon)
    if not HasCurrentWeapon() then return end

    ped = ped or PlayerPedId()
    weapon = weapon or GetSelectedPedWeapon(ped)

    if weapon and weapon ~= 0 and weapon ~= `WEAPON_UNARMED` then
        TriggerServerEvent('qb-weapons:server:UpdateWeaponAmmo', CurrentWeaponData, tonumber(GetAmmoInPedWeapon(ped, weapon)))
    end

    if MultiplierAmount > 0 then
        TriggerServerEvent('qb-weapons:server:UpdateWeaponQuality', CurrentWeaponData, MultiplierAmount)
        MultiplierAmount = 0
    end
end

local ammoSyncQueued = false
local function QueueAmmoSync(delay)
    if ammoSyncQueued then return end

    ammoSyncQueued = true
    CreateThread(function()
        Wait(delay or 750)
        ammoSyncQueued = false
        SyncCurrentWeapon()
    end)
end

local function HandleBrokenWeapon(ped, weapon)
    if weapon == `WEAPON_UNARMED` then return end

    local weaponInfo = QBCore.Shared.Weapons[weapon]
    if not weaponInfo then return end

    TriggerEvent('qb-weapons:client:CheckWeapon', weaponInfo.name)
    QBCore.Functions.Notify(Lang:t('error.weapon_broken'), 'error')
    MultiplierAmount = 0
end

CreateThread(function()
    SetWeaponsNoAutoswap(true)
end)

-- Shot tracking is event based. This removes the old permanent Wait(0) durability loop.
AddEventHandler('CEventGunShot', function(_, eventEntity)
    local ped = PlayerPedId()
    if eventEntity ~= ped then return end
    if not LocalPlayer.state.isLoggedIn or not HasCurrentWeapon() then return end

    local weapon = GetSelectedPedWeapon(ped)
    if not weapon or weapon == 0 or not QBCore.Shared.Weapons[weapon] then return end

    if not CanShoot then
        HandleBrokenWeapon(ped, weapon)
        return
    end

    if not ThrowableWeapons[weapon] and GetAmmoInPedWeapon(ped, weapon) > 0 then
        MultiplierAmount += 1
    end

    QueueAmmoSync(800)
end)

-- Lightweight watcher: idle sleeps hard, only goes frame-by-frame if a broken weapon must be blocked instantly.
CreateThread(function()
    while true do
        local sleep = 750

        if LocalPlayer.state.isLoggedIn and HasCurrentWeapon() then
            local ped = PlayerPedId()

            if IsPedArmed(ped, 7) == 1 then
                local weapon = GetSelectedPedWeapon(ped)

                if CanShoot then
                    sleep = 250
                    if IsControlJustReleased(0, 24) or IsDisabledControlJustReleased(0, 24) then
                        SyncCurrentWeapon(ped, weapon)
                    end
                else
                    sleep = 0
                    if IsControlJustPressed(0, 24) or IsPedShooting(ped) then
                        HandleBrokenWeapon(ped, weapon)
                    end
                end
            end
        end

        Wait(sleep)
    end
end)

CreateThread(function()
    while true do
        local sleep = 1000

        if LocalPlayer.state.isLoggedIn then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)

            for k, data in pairs(Config.WeaponRepairPoints) do
                local distance = #(pos - data.coords)

                if distance < 10 then
                    sleep = math.min(sleep, 250)
                end

                if distance < 1.0 then
                    sleep = 0

                    if data.IsRepairing then
                        if data.RepairingData.CitizenId ~= PlayerData.citizenid then
                            DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('info.repairshop_not_usable'))
                        else
                            if not data.RepairingData.Ready then
                                DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('info.weapon_will_repair'))
                            else
                                DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('info.take_weapon_back'))
                            end
                        end
                    else
                        if HasCurrentWeapon() then
                            if not data.RepairingData.Ready then
                                local weaponData = QBCore.Shared.Weapons[GetHashKey(CurrentWeaponData.name)]
                                local weaponClass = weaponData and weaponData.ammotype and (QBCore.Shared.SplitStr(weaponData.ammotype, '_')[2] or ''):lower()
                                local repairCost = weaponClass and Config.WeaponRepairCosts[weaponClass]

                                if repairCost then
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('info.repair_weapon_price', { value = repairCost }))
                                    if IsControlJustPressed(0, 38) then
                                        QBCore.Functions.TriggerCallback('qb-weapons:server:RepairWeapon', function(HasMoney)
                                            if HasMoney then
                                                CurrentWeaponData = {}
                                            end
                                        end, k, CurrentWeaponData)
                                    end
                                else
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('error.no_weapon_in_hand'))
                                end
                            else
                                if data.RepairingData.CitizenId ~= PlayerData.citizenid then
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('info.repairshop_not_usable'))
                                else
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('info.take_weapon_back'))
                                    if IsControlJustPressed(0, 38) then
                                        TriggerServerEvent('qb-weapons:server:TakeBackWeapon', k, data)
                                    end
                                end
                            end
                        else
                            if data.RepairingData.CitizenId == nil then
                                DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('error.no_weapon_in_hand'))
                            elseif data.RepairingData.CitizenId == PlayerData.citizenid then
                                DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, Lang:t('info.take_weapon_back'))
                                if IsControlJustPressed(0, 38) then
                                    TriggerServerEvent('qb-weapons:server:TakeBackWeapon', k, data)
                                end
                            end
                        end
                    end
                end
            end
        end

        Wait(sleep)
    end
end)
