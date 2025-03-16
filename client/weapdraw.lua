local weapons = {
    'WEAPON_KNIFE',
    'WEAPON_NIGHTSTICK',
    'WEAPON_BREAD',
    'WEAPON_FLASHLIGHT',
    'WEAPON_HAMMER',
    'WEAPON_BAT',
    'WEAPON_GOLFCLUB',
    'WEAPON_CROWBAR',
    'WEAPON_BOTTLE',
    'WEAPON_DAGGER',
    'WEAPON_HATCHET',
    'WEAPON_MACHETE',
    'WEAPON_SWITCHBLADE',
    'WEAPON_BATTLEAXE',
    'WEAPON_POOLCUE',
    'WEAPON_WRENCH',
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_COMBATPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_PISTOL50',
    'WEAPON_REVOLVER',
    'WEAPON_SNSPISTOL',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_VINTAGEPISTOL',
    'WEAPON_MICROSMG',
    'WEAPON_SMG',
    'WEAPON_ASSAULTSMG',
    'WEAPON_MINISMG',
    'WEAPON_MACHINEPISTOL',
    'WEAPON_COMBATPDW',
    'WEAPON_PUMPSHOTGUN',
    'WEAPON_SAWNOFFSHOTGUN',
    'WEAPON_ASSAULTSHOTGUN',
    'WEAPON_BULLPUPSHOTGUN',
    'WEAPON_HEAVYSHOTGUN',
    'WEAPON_ASSAULTRIFLE',
    'WEAPON_CARBINERIFLE',
    'WEAPON_ADVANCEDRIFLE',
    'WEAPON_SPECIALCARBINE',
    'WEAPON_BULLPUPRIFLE',
    'WEAPON_COMPACTRIFLE',
    'WEAPON_MG',
    'WEAPON_COMBATMG',
    'WEAPON_GUSENBERG',
    'WEAPON_SNIPERRIFLE',
    'WEAPON_HEAVYSNIPER',
    'WEAPON_MARKSMANRIFLE',
    'WEAPON_GRENADELAUNCHER',
    'WEAPON_RPG',
    'WEAPON_STINGER',
    'WEAPON_MINIGUN',
    'WEAPON_GRENADE',
    'WEAPON_STICKYBOMB',
    'WEAPON_SMOKEGRENADE',
    'WEAPON_BZGAS',
    'WEAPON_MOLOTOV',
    'WEAPON_DIGISCANNER',
    'WEAPON_FIREWORK',
    'WEAPON_MUSKET',
    'WEAPON_STUNGUN',
    'WEAPON_HOMINGLAUNCHER',
    'WEAPON_PROXMINE',
    'WEAPON_FLAREGUN',
    'WEAPON_MARKSMANPISTOL',
    'WEAPON_RAILGUN',
    'WEAPON_DBSHOTGUN',
    'WEAPON_AUTOSHOTGUN',
    'WEAPON_COMPACTLAUNCHER',
    'WEAPON_PIPEBOMB',
    'WEAPON_DOUBLEACTION',
    'WEAPON_SNOWBALL',
    'WEAPON_PISTOLXM3',
    'WEAPON_CANDYCANE',
    'WEAPON_CERAMICPISTOL',
    'WEAPON_NAVYREVOLVER',
    'WEAPON_GADGETPISTOL',
    'WEAPON_PISTOLXM3',
    'WEAPON_TECPISTOL',
    'WEAPON_HEAVYRIFLE',
    'WEAPON_MILITARYRIFLE',
    'WEAPON_TACTICALRIFLE',
    'WEAPON_SWEEPERSHOTGUN',
    'WEAPON_ASSAULTRIFLE_MK2',
    'WEAPON_BULLPUPRIFLE_MK2',
    'WEAPON_CARBINERIFLE_MK2',
    'WEAPON_COMBATMG_MK2',
    'WEAPON_HEAVYSNIPER_MK2',
    'WEAPON_KNUCKLE',
    'WEAPON_MARKSMANRIFLE_MK2',
    'WEAPON_PRECISIONRIFLE',
    'WEAPON_PETROLCAN',
    'WEAPON_PUMPSHOTGUN_MK2',
    'WEAPON_RAYCARBINE',
    'WEAPON_RAYMINIGUN',
    'WEAPON_RAYPISTOL',
    'WEAPON_REVOLVER_MK2',
    'WEAPON_SMG_MK2',
    'WEAPON_SNSPISTOL_MK2',
    'WEAPON_SPECIALCARBINE_MK2',
    'WEAPON_STONE_HATCHET'
}

