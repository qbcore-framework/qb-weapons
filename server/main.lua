local QBCore = exports['qb-core']:GetCoreObject()

-- Functions

local function IsWeaponBlocked(WeaponName)
    local retval = false
    for _, name in pairs(Config.DurabilityBlockedWeapons) do
        if name == WeaponName then
            retval = true
            break
        end
    end
    return retval
end

local function HasAttachment(component, attachments)
    local retval = false
    local key = nil
    for k, v in pairs(attachments) do
        if v.component == component then
            key = k
            retval = true
        end
    end
    return retval, key
end

local function GetAttachmentType(attachments)
    local attype = nil
    for _, v in pairs(attachments) do
        attype = v.type
    end
    return attype
end

-- Callback

QBCore.Functions.CreateCallback("weapons:server:GetConfig", function(_, cb)
    cb(Config.WeaponRepairPoints)
end)

QBCore.Functions.CreateCallback("weapon:server:GetWeaponAmmo", function(source, cb, WeaponData)
    local Player = QBCore.Functions.GetPlayer(source)
    local retval = 0
    if WeaponData then
        if Player then
            local ItemData = Player.Functions.GetItemBySlot(WeaponData.slot)
            if ItemData then
                retval = ItemData.info.ammo and ItemData.info.ammo or 0
            end
        end
    end
    cb(retval, WeaponData.name)
end)

QBCore.Functions.CreateCallback('weapons:server:RemoveAttachment', function(source, cb, AttachmentData, ItemData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Inventory = Player.PlayerData.items
    local AttachmentComponent = WeaponAttachments[ItemData.name:upper()][AttachmentData.attachment]
    if Inventory[ItemData.slot] then
        if Inventory[ItemData.slot].info.attachments and next(Inventory[ItemData.slot].info.attachments) then
            local HasAttach, key = HasAttachment(AttachmentComponent.component, Inventory[ItemData.slot].info.attachments)
            if HasAttach then
                table.remove(Inventory[ItemData.slot].info.attachments, key)
                Player.Functions.SetInventory(Player.PlayerData.items, true)
                Player.Functions.AddItem(AttachmentComponent.item, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[AttachmentComponent.item], "add")
                TriggerClientEvent("QBCore:Notify", src, Lang:t('info.removed_attachment', { value = QBCore.Shared.Items[AttachmentComponent.item].label }), "error")
                cb(Inventory[ItemData.slot].info.attachments)
            else
                cb(false)
            end
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback("weapons:server:RepairWeapon", function(source, cb, RepairPoint, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local minute = 60 * 1000
    local Timeout = math.random(5 * minute, 10 * minute)
    local WeaponData = QBCore.Shared.Weapons[GetHashKey(data.name)]
    local WeaponClass = (QBCore.Shared.SplitStr(WeaponData.ammotype, "_")[2]):lower()

    if Player.PlayerData.items[data.slot] then
        if Player.PlayerData.items[data.slot].info.quality then
            if Player.PlayerData.items[data.slot].info.quality ~= 100 then
                if Player.Functions.RemoveMoney('cash', Config.WeaponRepairCosts[WeaponClass]) then
                    Config.WeaponRepairPoints[RepairPoint].IsRepairing = true
                    Config.WeaponRepairPoints[RepairPoint].RepairingData = {
                        CitizenId = Player.PlayerData.citizenid,
                        WeaponData = Player.PlayerData.items[data.slot],
                        Ready = false,
                    }
                    Player.Functions.RemoveItem(data.name, 1, data.slot)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[data.name], "remove")
                    TriggerClientEvent("inventory:client:CheckWeapon", src, data.name)
                    TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[RepairPoint], RepairPoint)

                    SetTimeout(Timeout, function()
                        Config.WeaponRepairPoints[RepairPoint].IsRepairing = false
                        Config.WeaponRepairPoints[RepairPoint].RepairingData.Ready = true
                        TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[RepairPoint], RepairPoint)
                        exports['qb-phone']:sendNewMailToOffline(Player.PlayerData.citizenid, {
                            sender = Lang:t('mail.sender'),
                            subject = Lang:t('mail.subject'),
                            message = Lang:t('mail.message', { value = WeaponData.label })
                        })
                        SetTimeout(7 * 60000, function()
                            if Config.WeaponRepairPoints[RepairPoint].RepairingData.Ready then
                                Config.WeaponRepairPoints[RepairPoint].IsRepairing = false
                                Config.WeaponRepairPoints[RepairPoint].RepairingData = {}
                                TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[RepairPoint], RepairPoint)
                            end
                        end)
                    end)
                    cb(true)
                else
                    cb(false)
                end
            else
                TriggerClientEvent("QBCore:Notify", src, Lang:t('error.no_damage_on_weapon'), "error")
                cb(false)
            end
        else
            TriggerClientEvent("QBCore:Notify", src, Lang:t('error.no_damage_on_weapon'), "error")
            cb(false)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_weapon_in_hand'), "error")
        TriggerClientEvent('weapons:client:SetCurrentWeapon', src, {}, false)
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('prison:server:checkThrowable', function(source, cb, weapon)
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player then return cb(false) end
    local throwable = false
    for _,v in pairs(Config.Throwables) do
        if QBCore.Shared.Weapons[weapon].name == 'weapon_'..v then
            Player.Functions.RemoveItem('weapon_'..v, 1)
            throwable = true
            break
        end
    end
    cb(throwable)
end)

