local isLoggedIn = true
local CurrentWeaponData = {}
local PlayerData = {}
local CanShoot = true

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local MultiplierAmount = 0

Citizen.CreateThread(function()
    while true do
        if isLoggedIn then
            local ped = PlayerPedId()
            if CurrentWeaponData ~= nil and next(CurrentWeaponData) ~= nil then
                if IsPedShooting(ped) or IsControlJustPressed(0, 24) then
                    if CanShoot then
                        local weapon = GetSelectedPedWeapon(ped)
                        local ammo = GetAmmoInPedWeapon(ped, weapon)
                        if QBCore.Shared.Weapons[weapon]["name"] == "weapon_snowball" then
                            TriggerServerEvent('QBCore:Server:RemoveItem', "snowball", 1)
                        else
                            if ammo > 0 then
                                MultiplierAmount = MultiplierAmount + 1
                            end
                        end
                    else
			            local weapon = GetSelectedPedWeapon(ped)
                        if weapon ~= -1569615261 then
                            TriggerEvent('inventory:client:CheckWeapon', QBCore.Shared.Weapons[weapon]["name"])
                            QBCore.Functions.Notify("This weapon is broken and can not be used..", "error")
                            MultiplierAmount = 0
                        end
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local player = PlayerId()
        local weapon = GetSelectedPedWeapon(ped)
        local ammo = GetAmmoInPedWeapon(ped, weapon)
        local clipSize = GetWeaponClipSize(weapon)

        -- Clip size will always be zero for melee weapons
        if clipSize > 0 and ammo < 1 then
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 257, true) -- Attack 2
            if IsPedInAnyVehicle(ped, true) then
                SetPlayerCanDoDriveBy(player, false)
            end
        else
            EnableControlAction(0, 24, true) -- Attack
			EnableControlAction(0, 257, true) -- Attack 2
            if IsPedInAnyVehicle(ped, true) then
                SetPlayerCanDoDriveBy(player, true)
            end
        end

        if IsPedShooting(ped) then
            if ammo - 1 < 0 then
                SetAmmoInClip(ped, GetHashKey(QBCore.Shared.Weapons[weapon]["name"]), 0)
            end
        end

        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if IsControlJustReleased(0, 24) or IsDisabledControlJustReleased(0, 24) then
            local weapon = GetSelectedPedWeapon(ped)
            local ammo = GetAmmoInPedWeapon(ped, weapon)
            if ammo > 0 then
                TriggerServerEvent("weapons:server:UpdateWeaponAmmo", CurrentWeaponData, tonumber(ammo))
            else
                TriggerEvent('inventory:client:CheckWeapon')
                TriggerServerEvent("weapons:server:UpdateWeaponAmmo", CurrentWeaponData, 0)
            end

            if MultiplierAmount > 0 then
                TriggerServerEvent("weapons:server:UpdateWeaponQuality", CurrentWeaponData, MultiplierAmount)
                MultiplierAmount = 0
            end
        end
        Citizen.Wait(1)
    end
end)

RegisterNetEvent('weapon:client:AddAmmo')
AddEventHandler('weapon:client:AddAmmo', function(type, amount, itemData)
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)
    if CurrentWeaponData ~= nil then
        if QBCore.Shared.Weapons[weapon]["name"] ~= "weapon_unarmed" and QBCore.Shared.Weapons[weapon]["ammotype"] == type:upper() then
            local total = GetAmmoInPedWeapon(ped, weapon)
            local found, maxAmmo = GetMaxAmmo(ped, weapon)

            if total < maxAmmo then
                QBCore.Functions.Progressbar("taking_bullets", "Loading bullets..", math.random(4000, 6000), false, true, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    if QBCore.Shared.Weapons[weapon] ~= nil then
                        AddAmmoToPed(ped,weapon,amount)
                        TaskReloadWeapon(ped)
                        TriggerServerEvent("weapons:server:AddWeaponAmmo", CurrentWeaponData, total + amount)
                        TriggerServerEvent('QBCore:Server:RemoveItem', itemData.name, 1, itemData.slot)
                        TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[itemData.name], "remove")
                        TriggerEvent('QBCore:Notify', 'Reloaded', "success")
                    end
                end, function()
                    QBCore.Functions.Notify("Canceled", "error")
                end)
            else
                QBCore.Functions.Notify("Max Ammo Capacity", "error")
            end
        else
            QBCore.Functions.Notify("You Have No Weapon", "error")
        end
    else
        QBCore.Functions.Notify("You Have No Weapon.", "error")
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerData = QBCore.Functions.GetPlayerData()

    QBCore.Functions.TriggerCallback("weapons:server:GetConfig", function(RepairPoints)
        for k, data in pairs(RepairPoints) do
            Config.WeaponRepairPoints[k].IsRepairing = data.IsRepairing
            Config.WeaponRepairPoints[k].RepairingData = data.RepairingData
        end
    end)
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(1000)
        isLoggedIn = true
        PlayerData = QBCore.Functions.GetPlayerData()

        QBCore.Functions.TriggerCallback("weapons:server:GetConfig", function(RepairPoints)
            for k, data in pairs(RepairPoints) do
                Config.WeaponRepairPoints[k].IsRepairing = data.IsRepairing
                Config.WeaponRepairPoints[k].RepairingData = data.RepairingData
            end
        end)
    end