local currHolsterTexture = nil
local canFire = false

local function loadAnimDict(dict)
    if HasAnimDictLoaded(dict) then return end
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
end

local function isPlayingAnim(ped, dict, anim)
    return IsEntityPlayingAnim(ped, dict, anim, 3)
end

local function checkWeapon(newWeap)
    for i = 1, #weapons do
        if joaat(weapons[i]) == newWeap then
            return true
        end
    end
    return false
end

local function isWeaponHolsterable(weap)
    for i = 1, #Config.WeapDraw.weapons do
        if joaat(Config.WeapDraw.weapons[i]) == weap then
            return true
        end
    end
    return false
end

RegisterNetEvent('qb-weapons:ResetHolster', function()
    holstered = true
    canFire = true
    currWeap = `WEAPON_UNARMED`
    currHolster = nil
    currHolsterTexture = nil
    wearingHolster = nil
end)

RegisterNetEvent('qb-weapons:client:DrawWeapon', function()
    if GetResourceState('qb-inventory') == 'missing' then return end

    local ped = PlayerPedId()
    local currWeap = `WEAPON_UNARMED`
    local holstered = true
    local canFire = true

    loadAnimDict('rcmjosh4')
    loadAnimDict('reaction@intimidation@cop@unarmed')

    while true do
        local sleep = 250
        if DoesEntityExist(ped) and not IsEntityDead(ped) then
            local newWeap = GetSelectedPedWeapon(ped)
            if newWeap ~= currWeap then
                local holsterVariant = GetPedDrawableVariation(ped, 7)
                local wearingHolster = Config.WeapDraw.variants[holsterVariant] ~= nil

                if checkWeapon(newWeap) then -- Drawing a weapon
                    if holstered and wearingHolster and not IsEntityPlayingAnim(ped, 'rcmjosh4', 'josh_leadout_cop2', 3) then
                        canFire = false
                        CeaseFire()
                        TaskPlayAnim(ped, 'rcmjosh4', 'josh_leadout_cop2', 3.0, 3.0, -1, 50, 0, false, false, false)
                        Wait(300)

                        local emptyDrawable = Config.WeapDraw.variants[holsterVariant]
                        if emptyDrawable and emptyDrawable ~= holsterVariant then
                            SetPedComponentVariation(ped, 7, emptyDrawable, GetPedTextureVariation(ped, 7), 2)
                        end

                        SetCurrentPedWeapon(ped, newWeap, true)
                        currWeap = newWeap
                        holstered = false
                        canFire = true
                        ClearPedTasks(ped)
                    elseif newWeap ~= `WEAPON_UNARMED` then
                        SetCurrentPedWeapon(ped, newWeap, true)
                        currWeap = newWeap
                        holstered = false
                    end

                    if newWeap == `WEAPON_UNARMED` and currWeap ~= `WEAPON_UNARMED` and wearingHolster and isWeaponHolsterable(currWeap) and not IsEntityPlayingAnim(ped, 'reaction@intimidation@cop@unarmed', 'intro', 3) then
                        canFire = false
                        CeaseFire()
                        TaskPlayAnim(ped, 'reaction@intimidation@cop@unarmed', 'intro', 3.0, 3.0, -1, 50, 0, false, false, false)
                        Wait(300)

                        local holsteredDrawable = Config.WeapDraw.variants[holsterVariant]
                        if holsteredDrawable and holsteredDrawable ~= holsterVariant then
                            SetPedComponentVariation(ped, 7, holsteredDrawable, GetPedTextureVariation(ped, 7), 2)
                        end

                        SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
                        currWeap = `WEAPON_UNARMED`
                        holstered = true
                        canFire = true
                        ClearPedTasks(ped)
                    end
                end
            end
        end
        Wait(250)
    end
end)



function CeaseFire()
    CreateThread(function()
        if GetResourceState('qb-inventory') == 'missing' then return end
        while not canFire do
            DisableControlAction(0, 25, true)
            DisablePlayerFiring(PlayerId(), true)
            Wait(0)
        end
    end)
end