-- Events

RegisterNetEvent("weapons:server:UpdateWeaponAmmo", function(CurrentWeaponData, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    amount = tonumber(amount)
    if CurrentWeaponData then
        if Player.PlayerData.items[CurrentWeaponData.slot] then
            Player.PlayerData.items[CurrentWeaponData.slot].info.ammo = amount
        end
        Player.Functions.SetInventory(Player.PlayerData.items, true)
    end
end)

RegisterNetEvent("weapons:server:TakeBackWeapon", function(k)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local itemdata = Config.WeaponRepairPoints[k].RepairingData.WeaponData
    itemdata.info.quality = 100
    Player.Functions.AddItem(itemdata.name, 1, false, itemdata.info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemdata.name], "add")
    Config.WeaponRepairPoints[k].IsRepairing = false
    Config.WeaponRepairPoints[k].RepairingData = {}
    TriggerClientEvent('weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[k], k)
end)

RegisterNetEvent("weapons:server:SetWeaponQuality", function(data, hp)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local WeaponSlot = Player.PlayerData.items[data.slot]
    WeaponSlot.info.quality = hp
    Player.Functions.SetInventory(Player.PlayerData.items, true)
end)

RegisterNetEvent('weapons:server:UpdateWeaponQuality', function(data, RepeatAmount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local WeaponData = QBCore.Shared.Weapons[GetHashKey(data.name)]
    local WeaponSlot = Player.PlayerData.items[data.slot]
    local DecreaseAmount = Config.DurabilityMultiplier[data.name]
    if WeaponSlot then
        if not IsWeaponBlocked(WeaponData.name) then
            if WeaponSlot.info.quality then
                for _ = 1, RepeatAmount, 1 do
                    if WeaponSlot.info.quality - DecreaseAmount > 0 then
                        WeaponSlot.info.quality = WeaponSlot.info.quality - DecreaseAmount
                    else
                        WeaponSlot.info.quality = 0
                        TriggerClientEvent('inventory:client:UseWeapon', src, data, false)
                        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.weapon_broken_need_repair'), "error")
                        break
                    end
                end
            else
                WeaponSlot.info.quality = 100
                for _ = 1, RepeatAmount, 1 do
                    if WeaponSlot.info.quality - DecreaseAmount > 0 then
                        WeaponSlot.info.quality = WeaponSlot.info.quality - DecreaseAmount
                    else
                        WeaponSlot.info.quality = 0
                        TriggerClientEvent('inventory:client:UseWeapon', src, data, false)
                        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.weapon_broken_need_repair'), "error")
                        break
                    end
                end
            end
        end
    end
    Player.Functions.SetInventory(Player.PlayerData.items, true)
end)

RegisterNetEvent("weapons:server:EquipAttachment", function(ItemData, CurrentWeaponData, AttachmentData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Inventory = Player.PlayerData.items
    local GiveBackItem = nil
    if Inventory[CurrentWeaponData.slot] then
        if Inventory[CurrentWeaponData.slot].info.attachments and next(Inventory[CurrentWeaponData.slot].info.attachments) then
            local currenttype = GetAttachmentType(Inventory[CurrentWeaponData.slot].info.attachments)
            local HasAttach, key = HasAttachment(AttachmentData.component, Inventory[CurrentWeaponData.slot].info.attachments)
            if not HasAttach then
                if AttachmentData.type ~=nil and currenttype == AttachmentData.type then
                    for _, v in pairs(Inventory[CurrentWeaponData.slot].info.attachments) do
                        if v.type and v.type == currenttype then
                            GiveBackItem = tostring(v.item):lower()
                            table.remove(Inventory[CurrentWeaponData.slot].info.attachments, key)
                            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[GiveBackItem], "add")
                        end
                    end
                end
                Inventory[CurrentWeaponData.slot].info.attachments[#Inventory[CurrentWeaponData.slot].info.attachments+1] = {
                    component = AttachmentData.component,
                    label = QBCore.Shared.Items[AttachmentData.item].label,
                    item = AttachmentData.item,
                    type = AttachmentData.type,
                }
                TriggerClientEvent("addAttachment", src, AttachmentData.component)
                Player.Functions.SetInventory(Player.PlayerData.items, true)
                Player.Functions.RemoveItem(ItemData.name, 1)
                SetTimeout(1000, function()
                    TriggerClientEvent('inventory:client:ItemBox', src, ItemData, "remove")
                end)
            else
                TriggerClientEvent("QBCore:Notify", src, Lang:t('error.attachment_already_on_weapon' , { value = QBCore.Shared.Items[AttachmentData.item].label }), "error", 3500)
            end
        else
            Inventory[CurrentWeaponData.slot].info.attachments = {}
            Inventory[CurrentWeaponData.slot].info.attachments[#Inventory[CurrentWeaponData.slot].info.attachments+1] = {
                component = AttachmentData.component,
                label = QBCore.Shared.Items[AttachmentData.item].label,
                item = AttachmentData.item,
                type = AttachmentData.type,
            }
            TriggerClientEvent("addAttachment", src, AttachmentData.component)
            Player.Functions.SetInventory(Player.PlayerData.items, true)
            Player.Functions.RemoveItem(ItemData.name, 1)
            SetTimeout(1000, function()
                TriggerClientEvent('inventory:client:ItemBox', src, ItemData, "remove")
            end)
        end
    end
    if GiveBackItem then
        Player.Functions.AddItem(GiveBackItem, 1, false)
    end
end)

RegisterNetEvent('weapons:server:removeWeaponAmmoItem', function(item)
    local Player = QBCore.Functions.GetPlayer(source)

    if not Player or type(item) ~= 'table' or not item.name or not item.slot then return end

    Player.Functions.RemoveItem(item.name, 1, item.slot)
end)

-- Commands

QBCore.Commands.Add("repairweapon", "Repair Weapon (God Only)", {{name="hp", help=Lang:t('info.hp_of_weapon')}}, true, function(source, args)
    TriggerClientEvent('weapons:client:SetWeaponQuality', source, tonumber(args[1]))
end, "god")

-- Items

-- AMMO
QBCore.Functions.CreateUseableItem('pistol_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_PISTOL', 12, item)
end)

QBCore.Functions.CreateUseableItem('rifle_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_RIFLE', 30, item)
end)

