--*[[ Local Functions ]]

local function IsWeaponBlocked(WeaponName)
    local retval = false
    for _, name in pairs(Config.Unbreakable) do
        if name == WeaponName then
            retval = true
            break
        end 
    end
    return retval
end



--*[[ Commands ]]

QBCore.Commands.Add('repairweapon', 'Repair Weapon (God Only)', {{name='hp', help='HP of ur weapon'}}, true, function(source, args)
    TriggerClientEvent('weapons:client:SetWeaponQuality', source, tonumber(args[1]))
end, 'god')



--*[[ Events ]]

RegisterServerEvent('weapons:server:UpdateWeaponQuality')
AddEventHandler('weapons:server:UpdateWeaponQuality', function(data, RepeatAmount)
    local src = source
	local WeaponHash = GetHashKey(data.name)
    local Player = QBCore.Functions.GetPlayer(src)
    local WeaponData = QBCore.Shared.Weapons[WeaponHash]
    local WeaponSlot = Player.PlayerData.items[data.slot]
    local DecreaseAmount = Config.DurabilityModifiers[WeaponHash]

    if WeaponSlot ~= nil then
        if not IsWeaponBlocked(WeaponData.name) then
            if WeaponSlot.info.quality ~= nil then
                for i = 1, RepeatAmount, 1 do
                    if WeaponSlot.info.quality - DecreaseAmount > 0 then
                        WeaponSlot.info.quality = WeaponSlot.info.quality - DecreaseAmount
                    else
                        WeaponSlot.info.quality = 0
                        TriggerClientEvent('inventory:client:UseWeapon', src, data)
                        TriggerClientEvent('QBCore:Notify', src, 'Your weapon is broken, you need to repair it before you can use it again.', 'error')
                        break
                    end
                end
            else
                WeaponSlot.info.quality = 100
                for i = 1, RepeatAmount, 1 do
                    if WeaponSlot.info.quality - DecreaseAmount > 0 then
                        WeaponSlot.info.quality = WeaponSlot.info.quality - DecreaseAmount
                    else
                        WeaponSlot.info.quality = 0
                        TriggerClientEvent('inventory:client:UseWeapon', src, data)
                        TriggerClientEvent('QBCore:Notify', src, 'Your weapon is broken, you need to repair it before you can use it again.', 'error')
                        break
                    end
                end
            end
        end
    end

    Player.Functions.SetInventory(Player.PlayerData.items, true)
end)

RegisterServerEvent('weapons:server:SetWeaponQuality')
AddEventHandler('weapons:server:SetWeaponQuality', function(data, hp)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local WeaponSlot = Player.PlayerData.items[data.slot]
    WeaponSlot.info.quality = hp
    Player.Functions.SetInventory(Player.PlayerData.items, true)
end)


RegisterServerEvent('weapons:server:TakeBackWeapon')
AddEventHandler('weapons:server:TakeBackWeapon', function(k, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local itemdata = Config.RepairLocations[k].RepairingData.WeaponData

    itemdata.info.quality = 100
    Player.Functions.AddItem(itemdata.name, 1, false, itemdata.info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemdata.name], 'add')
    Config.RepairLocations[k].IsRepairing = false
    Config.RepairLocations[k].RepairingData = {}
    TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.RepairLocations[k], k)
end)



--*[[ Callbacks ]]

QBCore.Functions.CreateCallback('weapons:server:GetConfig', function(source, cb)
    cb(Config.RepairLocations)
end)


QBCore.Functions.CreateCallback('weapons:server:RepairWeapon', function(source, cb, RepairPoint, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local minute = 60 * 1000
    local Timeout = math.random(5 * minute, 10 * minute)
    local WeaponData = QBCore.Shared.Weapons[GetHashKey(data.name)]
    local WeaponClass = (QBCore.Shared.SplitStr(WeaponData.ammotype, '_')[2]):lower()

    if Player.PlayerData.items[data.slot] ~= nil then
        if Player.PlayerData.items[data.slot].info.quality ~= nil then
            if Player.PlayerData.items[data.slot].info.quality ~= 100 then
                if Player.Functions.RemoveMoney('cash', Config.RepairCosts[WeaponClass]) then
                    Config.RepairLocations[RepairPoint].IsRepairing = true
                    Config.RepairLocations[RepairPoint].RepairingData = {
                        CitizenId = Player.PlayerData.citizenid,
                        WeaponData = Player.PlayerData.items[data.slot],
                        Ready = false,
                    }
                    Player.Functions.RemoveItem(data.name, 1, data.slot)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.name], 'remove')
                    TriggerClientEvent('inventory:client:CheckWeapon', src, data.name)
                    TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.RepairLocations[RepairPoint], RepairPoint)

                    SetTimeout(Timeout, function()
                        Config.RepairLocations[RepairPoint].IsRepairing = false
                        Config.RepairLocations[RepairPoint].RepairingData.Ready = true
                        TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.RepairLocations[RepairPoint], RepairPoint)
                        TriggerEvent('qb-phone:server:sendNewMailToOffline', Player.PlayerData.citizenid, {
                            sender = 'Tyrone',
                            subject = 'Repair',
                            message = 'Your '..WeaponData.label..' is repaired u can pick it up at the location. <br><br> Peace out madafaka'
                        })
                        SetTimeout(7 * 60000, function()
                            if Config.RepairLocations[RepairPoint].RepairingData.Ready then
                                Config.RepairLocations[RepairPoint].IsRepairing = false
                                Config.RepairLocations[RepairPoint].RepairingData = {}
                                TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.RepairLocations[RepairPoint], RepairPoint)
                            end
                        end)
                    end)
                    cb(true)
                else
                    cb(false)
                end
            else
                TriggerClientEvent('QBCore:Notify', src, 'This weapon is not dammaged..', 'error')
                cb(false)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'This weapon is not dammaged..', 'error')
            cb(false)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, 'You don\'t have a weapon in your hands..', 'error')
        TriggerClientEvent('weapons:client:SetCurrentWeapon', src, {}, false)
        cb(false)
    end
end)