end)

RegisterNetEvent('weapons:client:SetCurrentWeapon')
AddEventHandler('weapons:client:SetCurrentWeapon', function(data, bool)
    if data ~= false then
        CurrentWeaponData = data
    else
        CurrentWeaponData = {}
    end
    CanShoot = bool
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false

    for k, v in pairs(Config.WeaponRepairPoints) do
        Config.WeaponRepairPoints[k].IsRepairing = false
        Config.WeaponRepairPoints[k].RepairingData = {}
    end
end)

RegisterNetEvent('weapons:client:SetWeaponQuality')
AddEventHandler('weapons:client:SetWeaponQuality', function(amount)
    if CurrentWeaponData ~= nil and next(CurrentWeaponData) ~= nil then
        TriggerServerEvent("weapons:server:SetWeaponQuality", CurrentWeaponData, amount)
    end
end)

Citizen.CreateThread(function()
    while true do
        if isLoggedIn then
            local inRange = false
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)

            for k, data in pairs(Config.WeaponRepairPoints) do
                local distance = #(pos - vector3(data.coords.x, data.coords.y, data.coords.z))

                if distance < 10 then
                    inRange = true

                    if distance < 1 then
                        if data.IsRepairing then
                            if data.RepairingData.CitizenId ~= PlayerData.citizenid then
                                DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, 'The repairshop is this moment  ~r~NOT~w~ usable..')
                            else
                                if not data.RepairingData.Ready then
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, 'Your weapon will be repaired')
                                else
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '[E] to take weapon back')
                                end
                            end
                        else
                            if CurrentWeaponData ~= nil and next(CurrentWeaponData) ~= nil then
                                if not data.RepairingData.Ready then
                                    local WeaponData = QBCore.Shared.Weapons[GetHashKey(CurrentWeaponData.name)]
                                    local WeaponClass = (QBCore.Shared.SplitStr(WeaponData.ammotype, "_")[2]):lower()
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '[E] Repair weapon, ~g~$'..Config.WeaponRepairCotsts[WeaponClass]..'~w~')
                                    if IsControlJustPressed(0, 38) then
                                        QBCore.Functions.TriggerCallback('weapons:server:RepairWeapon', function(HasMoney)
                                            if HasMoney then
                                                CurrentWeaponData = {}
                                            end
                                        end, k, CurrentWeaponData)
                                    end
                                else
                                    if data.RepairingData.CitizenId ~= PlayerData.citizenid then
                                        DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, 'The repairshop is this moment ~r~NOT~w~ usable..')
                                    else
                                        DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '[E] to take weapon back')
                                        if IsControlJustPressed(0, 38) then
                                            TriggerServerEvent('weapons:server:TakeBackWeapon', k, data)
                                        end
                                    end
                                end
                            else
                                if data.RepairingData.CitizenId == nil then
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, 'You dont have a weapon in ur hands..')
                                elseif data.RepairingData.CitizenId == PlayerData.citizenid then
                                    DrawText3Ds(data.coords.x, data.coords.y, data.coords.z, '[E] to take weapon back')
                                    if IsControlJustPressed(0, 38) then
                                        TriggerServerEvent('weapons:server:TakeBackWeapon', k, data)
                                    end
                                end
                            end
                        end
                    end
                end
            end

            if not inRange then
                Citizen.Wait(1000)
            end
        end
        Citizen.Wait(3)
    end
end)

RegisterNetEvent("weapons:client:SyncRepairShops")
AddEventHandler("weapons:client:SyncRepairShops", function(NewData, key)
    Config.WeaponRepairPoints[key].IsRepairing = NewData.IsRepairing
    Config.WeaponRepairPoints[key].RepairingData = NewData.RepairingData
end)

RegisterNetEvent("weapons:client:EquipAttachment")
AddEventHandler("weapons:client:EquipAttachment", function(ItemData, attachment)
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)
    local WeaponData = QBCore.Shared.Weapons[weapon]

    if weapon ~= GetHashKey("WEAPON_UNARMED") then
        WeaponData.name = WeaponData.name:upper()
        if WeaponAttachments[WeaponData.name] ~= nil then
            if WeaponAttachments[WeaponData.name][attachment] ~= nil then
                TriggerServerEvent("weapons:server:EquipAttachment", ItemData, CurrentWeaponData, WeaponAttachments[WeaponData.name][attachment])
            else
                QBCore.Functions.Notify("This weapon does not support this attachment..", "error")
            end
        end
    else
        QBCore.Functions.Notify("You dont have a weapon in ur hand..", "error")
    end
end)

RegisterNetEvent("addAttachment")
AddEventHandler("addAttachment", function(component)
    local ped = PlayerPedId()
    local weapon = GetSelectedPedWeapon(ped)
    local WeaponData = QBCore.Shared.Weapons[weapon]
    GiveWeaponComponentToPed(ped, GetHashKey(WeaponData.name), GetHashKey(component))
end)

RegisterNetEvent('weapons:client:EquipTint')
AddEventHandler('weapons:client:EquipTint', function(tint)
    local player = PlayerPedId()
    local weapon = GetSelectedPedWeapon(player)
    SetPedWeaponTintIndex(player, weapon, tint)
end)