QBCore.Functions.CreateUseableItem('smg_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_SMG', 20, item)
end)

QBCore.Functions.CreateUseableItem('shotgun_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_SHOTGUN', 10, item)
end)

QBCore.Functions.CreateUseableItem('mg_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_MG', 30, item)
end)

QBCore.Functions.CreateUseableItem('snp_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_SNIPER', 10, item)
end)

QBCore.Functions.CreateUseableItem('emp_ammo', function(source, item)
    TriggerClientEvent('weapons:client:AddAmmo', source, 'AMMO_EMPLAUNCHER', 10, item)
end)

-- TINTS
QBCore.Functions.CreateUseableItem('weapontint_black', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 0)
end)

QBCore.Functions.CreateUseableItem('weapontint_green', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 1)
end)

QBCore.Functions.CreateUseableItem('weapontint_gold', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 2)
end)

QBCore.Functions.CreateUseableItem('weapontint_pink', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 3)
end)

QBCore.Functions.CreateUseableItem('weapontint_army', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 4)
end)

QBCore.Functions.CreateUseableItem('weapontint_lspd', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 5)
end)

QBCore.Functions.CreateUseableItem('weapontint_orange', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 6)
end)

QBCore.Functions.CreateUseableItem('weapontint_plat', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 7)
end)

-- MK2 TINTS
QBCore.Functions.CreateUseableItem('weapontint_mk2_classicblack', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 1)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_classicgray', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 2)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_classictwotone', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 3)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_classicwhite', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 4)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_classicbeige', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 5)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_classicgreen', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 6)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_classicblue', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 7)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_classicearth', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 8)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_classicbrownblack', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 9)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_contrastred', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 10)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_contrastblue', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 11)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_contrastyellow', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 12)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_contrastorange', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 13)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_boldpink', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 14)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_boldpurpleyellow', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 15)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_boldorange', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 16)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_boldgreenpurple', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 17)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_boldredfeatures', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 18)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_boldgreenfeatures', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 19)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_boldcyanfeatures', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 20)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_boldyellowfeatures', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 21)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_boldredwhite', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 22)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_boldredwhite', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 23)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_boldbluewhite', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 24)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_metallicgold', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 25)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_metallicplatinum', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 26)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_metallicgraylilac', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 27)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_metallicpurplelime', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 28)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_metallicred', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 29)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_metallicgreen', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 30)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_metallicblue', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 31)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_metallicwhiteaqua', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 32)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_metallicorangeaqua', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 33)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_metallicorangeyellow', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 34)
end)

QBCore.Functions.CreateUseableItem('weapontint_mk2_metallicredyellow', function(source)
    TriggerClientEvent('weapons:client:EquipTint', source, 35)
end)

-- ATTACHMENTS
-- MELEE
-- WEAPON_BAT
QBCore.Functions.CreateUseableItem('bat_skin1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin1')
end)

QBCore.Functions.CreateUseableItem('bat_skin2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin2')
end)

QBCore.Functions.CreateUseableItem('bat_skin3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin3')
end)

QBCore.Functions.CreateUseableItem('bat_skin4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin4')
end)

QBCore.Functions.CreateUseableItem('bat_skin5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin5')
end)

QBCore.Functions.CreateUseableItem('bat_skin6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin6')
end)

QBCore.Functions.CreateUseableItem('bat_skin7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin7')
end)

QBCore.Functions.CreateUseableItem('bat_skin8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin8')
end)

QBCore.Functions.CreateUseableItem('bat_skin9', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin9')
end)

QBCore.Functions.CreateUseableItem('bat_skin10', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin10')
end)
-- WEAPON_KNUCKLE
QBCore.Functions.CreateUseableItem('knuckle_skin1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin1')
end)

QBCore.Functions.CreateUseableItem('knuckle_skin2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin2')
end)

QBCore.Functions.CreateUseableItem('knuckle_skin3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin3')
end)

QBCore.Functions.CreateUseableItem('knuckle_skin4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin4')
end)

QBCore.Functions.CreateUseableItem('knuckle_skin5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin5')
end)

QBCore.Functions.CreateUseableItem('knuckle_skin6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin6')
end)

QBCore.Functions.CreateUseableItem('knuckle_skin7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin7')
end)

QBCore.Functions.CreateUseableItem('knuckle_skin8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin8')
end)

QBCore.Functions.CreateUseableItem('knuckle_skin9', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin9')
end)

QBCore.Functions.CreateUseableItem('knuckle_skin10', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin10')
end)
-- WEAPON_KNIFE
QBCore.Functions.CreateUseableItem('knife_skin1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin1')
end)

QBCore.Functions.CreateUseableItem('knife_skin2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin2')
end)

QBCore.Functions.CreateUseableItem('knife_skin3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin3')
end)

QBCore.Functions.CreateUseableItem('knife_skin4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin4')
end)

QBCore.Functions.CreateUseableItem('knife_skin5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin5')
end)

QBCore.Functions.CreateUseableItem('knife_skin6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin6')
end)

QBCore.Functions.CreateUseableItem('knife_skin7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin7')
end)

QBCore.Functions.CreateUseableItem('knife_skin8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin8')
end)

QBCore.Functions.CreateUseableItem('knife_skin9', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin9')
end)

QBCore.Functions.CreateUseableItem('knife_skin10', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin10')
end)
-- WEAPON_SWITCHBLADE
QBCore.Functions.CreateUseableItem('switchblade_skin1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin1')
end)

QBCore.Functions.CreateUseableItem('switchblade_skin2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin2')
end)

QBCore.Functions.CreateUseableItem('switchblade_skin3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'wepskin3')
end)

-- SHARED ATTACHMENTS (ALL GUNS)
QBCore.Functions.CreateUseableItem('wep_flashlight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flashlight')
end)

QBCore.Functions.CreateUseableItem('wep_compensator', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'compensator')
end)

QBCore.Functions.CreateUseableItem('pistol_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

QBCore.Functions.CreateUseableItem('smg_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

QBCore.Functions.CreateUseableItem('shotgun_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

QBCore.Functions.CreateUseableItem('rifle_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

QBCore.Functions.CreateUseableItem('sniper_suppressor', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor')
end)

-- PISTOLS
-- WEAPON_PISTOL
QBCore.Functions.CreateUseableItem('pistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('pistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('pistol_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
-- WEAPON_COMBATPISTOL
QBCore.Functions.CreateUseableItem('combatpistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('combatpistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('combatpistol_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
-- WEAPON_APPISTOL
QBCore.Functions.CreateUseableItem('appistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('appistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('appistol_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)

QBCore.Functions.CreateUseableItem('appistol_luxuryfinish2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish2')
end)
--WEAPON_PISTOL50
QBCore.Functions.CreateUseableItem('pistol50_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('pistol50_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('pistol50_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
--WEAPON_SNSPISTOL
QBCore.Functions.CreateUseableItem('snspistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('snspistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('snspistol_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
--WEAPON_HEAVYPISTOL
QBCore.Functions.CreateUseableItem('heavypistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('heavypistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('heavypistol_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
--WEAPON_VINTAGEPISTOL
QBCore.Functions.CreateUseableItem('vintagepistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('vintagepistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)
--WEAPON_REVOLVER
QBCore.Functions.CreateUseableItem('revolver_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)

QBCore.Functions.CreateUseableItem('revolver_luxuryfinish2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish2')
end)
--WEAPON_PISTOL_MK2
QBCore.Functions.CreateUseableItem('pistol_mk2_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish2')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish3')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish4')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish5')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish6')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish7')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish8')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish9', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish9')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish10', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish10')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish11', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish11')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish12', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish12')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish13', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish13')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish14', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish14')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish15', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish15')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish16', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish16')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish17', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish17')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish18', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish18')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish19', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish19')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish20', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish20')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish21', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish21')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish22', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish22')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish23', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish23')
end)

QBCore.Functions.CreateUseableItem('pistol_mk2_luxuryfinish24', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish24')
end)
-- WEAPON_SNSPISTOL_MK2
QBCore.Functions.CreateUseableItem('snspistol_mk2_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_scopesmall', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopesmall')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish2')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish3')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish4')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish5')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish6')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish7')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish8')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish9', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish9')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish10', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish10')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish11', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish11')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish12', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish12')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish13', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish13')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish14', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish14')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish15', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish15')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish16', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish16')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish17', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish17')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish18', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish18')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish19', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish19')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish20', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish20')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish21', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish21')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish22', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish22')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish23', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish23')
end)

QBCore.Functions.CreateUseableItem('snspistol_mk2_luxuryfinish24', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish24')
end)
--WEAPON_REVOLVER_MK2
QBCore.Functions.CreateUseableItem('revolver_mk2_scopesmall', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopesmall')
end)

QBCore.Functions.CreateUseableItem('revolver_mk2_sight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'holosight')
end)

QBCore.Functions.CreateUseableItem('revolver_mk2_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)

QBCore.Functions.CreateUseableItem('revolver_mk2_luxuryfinish2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish2')
end)

QBCore.Functions.CreateUseableItem('revolver_mk2_luxuryfinish3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish3')
end)

QBCore.Functions.CreateUseableItem('revolver_mk2_luxuryfinish4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish4')
end)

QBCore.Functions.CreateUseableItem('revolver_mk2_luxuryfinish5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish5')
end)

QBCore.Functions.CreateUseableItem('revolver_mk2_luxuryfinish6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish6')
end)

QBCore.Functions.CreateUseableItem('revolver_mk2_luxuryfinish7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish7')
end)

QBCore.Functions.CreateUseableItem('revolver_mk2_luxuryfinish8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish8')
end)

QBCore.Functions.CreateUseableItem('revolver_mk2_luxuryfinish9', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish9')
end)

QBCore.Functions.CreateUseableItem('revolver_mk2_luxuryfinish10', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish10')
end)

QBCore.Functions.CreateUseableItem('revolver_mk2_luxuryfinish11', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish11')
end)
--WEAPON_RAYPISTOL
QBCore.Functions.CreateUseableItem('raypistol_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
--WEAPON_CERAMICPISTOL
QBCore.Functions.CreateUseableItem('ceramicpistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('ceramicppistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

-- SMGS
-- WEAPON_MICROSMG
QBCore.Functions.CreateUseableItem('microsmg_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('microsmg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('microsmg_scopesmall', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopesmall')
end)

QBCore.Functions.CreateUseableItem('microsmg_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)

QBCore.Functions.CreateUseableItem('microsmg_luxuryfinish2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish2')
end)

QBCore.Functions.CreateUseableItem('microsmg_luxuryfinish3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish3')
end)

QBCore.Functions.CreateUseableItem('microsmg_luxuryfinish4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish4')
end)
-- WEAPON_SMG
QBCore.Functions.CreateUseableItem('smg_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('smg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('smg_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

QBCore.Functions.CreateUseableItem('smg_scopesmall', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopesmall')
end)

QBCore.Functions.CreateUseableItem('smg_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
-- WEAPON_ASSAULTSMG
QBCore.Functions.CreateUseableItem('assaultsmg_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('assaultsmg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('assaultsmg_scopesmall', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopesmall')
end)

QBCore.Functions.CreateUseableItem('assaultsmg_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
-- WEAPON_GUSENBERG
QBCore.Functions.CreateUseableItem('gusenberg_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('gusenberg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)
-- WEAPON_MINISMG
QBCore.Functions.CreateUseableItem('minismg_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('minismg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)
-- WEAPON_MACHINEPISTOL
QBCore.Functions.CreateUseableItem('machinepistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('machinepistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('machinepistol_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)
-- WEAPON_COMBATPDW
QBCore.Functions.CreateUseableItem('combatpdw_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('combatpdw_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('combatpdw_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

QBCore.Functions.CreateUseableItem('combatpdw_scopesmall', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopesmall')
end)

QBCore.Functions.CreateUseableItem('combatpdw_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)
-- WEAPON_SMG_MK2
QBCore.Functions.CreateUseableItem('smg_mk2_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_scopesmall', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopesmall')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_scopemedium', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopemedium')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_sight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'holosight')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_muzzle1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle1')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_muzzle2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle2')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_muzzle3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle3')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_muzzle4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle4')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_muzzle5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle5')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_muzzle6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle6')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_muzzle7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle7')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_luxuryfinish2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish2')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_luxuryfinish3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish3')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_luxuryfinish4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish4')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_luxuryfinish5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish5')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_luxuryfinish6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish6')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_luxuryfinish7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish7')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_luxuryfinish8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish8')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_luxuryfinish9', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish9')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_luxuryfinish10', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish10')
end)

QBCore.Functions.CreateUseableItem('smg_mk2_luxuryfinish11', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish11')
end)

-- WEAPON_TECPISTOL
QBCore.Functions.CreateUseableItem('tecpistol_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('tecpistol_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

-- SHOTGUNS
-- WEAPON_PUMPSHOTGUN
QBCore.Functions.CreateUseableItem('pumpshotgun_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_luxuryfinish2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish2')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_luxuryfinish3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish3')
end)
-- WEAPON_SAWNOFFSHOTGUN
QBCore.Functions.CreateUseableItem('sawnoffshotgun_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
-- WEAPON_ASSAULTSHOTGUN
QBCore.Functions.CreateUseableItem('assaultshotgun_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('assaultshotgun_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('assaultshotgun_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)
-- WEAPON_BULLPUPSHOTGUN
QBCore.Functions.CreateUseableItem('bullpupshotgun_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)
-- WEAPON_HEAVYSHOTGUN
QBCore.Functions.CreateUseableItem('heavyshotgun_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('heavyshotgun_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('heavyshotgun_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

QBCore.Functions.CreateUseableItem('heavyshotgun_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)
-- WEAPON_PUMPSHOTGUN_MK2
QBCore.Functions.CreateUseableItem('pumpshotgun_mk2_scopesmall', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopesmall')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_mk2_scopemedium', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopemedium')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_mk2_sight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'holosight')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_mk2_muzzle1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle1')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_mk2_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_mk2_luxuryfinish2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish2')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_mk2_luxuryfinish3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish3')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_mk2_luxuryfinish4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish4')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_mk2_luxuryfinish5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish5')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_mk2_luxuryfinish6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish6')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_mk2_luxuryfinish7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish7')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_mk2_luxuryfinish8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish8')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_mk2_luxuryfinish9', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish9')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_mk2_luxuryfinish10', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish10')
end)

QBCore.Functions.CreateUseableItem('pumpshotgun_mk2_luxuryfinish11', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish11')
end)

-- ASSAULT RIFLES
-- WEAPON_ASSAULTRIFLE
QBCore.Functions.CreateUseableItem('assaultrifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_scopesmall', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopesmall')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
--WEAPON_CARBINERIFLE
QBCore.Functions.CreateUseableItem('carbinerifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_scopemedium', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopemedium')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_luxuryfinish2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish2')
end)
-- WEAPON_ADVANCEDRIFLE
QBCore.Functions.CreateUseableItem('advancedrifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('advancedrifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('advancedrifle_scopesmall', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopesmall')
end)

QBCore.Functions.CreateUseableItem('advancedrifle_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
-- WEAPON_SPECIALCARBINE
QBCore.Functions.CreateUseableItem('specialcarbine_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_scopemedium', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopemedium')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
-- WEAPON_BULLPUPRIFLE
QBCore.Functions.CreateUseableItem('bullpuprifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_scopesmall', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopesmall')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
-- WEAPON_COMPACTRIFLE
QBCore.Functions.CreateUseableItem('compactrifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('compactrifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('compactrifle_drum', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'drum')
end)
-- WEAPON_HEAVYRIFLE
QBCore.Functions.CreateUseableItem('heavyrifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('heavyrifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('heavyrifle_sight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'holosight')
end)

QBCore.Functions.CreateUseableItem('heavyrifle_scopemedium', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopemedium')
end)

QBCore.Functions.CreateUseableItem('heavyrifle_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('heavyrifle_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
-- WEAPON_ASSAULTRIFLE_MK2
QBCore.Functions.CreateUseableItem('assaultrifle_mk2_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_sight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'holosight')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_scopesmall', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopesmall')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_scopelarge', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopelarge')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_muzzle1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle1')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_muzzle2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle2')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_muzzle3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle3')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_muzzle4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle4')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_muzzle5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle5')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_muzzle6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle6')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_muzzle7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle7')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_barrel1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel1')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_barrel2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel2')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_luxuryfinish2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish2')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_luxuryfinish3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish3')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_luxuryfinish4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish4')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_luxuryfinish5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish5')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_luxuryfinish6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish6')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_luxuryfinish7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish7')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_luxuryfinish8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish8')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_luxuryfinish9', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish9')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_luxuryfinish10', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish10')
end)

QBCore.Functions.CreateUseableItem('assaultrifle_mk2_luxuryfinish11', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish11')
end)
-- WEAPON_CARBINERIFLE_MK2
QBCore.Functions.CreateUseableItem('carbinerifle_mk2_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_sight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'holosight')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_scopesmall', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopesmall')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_scopelarge', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopelarge')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_muzzle1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle1')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_muzzle2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle2')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_muzzle3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle3')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_muzzle4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle4')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_muzzle5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle5')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_muzzle6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle6')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_muzzle7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle7')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_barrel1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel1')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_barrel2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel2')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_luxuryfinish2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish2')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_luxuryfinish3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish3')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_luxuryfinish4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish4')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_luxuryfinish5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish5')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_luxuryfinish6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish6')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_luxuryfinish7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish7')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_luxuryfinish8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish8')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_luxuryfinish9', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish9')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_luxuryfinish10', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish10')
end)

QBCore.Functions.CreateUseableItem('carbinerifle_mk2_luxuryfinish11', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish11')
end)
--WEAPON_SPECIALCARBINE_MK2
QBCore.Functions.CreateUseableItem('specialcarbine_mk2_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_sight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'holosight')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_scopesmall', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopesmall')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_scopelarge', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopelarge')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_muzzle1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle1')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_muzzle2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle2')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_muzzle3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle3')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_muzzle4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle4')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_muzzle5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle5')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_muzzle6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle6')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_muzzle7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle7')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_barrel1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel1')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_barrel2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel2')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_luxuryfinish2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish2')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_luxuryfinish3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish3')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_luxuryfinish4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish4')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_luxuryfinish5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish5')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_luxuryfinish6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish6')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_luxuryfinish7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish7')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_luxuryfinish8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish8')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_luxuryfinish9', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish9')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_luxuryfinish10', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish10')
end)

QBCore.Functions.CreateUseableItem('specialcarbine_mk2_luxuryfinish11', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish11')
end)
-- WEAPON_BULLPUPRIFLE_MK2
QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_sight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'holosight')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_scopesmall', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopesmall')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_scopemedium', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopemedium')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_muzzle1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle1')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_muzzle2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle2')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_muzzle3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle3')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_muzzle4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle4')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_muzzle5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle5')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_muzzle6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle6')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_muzzle7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle7')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_barrel1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel1')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_barrel2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel2')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_luxuryfinish2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish2')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_luxuryfinish3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish3')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_luxuryfinish4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish4')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_luxuryfinish5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish5')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_luxuryfinish6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish6')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_luxuryfinish7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish7')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_luxuryfinish8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish8')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_luxuryfinish9', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish9')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_luxuryfinish10', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish10')
end)

QBCore.Functions.CreateUseableItem('bullpuprifle_mk2_luxuryfinish11', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish11')
end)
-- WEAPON_MILITARYRIFLE
QBCore.Functions.CreateUseableItem('militaryrifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('militaryrifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('militaryrifle_ironsights', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'ironsights')
end)

QBCore.Functions.CreateUseableItem('militaryrifle_scopesmall', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopesmall')
end)
-- WEAPON_TACTICALRIFLE
QBCore.Functions.CreateUseableItem('tacticalrifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('tacticalrifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

-- LIGHT MACHINE GUNS
-- WEAPON_MG
QBCore.Functions.CreateUseableItem('mg_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('mg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('mg_scopesmall', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopesmall')
end)

QBCore.Functions.CreateUseableItem('mg_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
-- WEAPON_COMBATMG
QBCore.Functions.CreateUseableItem('combatmg_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('combatmg_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('combatmg_scopemedium', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopemedium')
end)

QBCore.Functions.CreateUseableItem('combatmg_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('combatmg_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
-- WEAPON_COMBATMG_MK2
QBCore.Functions.CreateUseableItem('combatmg_mk2_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_sight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'holosight')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_scopemedium', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopemedium')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_scopelarge', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopelarge')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_muzzle1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle1')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_muzzle2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle2')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_muzzle3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle3')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_muzzle4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle4')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_muzzle5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle5')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_muzzle6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle6')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_muzzle7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle7')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_barrel1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel1')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_barrel2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel2')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_luxuryfinish2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish2')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_luxuryfinish3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish3')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_luxuryfinish4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish4')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_luxuryfinish5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish5')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_luxuryfinish6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish6')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_luxuryfinish7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish7')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_luxuryfinish8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish8')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_luxuryfinish9', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish9')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_luxuryfinish10', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish10')
end)

QBCore.Functions.CreateUseableItem('combatmg_mk2_luxuryfinish11', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish11')
end)

-- SNIPER RIFLES
-- WEAPON_SNIPERRIFLE
QBCore.Functions.CreateUseableItem('sniperrifle_scopemedium', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopemedium')
end)

QBCore.Functions.CreateUseableItem('sniperrifle_scopelarge', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopelarge')
end)

QBCore.Functions.CreateUseableItem('sniperrifle_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
-- WEAPON_MARKSMANRIFLE
QBCore.Functions.CreateUseableItem('marksmanrifle_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_scopelarge', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopelarge')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_grip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)
-- WEAPON_HEAVYSNIPER_MK2
QBCore.Functions.CreateUseableItem('heavysniper_mk2_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('heavysniper_mk2_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('heavysniper_mk2_scopelarge', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopelarge')
end)

QBCore.Functions.CreateUseableItem('heavysniper_mk2_muzzle1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle1')
end)

QBCore.Functions.CreateUseableItem('heavysniper_mk2_muzzle2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle2')
end)

QBCore.Functions.CreateUseableItem('heavysniper_mk2_barrel1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel1')
end)

QBCore.Functions.CreateUseableItem('heavysniper_mk2_barrel2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel2')
end)

QBCore.Functions.CreateUseableItem('heavysniper_mk2_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)

QBCore.Functions.CreateUseableItem('heavysniper_mk2_luxuryfinish2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish2')
end)

QBCore.Functions.CreateUseableItem('heavysniper_mk2_luxuryfinish3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish3')
end)

QBCore.Functions.CreateUseableItem('heavysniper_mk2_luxuryfinish4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish4')
end)

QBCore.Functions.CreateUseableItem('heavysniper_mk2_luxuryfinish5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish5')
end)

QBCore.Functions.CreateUseableItem('heavysniper_mk2_luxuryfinish6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish6')
end)

QBCore.Functions.CreateUseableItem('heavysniper_mk2_luxuryfinish7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish7')
end)

QBCore.Functions.CreateUseableItem('heavysniper_mk2_luxuryfinish8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish8')
end)

QBCore.Functions.CreateUseableItem('heavysniper_mk2_luxuryfinish9', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish9')
end)

QBCore.Functions.CreateUseableItem('heavysniper_mk2_luxuryfinish10', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish10')
end)

QBCore.Functions.CreateUseableItem('heavysniper_mk2_luxuryfinish11', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish11')
end)
-- WEAPON_MARKSMANRIFLE_MK2
QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_defaultclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'defaultclip')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_extendedclip', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'extendedclip')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_sight', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'holosight')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_scopemedium', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopemedium')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_scopelarge', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scopelarge')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_muzzle1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle1')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_muzzle2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle2')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_muzzle3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle3')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_muzzle4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle4')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_muzzle5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle5')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_muzzle6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle6')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_muzzle7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle7')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_barrel1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel1')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_barrel2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel2')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_luxuryfinish2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish2')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_luxuryfinish3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish3')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_luxuryfinish4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish4')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_luxuryfinish5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish5')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_luxuryfinish6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish6')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_luxuryfinish7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish7')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_luxuryfinish8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish8')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_luxuryfinish9', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish9')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_luxuryfinish10', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish10')
end)

QBCore.Functions.CreateUseableItem('marksmanrifle_mk2_luxuryfinish11', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish11')
end)

-- HEAVY WEAPONS
-- WEAPON_RPG
QBCore.Functions.CreateUseableItem('rpg_luxuryfinish1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'luxuryfinish1')
end)