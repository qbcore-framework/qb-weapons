Config = Config or {}

Config.ReloadTime = math.random(4000, 6000)

Config.DurabilityBlockedWeapons = {
    "weapon_stungun",
    "weapon_nightstick",
    "weapon_flashlight",
    "weapon_unarmed",
	"weapon_knuckle",
	"weapon_knife",
	"weapon_switchblade",
	"weapon_dagger",
	"weapon_crowbar",
	"weapon_hammer",
	"weapon_hatchet",
	"weapon_machete",
	"weapon_wrench",
	"weapon_battleaxe",
	"weapon_poolcue",
	"weapon_stone_hatchet",
	"weapon_candycane",
}

Config.Throwables = {
    "ball",
    "bzgas",
    "flare",
    "grenade",
    "molotov",
    "pipebomb",
    "proxmine",
    "smokegrenade",
    "snowball",
    "stickybomb",
}

Config.DurabilityMultiplier = {
    -- Melee
    -- ['weapon_unarmed'] 			 = 0.15,
    ['weapon_dagger']                = 0.15,
    ['weapon_bat']                   = 0.15,
    ['weapon_bottle']                = 0.15,
    ['weapon_crowbar']               = 0.15,
    ['weapon_candycane']             = 0.15,
    -- ['weapon_flashlight'] 		 = 0.15,
    ['weapon_golfclub']              = 0.15,
    ['weapon_hammer']                = 0.15,
    ['weapon_hatchet']               = 0.15,
    ['weapon_knuckle']               = 0.15,
    ['weapon_knife']                 = 0.15,
    ['weapon_machete']               = 0.15,
    ['weapon_switchblade']           = 0.15,
    -- ['weapon_nightstick'] 		 = 0.15,
    ['weapon_wrench']                = 0.15,
    ['weapon_battleaxe']             = 0.15,
    ['weapon_poolcue']               = 0.15,
    ['weapon_stone_hatchet']         = 0.15,

    -- Handguns
    ['weapon_pistol']                = 0.15,
    ['weapon_pistol_mk2']            = 0.15,
    ['weapon_combatpistol']          = 0.15,
    ['weapon_appistol']              = 0.15,
    -- ['weapon_stungun'] 			 = 0.15,
    -- ['weapon_stungun_mp'] 		 = 0.15,
    ['weapon_pistol50']              = 0.15,
    ['weapon_snspistol']             = 0.15,
    ['weapon_heavypistol']           = 0.15,
    ['weapon_vintagepistol']         = 0.15,
    ['weapon_flaregun']              = 0.15,
    ['weapon_marksmanpistol']        = 0.15,
    ['weapon_revolver']              = 0.15,
    ['weapon_revolver_mk2']          = 0.15,
    ['weapon_doubleaction']          = 0.15,
    ['weapon_snspistol_mk2']         = 0.15,
    ['weapon_raypistol']             = 0.15,
    ['weapon_ceramicpistol']         = 0.15,
    ['weapon_navyrevolver']          = 0.15,
    ['weapon_gadgetpistol']          = 0.15,
    ['weapon_pistolxm3']             = 0.15,

    -- Submachine Guns
    ['weapon_microsmg']              = 0.15,
    ['weapon_smg']                   = 0.15,
    ['weapon_smg_mk2']               = 0.15,
    ['weapon_assaultsmg']            = 0.15,
    ['weapon_combatpdw']             = 0.15,
    ['weapon_machinepistol']         = 0.15,
    ['weapon_minismg']               = 0.15,
    ['weapon_raycarbine']            = 0.15,
	['weapon_gusenberg']             = 0.15,
	['weapon_tecpistol']             = 0.15,
	
    -- Shotguns
    ['weapon_pumpshotgun']           = 0.15,
    ['weapon_sawnoffshotgun']        = 0.15,
    ['weapon_assaultshotgun']        = 0.15,
    ['weapon_bullpupshotgun']        = 0.15,
    ['weapon_musket']                = 0.15,
    ['weapon_heavyshotgun']          = 0.15,
    ['weapon_dbshotgun']             = 0.15,
    ['weapon_autoshotgun']           = 0.15,
    ['weapon_pumpshotgun_mk2']       = 0.15,
    ['weapon_combatshotgun']         = 0.15,

    -- Assault Rifles
    ['weapon_assaultrifle']          = 0.15,
    ['weapon_assaultrifle_mk2']      = 0.15,
    ['weapon_carbinerifle']          = 0.15,
    ['weapon_carbinerifle_mk2']      = 0.15,
    ['weapon_advancedrifle']         = 0.15,
    ['weapon_specialcarbine']        = 0.15,
    ['weapon_bullpuprifle']          = 0.15,
    ['weapon_compactrifle']          = 0.15,
    ['weapon_specialcarbine_mk2']    = 0.15,
    ['weapon_bullpuprifle_mk2']      = 0.15,
    ['weapon_militaryrifle']         = 0.15,
    ['weapon_heavyrifle']            = 0.15,
	['weapon_tacticalrifle']         = 0.15,

    -- Machine Guns
    ['weapon_mg']                    = 0.15,
    ['weapon_combatmg']              = 0.15,
    ['weapon_combatmg_mk2']          = 0.15,
	['weapon_raycarbine']            = 0.15,

    -- Sniper Rifles
    ['weapon_sniperrifle']           = 0.15,
    ['weapon_heavysniper']           = 0.15,
    ['weapon_marksmanrifle']         = 0.15,
    ['weapon_heavysniper_mk2']       = 0.15,
    ['weapon_marksmanrifle_mk2']     = 0.15,
	['weapon_precisionrifle']		 = 0.15,

    -- Heavy Weapons
    ['weapon_rpg']                   = 0.15,
    ['weapon_grenadelauncher']       = 0.15,
    ['weapon_grenadelauncher_smoke'] = 0.15,
    ['weapon_emplauncher']           = 0.15,
    ['weapon_minigun']               = 0.15,
    ['weapon_firework']              = 0.15,
    ['weapon_railgun']               = 0.15,
    ['weapon_hominglauncher']        = 0.15,
    ['weapon_compactlauncher']       = 0.15,
    ['weapon_rayminigun']            = 0.15,
    ['weapon_railgunxm3']            = 0.15,

    -- Throwables
    ['weapon_grenade']               = 0.15,
    ['weapon_bzgas']                 = 0.15,
    ['weapon_molotov']               = 0.15,
    ['weapon_stickybomb']            = 0.15,
    ['weapon_proxmine']              = 0.15,
    ['weapon_snowball']              = 0.15,
    ['weapon_pipebomb']              = 0.15,
    ['weapon_ball']                  = 0.15,
    ['weapon_smokegrenade']          = 0.15,
    ['weapon_flare']                 = 0.15,

    -- Miscellaneous
    ['weapon_petrolcan']             = 0.15,
    ['weapon_fireextinguisher']      = 0.15,
    ['weapon_hazardcan']             = 0.15,
    ['weapon_fertilizercan']         = 0.15,
}

Config.WeaponRepairPoints = {
    [1] = {
        coords = vector3(964.02, -1267.41, 34.97),
        IsRepairing = false,
        RepairingData = {},
    }
}

Config.WeaponRepairCosts = {
    ["melee"] = 250,
	["pistol"] = 1000,
    ["smg"] = 3000,
    ["mg"] = 4000,
    ["rifle"] = 5000,
    ["sniper"] = 7000,
    ["shotgun"] = 6000,
	["heavy"] = 9000
}

WeaponAttachments = {
    -- MELEE
	['WEAPON_BAT'] = {
        ['wepskin1'] = {
            component = 'COMPONENT_BAT_VARMOD_XM3',
            item = 'bat_skin1',
        },
		['wepskin2'] = {
            component = 'COMPONENT_BAT_VARMOD_XM3_01',
            item = 'bat_skin2',
        },
		['wepskin3'] = {
            component = 'COMPONENT_BAT_VARMOD_XM3_02',
            item = 'bat_skin3',
        },
		['wepskin4'] = {
            component = 'COMPONENT_BAT_VARMOD_XM3_03',
            item = 'bat_skin4',
        },
		['wepskin5'] = {
            component = 'COMPONENT_BAT_VARMOD_XM3_04',
            item = 'bat_skin5',
        },
		['wepskin6'] = {
            component = 'COMPONENT_BAT_VARMOD_XM3_05',
            item = 'bat_skin6',
        },
		['wepskin7'] = {
            component = 'COMPONENT_BAT_VARMOD_XM3_06',
            item = 'bat_skin7',
        },
		['wepskin8'] = {
            component = 'COMPONENT_BAT_VARMOD_XM3_07',
            item = 'bat_skin8',
        },
		['wepskin9'] = {
            component = 'COMPONENT_BAT_VARMOD_XM3_08',
            item = 'bat_skin9',
        },
		['wepskin10'] = {
            component = 'COMPONENT_BAT_VARMOD_XM3_09',
            item = 'bat_skin10',
        },
    },
	['WEAPON_KNUCKLE'] = {
        ['wepskin1'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_BALLAS',
            item = 'knuckle_skin1',
        },
		['wepskin2'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_BASE',
            item = 'knuckle_skin2',
        },
		['wepskin3'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_DIAMOND',
            item = 'knuckle_skin3',
        },
		['wepskin4'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_DOLLAR',
            item = 'knuckle_skin4',
        },
		['wepskin5'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_HATE',
            item = 'knuckle_skin5',
        },
		['wepskin6'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_KING',
            item = 'knuckle_skin6',
        },
		['wepskin7'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_LOVE',
            item = 'knuckle_skin7',
        },
		['wepskin8'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_PIMP',
            item = 'knuckle_skin8',
        },
		['wepskin9'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_PLAYER',
            item = 'knuckle_skin9',
        },
		['wepskin10'] = {
            component = 'COMPONENT_KNUCKLE_VARMOD_VAGOS',
            item = 'knuckle_skin10',
        },
    },
	['WEAPON_KNIFE'] = {
        ['wepskin1'] = {
            component = 'COMPONENT_KNIFE_VARMOD_XM3',
            item = 'knife_skin1',
        },
		['wepskin2'] = {
            component = 'COMPONENT_KNIFE_VARMOD_XM3_01',
            item = 'knife_skin2',
        },
		['wepskin3'] = {
            component = 'COMPONENT_KNIFE_VARMOD_XM3_02',
            item = 'knife_skin3',
        },
		['wepskin4'] = {
            component = 'COMPONENT_KNIFE_VARMOD_XM3_03',
            item = 'knife_skin4',
        },
		['wepskin5'] = {
            component = 'COMPONENT_KNIFE_VARMOD_XM3_04',
            item = 'knife_skin5',
        },
		['wepskin6'] = {
            component = 'COMPONENT_KNIFE_VARMOD_XM3_05',
            item = 'knife_skin6',
        },
		['wepskin7'] = {
            component = 'COMPONENT_KNIFE_VARMOD_XM3_06',
            item = 'knife_skin7',
        },
		['wepskin8'] = {
            component = 'COMPONENT_KNIFE_VARMOD_XM3_07',
            item = 'knife_skin8',
        },
		['wepskin9'] = {
            component = 'COMPONENT_KNIFE_VARMOD_XM3_08',
            item = 'knife_skin9',
        },
		['wepskin10'] = {
            component = 'COMPONENT_KNIFE_VARMOD_XM3_09',
            item = 'knife_skin10',
        },
    },
	['WEAPON_SWITCHBLADE'] = {
        ['wepskin1'] = {
            component = 'COMPONENT_SWITCHBLADE_VARMOD_BASE',
            item = 'switchblade_skin1',
        },
		['wepskin2'] = {
            component = 'COMPONENT_SWITCHBLADE_VARMOD_VAR1',
            item = 'switchblade_skin2',
        },
		['wepskin3'] = {
            component = 'COMPONENT_SWITCHBLADE_VARMOD_VAR2',
            item = 'switchblade_skin3',
        },
    },
	-- ['WEAPON_UNARMED'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_DAGGER'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_BOTTLE'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_CROWBAR'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_FLASHLIGHT'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_GOLFCLUB'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_HAMMER'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_HATCHET'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_MACHETE'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_NIGHTSTICK'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_WRENCH'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_BATTLEAXE'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_POOLCUE'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_STONE_HATCHET'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_CANDYCANE'] = {}, -- Placeholder, No usable components at this time
	
	-- PISTOLS
	['WEAPON_PISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_PISTOL_CLIP_01',
            item = 'pistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_PISTOL_CLIP_02',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'wep_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP_02',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_PISTOL_VARMOD_LUXE',
            item = 'pistol_luxuryfinish1',
        },
    },
	['WEAPON_COMBATPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_COMBATPISTOL_CLIP_01',
            item = 'combatpistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_COMBATPISTOL_CLIP_02',
            item = 'combatpistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'wep_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER',
            item = 'combatpistol_luxuryfinish1',
        },
    },
	['WEAPON_APPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_APPISTOL_CLIP_01',
            item = 'appistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_APPISTOL_CLIP_02',
            item = 'appistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'wep_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_APPISTOL_VARMOD_LUXE',
            item = 'appistol_luxuryfinish1',
        },
		['luxuryfinish2'] = {
            component = 'COMPONENT_APPISTOL_VARMOD_LUXE',
            item = 'appistol_luxuryfinish2',
        },
    },
	['WEAPON_PISTOL50'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_PISTOL50_CLIP_01',
            item = 'pistol50_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_PISTOL50_CLIP_02',
            item = 'pistol50_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'wep_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_PISTOL50_VARMOD_LUXE',
            item = 'pistol50_luxuryfinish1',
        },
    },
	['WEAPON_SNSPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_SNSPISTOL_CLIP_01',
            item = 'snspistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_SNSPISTOL_CLIP_02',
            item = 'snspistol_extendedclip',
            type = 'clip',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_SNSPISTOL_VARMOD_LOWRIDER',
            item = 'snspistol_luxuryfinish1',
            type = 'skin',
        },
    },
	['WEAPON_HEAVYPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_HEAVYPISTOL_CLIP_01',
            item = 'heavypistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_HEAVYPISTOL_CLIP_02',
            item = 'heavypistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'wep_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_SNSPISTOL_VARMOD_LOWRIDER',
            item = 'heavypistol_luxuryfinish1',
            type = 'skin',
        },
    },
	['WEAPON_VINTAGEPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_VINTAGEPISTOL_CLIP_01',
            item = 'vintagepistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_VINTAGEPISTOL_CLIP_02',
            item = 'vintagepistol_extendedclip',
            type = 'clip',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
            type = 'silencer',
        },
    },
	['WEAPON_REVOLVER'] = {
        ['luxuryfinish1'] = {
            component = 'COMPONENT_REVOLVER_VARMOD_GOON',
            item = 'revolver_luxuryfinish1',
            type = 'skin',
        },
        ['luxuryfinish2'] = {
            component = 'COMPONENT_REVOLVER_VARMOD_BOSS',
            item = 'revolver_luxuryfinish2',
            type = 'skin',
        },
    },
	['WEAPON_PISTOL_MK2'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_PISTOL_MK2_CLIP_01',
            item = 'pistol_mk2_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_PISTOL_MK2_CLIP_02',
            item = 'pistol_mk2_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH_02',
            item = 'wep_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP_02',
            item = 'pistol_suppressor',
        },
		['compensator'] = {
            component = 'COMPONENT_AT_PI_COMP',
            item = 'wep_compensator',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_PISTOL_MK2_VARMOD_XM3',
            item = 'pistol_mk2_luxuryfinish1',
        },
		['luxuryfinish2'] = {
            component = 'COMPONENT_PISTOL_MK2_VARMOD_XM3_SLIDE',
            item = 'pistol_mk2_luxuryfinish2',
        },
		['luxuryfinish3'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO',
            item = 'pistol_mk2_luxuryfinish3',
        },
		['luxuryfinish4'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_02',
            item = 'pistol_mk2_luxuryfinish4',
        },
		['luxuryfinish5'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_03',
            item = 'pistol_mk2_luxuryfinish5',
        },
		['luxuryfinish6'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_04',
            item = 'pistol_mk2_luxuryfinish6',
        },
		['luxuryfinish7'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_05',
            item = 'pistol_mk2_luxuryfinish7',
        },
		['luxuryfinish8'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_06',
            item = 'pistol_mk2_luxuryfinish8',
        },
		['luxuryfinish9'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_07',
            item = 'pistol_mk2_luxuryfinish9',
        },
		['luxuryfinish10'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_08',
            item = 'pistol_mk2_luxuryfinish10',
        },
		['luxuryfinish11'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_09',
            item = 'pistol_mk2_luxuryfinish11',
        },
		['luxuryfinish12'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_10',
            item = 'pistol_mk2_luxuryfinish12',
        },
		['luxuryfinish13'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_IND_01',
            item = 'pistol_mk2_luxuryfinish13',
        },
		['luxuryfinish14'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_SLIDE',
            item = 'pistol_mk2_luxuryfinish14',
        },
		['luxuryfinish15'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_02_SLIDE',
            item = 'pistol_mk2_luxuryfinish15',
        },
		['luxuryfinish16'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_03_SLIDE',
            item = 'pistol_mk2_luxuryfinish16',
        },
		['luxuryfinish17'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_04_SLIDE',
            item = 'pistol_mk2_luxuryfinish17',
        },
		['luxuryfinish18'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_05_SLIDE',
            item = 'pistol_mk2_luxuryfinish18',
        },
		['luxuryfinish19'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_06_SLIDE',
            item = 'pistol_mk2_luxuryfinish19',
        },
		['luxuryfinish20'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_07_SLIDE',
            item = 'pistol_mk2_luxuryfinish20',
        },
		['luxuryfinish21'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_08_SLIDE',
            item = 'pistol_mk2_luxuryfinish21',
        },
		['luxuryfinish22'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_09_SLIDE',
            item = 'pistol_mk2_luxuryfinish22',
        },
		['luxuryfinish23'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_10_SLIDE',
            item = 'pistol_mk2_luxuryfinish23',
        },
		['luxuryfinish24'] = {
            component = 'COMPONENT_PISTOL_MK2_CAMO_IND_01_SLIDE',
            item = 'pistol_mk2_luxuryfinish24',
        },
    },
	['WEAPON_SNSPISTOL_MK2'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CLIP_01',
            item = 'snspistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CLIP_02',
            item = 'snspistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH_03',
            item = 'wep_flashlight',
        },
		['compensator'] = {
            component = 'COMPONENT_AT_PI_COMP_02',
            item = 'wep_compensator',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_PI_RAIL_02',
            item = 'snspistol_mk2_scope',
        },
		['luxuryfinish1'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO',
            item = 'snspistol_mk2_luxuryfinish1',
        },
		['luxuryfinish2'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_02',
            item = 'snspistol_mk2_luxuryfinish2',
        },
		['luxuryfinish3'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_03',
            item = 'snspistol_mk2_luxuryfinish3',
        },
		['luxuryfinish4'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_04',
            item = 'snspistol_mk2_luxuryfinish4',
        },
		['luxuryfinish5'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_05',
            item = 'snspistol_mk2_luxuryfinish5',
        },
		['luxuryfinish6'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_06',
            item = 'snspistol_mk2_luxuryfinish6',
        },
		['luxuryfinish7'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_07',
            item = 'snspistol_mk2_luxuryfinish7',
        },
		['luxuryfinish8'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_08',
            item = 'snspistol_mk2_luxuryfinish8',
        },
		['luxuryfinish9'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_09',
            item = 'snspistol_mk2_luxuryfinish9',
        },
		['luxuryfinish10'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_10',
            item = 'snspistol_mk2_luxuryfinish10',
        },
		['luxuryfinish11'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_IND_01',
            item = 'snspistol_mk2_luxuryfinish11',
        },
		['luxuryfinish12'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_SLIDE',
            item = 'snspistol_mk2_luxuryfinish12',
        },
		['luxuryfinish13'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_02_SLIDE',
            item = 'snspistol_mk2_luxuryfinish13',
        },
		['luxuryfinish14'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_03_SLIDE',
            item = 'snspistol_mk2_luxuryfinish14',
        },
		['luxuryfinish15'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_04_SLIDE',
            item = 'snspistol_mk2_luxuryfinish15',
        },
		['luxuryfinish16'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_05_SLIDE',
            item = 'snspistol_mk2_luxuryfinish16',
        },
		['luxuryfinish17'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_06_SLIDE',
            item = 'snspistol_mk2_luxuryfinish17',
        },
		['luxuryfinish18'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_07_SLIDE',
            item = 'snspistol_mk2_luxuryfinish18',
        },
		['luxuryfinish19'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_08_SLIDE',
            item = 'snspistol_mk2_luxuryfinish19',
        },
		['luxuryfinish20'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_09_SLIDE',
            item = 'snspistol_mk2_luxuryfinish20',
        },
		['luxuryfinish21'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_10_SLIDE',
            item = 'snspistol_mk2_luxuryfinish21',
        },
		['luxuryfinish22'] = {
            component = 'COMPONENT_SNSPISTOL_MK2_CAMO_IND_01_SLIDE',
            item = 'snspistol_mk2_luxuryfinish22',
        },
    },
	['WEAPON_REVOLVER_MK2'] = {
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'wep_flashlight',
        },
		['compensator'] = {
            component = 'COMPONENT_AT_PI_COMP_03',
            item = 'wep_compensator',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO_MK2',
            item = 'revolver_mk2_scope',
        },
		['holosight'] = {
            component = 'COMPONENT_AT_SIGHTS',
            item = 'revolver_mk2_sight',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_REVOLVER_MK2_CAMO',
            item = 'revolver_mk2_luxuryfinish1',
        },
		['luxuryfinish2'] = {
            component = 'COMPONENT_REVOLVER_MK2_CAMO_02',
            item = 'revolver_mk2_luxuryfinish2',
        },
		['luxuryfinish3'] = {
            component = 'COMPONENT_REVOLVER_MK2_CAMO_03',
            item = 'revolver_mk2_luxuryfinish3',
        },
		['luxuryfinish4'] = {
            component = 'COMPONENT_REVOLVER_MK2_CAMO_04',
            item = 'revolver_mk2_luxuryfinish4',
        },
		['luxuryfinish5'] = {
            component = 'COMPONENT_REVOLVER_MK2_CAMO_05',
            item = 'revolver_mk2_luxuryfinish5',
        },
		['luxuryfinish6'] = {
            component = 'COMPONENT_REVOLVER_MK2_CAMO_06',
            item = 'revolver_mk2_luxuryfinish6',
        },
		['luxuryfinish7'] = {
            component = 'COMPONENT_REVOLVER_MK2_CAMO_07',
            item = 'revolver_mk2_luxuryfinish7',
        },
		['luxuryfinish8'] = {
            component = 'COMPONENT_REVOLVER_MK2_CAMO_08',
            item = 'revolver_mk2_luxuryfinish8',
        },
		['luxuryfinish9'] = {
            component = 'COMPONENT_REVOLVER_MK2_CAMO_09',
            item = 'revolver_mk2_luxuryfinish9',
        },
		['luxuryfinish10'] = {
            component = 'COMPONENT_REVOLVER_MK2_CAMO_10',
            item = 'revolver_mk2_luxuryfinish10',
        },
		['luxuryfinish11'] = {
            component = 'COMPONENT_REVOLVER_MK2_CAMO_IND_01',
            item = 'revolver_mk2_luxuryfinish11',
        },
    },
	['WEAPON_RAYPISTOL'] = {
        ['luxuryfinish1'] = {
            component = 'COMPONENT_RAYPISTOL_VARMOD_XMAS18',
            item = 'raypistol_luxuryfinish1',
        },
    },
	['WEAPON_CERAMICPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_CERAMICPISTOL_CLIP_01',
            item = 'ceramicpistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_CERAMICPISTOL_CLIP_02',
            item = 'ceramicppistol_extendedclip',
            type = 'clip',
        },        
        ['suppressor'] = {
            component = 'COMPONENT_CERAMICPISTOL_SUPP',
            item = 'pistol_suppressor',
        },
    },
	['WEAPON_PISTOLXM3'] = {
        ['suppressor'] = {
            component = 'COMPONENT_PISTOLXM3_SUPP',
            item = 'pistol_suppressor',
        },
    },
	-- ['WEAPON_NAVYREVOLVER'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_GADGETPISTOL'] = {}, -- Placeholder, No usable components at this time
    -- ['WEAPON_FLAREGUN'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_MARKSMANPISTOL'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_STUNGUN'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_STUNGUN_MP'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_DOUBLEACTION'] = {}, -- Placeholder, No usable components at this time
	
	-- SMGS
	['WEAPON_MICROSMG'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_MICROSMG_CLIP_01',
            item = 'microsmg_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_MICROSMG_CLIP_02',
            item = 'microsmg_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'wep_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO',
            item = 'microsmg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'smg_suppressor',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_MICROSMG_VARMOD_LUXE',
            item = 'microsmg_luxuryfinish1',
        },
		['luxuryfinish2'] = {
            component = 'COMPONENT_MICROSMG_VARMOD_SECURITY',
            item = 'microsmg_luxuryfinish2',
        },
		['luxuryfinish3'] = {
            component = 'COMPONENT_MICROSMG_VARMOD_XM3',
            item = 'microsmg_luxuryfinish3',
        },
		['luxuryfinish4'] = {
            component = 'COMPONENT_MICROSMG_VARMOD_FRN',
            item = 'microsmg_luxuryfinish4',
        },
    },
    ['WEAPON_SMG'] = { 
        ['defaultclip'] = {
            component = 'COMPONENT_SMG_CLIP_01',
            item = 'smg_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_SMG_CLIP_02',
            item = 'smg_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_SMG_CLIP_03',
            item = 'smg_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO_02',
            item = 'smg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'smg_suppressor',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_SMG_VARMOD_LUXE',
            item = 'smg_luxuryfinish1',
        },
    },
    ['WEAPON_ASSAULTSMG'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_ASSAULTSMG_CLIP_01',
            item = 'assaultsmg_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_ASSAULTSMG_CLIP_02',
            item = 'assaultsmg_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO',
            item = 'assaultsmg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'smg_suppressor',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER',
            item = 'assaultsmg_luxuryfinish1',
        },
    },
    ['WEAPON_GUSENBERG'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_GUSENBERG_CLIP_01',
            item = 'gusenberg_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_GUSENBERG_CLIP_02',
            item = 'gusenberg_extendedclip',
            type = 'clip',
        },
    },
	['WEAPON_MINISMG'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_MINISMG_CLIP_01',
            item = 'minismg_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_MINISMG_CLIP_02',
            item = 'minismg_extendedclip',
            type = 'clip',
        },
    },
    ['WEAPON_MACHINEPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_MACHINEPISTOL_CLIP_01',
            item = 'machinepistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_MACHINEPISTOL_CLIP_02',
            item = 'machinepistol_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_MACHINEPISTOL_CLIP_03',
            item = 'machinepistol_drum',
            type = 'clip',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'smg_suppressor',
        },
    },
    ['WEAPON_COMBATPDW'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_COMBATPDW_CLIP_01',
            item = 'combatpdw_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_COMBATPDW_CLIP_02',
            item = 'combatpdw_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_COMBATPDW_CLIP_03',
            item = 'combatpdw_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'combatpdw_grip',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            item = 'combatpdw_scope',
        },
    },
	['WEAPON_SMG_MK2'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_SMG_MK2_CLIP_01',
            item = 'smg_mk2_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_SMG_MK2_CLIP_02',
            item = 'smg_mk2_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
		['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'smg_suppressor',
        },
        ['scopesmall'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2',
            item = 'smg_mk2_scopesmall',
        },
		['scopemedium'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL_SMG_MK2',
            item = 'smg_mk2_scopemedium',
        },
		['holosight'] = {
            component = 'COMPONENT_AT_SIGHTS_SMG',
            item = 'smg_mk2_sight',
        },
        ['muzzle1'] = {
            component = 'COMPONENT_AT_MUZZLE_01',
            item = 'smg_mk2_muzzle1',
        },
		['muzzle2'] = {
            component = 'COMPONENT_AT_MUZZLE_02',
            item = 'smg_mk2_muzzle2',
        },
		['muzzle3'] = {
            component = 'COMPONENT_AT_MUZZLE_03',
            item = 'smg_mk2_muzzle3',
        },
		['muzzle4'] = {
            component = 'COMPONENT_AT_MUZZLE_04',
            item = 'smg_mk2_muzzle4',
        },
		['muzzle5'] = {
            component = 'COMPONENT_AT_MUZZLE_05',
            item = 'smg_mk2_muzzle5',
        },
		['muzzle6'] = {
            component = 'COMPONENT_AT_MUZZLE_06',
            item = 'smg_mk2_muzzle6',
        },
		['muzzle7'] = {
            component = 'COMPONENT_AT_MUZZLE_07',
            item = 'smg_mk2_muzzle7',
        },
		['barrel1'] = {
            component = 'COMPONENT_AT_SB_BARREL_01',
            item = 'smg_mk2_barrel1',
        },
		['barrel2'] = {
            component = 'COMPONENT_AT_SB_BARREL_02',
            item = 'smg_mk2_barrel2',
        },
		['luxuryfinish1'] = {
            component = 'COMPONENT_SMG_MK2_CAMO',
            item = 'smg_mk2_luxuryfinish1',
        },
		['luxuryfinish2'] = {
            component = 'COMPONENT_SMG_MK2_CAMO_02',
            item = 'smg_mk2_luxuryfinish2',
        },
		['luxuryfinish3'] = {
            component = 'COMPONENT_SMG_MK2_CAMO_03',
            item = 'smg_mk2_luxuryfinish3',
        },
		['luxuryfinish4'] = {
            component = 'COMPONENT_SMG_MK2_CAMO_04',
            item = 'smg_mk2_luxuryfinish4',
        },
		['luxuryfinish5'] = {
            component = 'COMPONENT_SMG_MK2_CAMO_05',
            item = 'smg_mk2_luxuryfinish5',
        },
		['luxuryfinish6'] = {
            component = 'COMPONENT_SMG_MK2_CAMO_06',
            item = 'smg_mk2_luxuryfinish6',
        },
		['luxuryfinish7'] = {
            component = 'COMPONENT_SMG_MK2_CAMO_07',
            item = 'smg_mk2_luxuryfinish7',
        },
		['luxuryfinish8'] = {
            component = 'COMPONENT_SMG_MK2_CAMO_08',
            item = 'smg_mk2_luxuryfinish8',
        },
		['luxuryfinish9'] = {
            component = 'COMPONENT_SMG_MK2_CAMO_09',
            item = 'smg_mk2_luxuryfinish9',
        },
		['luxuryfinish10'] = {
            component = 'COMPONENT_SMG_MK2_CAMO_10',
            item = 'smg_mk2_luxuryfinish10',
        },
		['luxuryfinish11'] = {
            component = 'COMPONENT_SMG_MK2_CAMO_IND_01',
            item = 'smg_mk2_luxuryfinish11',
        },
    },
    ['WEAPON_TECPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_TECPISTOL_CLIP_01',
            item = 'tecpistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_TECPISTOL_CLIP_02',
            item = 'tecpistol_extendedclip',
            type = 'clip',
        },
    },
	
	-- SHOTGUNS
	['WEAPON_PUMPSHOTGUN'] = {
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_SR_SUPP',
            item = 'shotgun_suppressor',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_PUMPSHOTGUN_VARMOD_XM3',
            item = 'pumpshotgun_luxuryfinish1',
        },
		['luxuryfinish2'] = {
            component = 'COMPONENT_PUMPSHOTGUN_VARMOD_SECURITY',
            item = 'pumpshotgun_luxuryfinish2',
        },
		['luxuryfinish3'] = {
            component = 'COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER',
            item = 'pumpshotgun_luxuryfinish3',
        },
    },
    ['WEAPON_SAWNOFFSHOTGUN'] = {
        ['luxuryfinish1'] = {
            component = 'COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE',
            item = 'sawnoffshotgun_luxuryfinish1',
        },
    },
    ['WEAPON_ASSAULTSHOTGUN'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_ASSAULTSHOTGUN_CLIP_01',
            item = 'assaultshotgun_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_ASSAULTSHOTGUN_CLIP_02',
            item = 'assaultshotgun_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'shotgun_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'assaultshotgun_grip',
        },
    },
	['WEAPON_BULLPUPSHOTGUN'] = {
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'shotgun_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'bullpupshotgun_grip',
        },
    },
    ['WEAPON_HEAVYSHOTGUN'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_HEAVYSHOTGUN_CLIP_01',
            item = 'heavyshotgun_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_HEAVYSHOTGUN_CLIP_02',
            item = 'heavyshotgun_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_HEAVYSHOTGUN_CLIP_03',
            item = 'heavyshotgun_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'shotgun_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'heavyshotgun_grip',
        },
    },
    ['WEAPON_COMBATSHOTGUN'] = {
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'shotgun_suppressor',
        },
    },
	['WEAPON_PUMPSHOTGUN_MK2'] = {
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
		['suppressor'] = {
            component = 'COMPONENT_AT_SR_SUPP_03',
            item = 'shotgun_suppressor',
        },
        ['scopesmall'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO_MK2',
            item = 'pumpshotgun_mk2_scopesmall',
        },
		['scopemedium'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL_MK2',
            item = 'pumpshotgun_mk2_scopemedium',
        },
		['holosight'] = {
            component = 'COMPONENT_AT_SIGHTS',
            item = 'pumpshotgun_mk2_sight',
        },
        ['muzzle1'] = {
            component = 'COMPONENT_AT_MUZZLE_08',
            item = 'pumpshotgun_mk2_muzzle1',
        },
		['luxuryfinish1'] = {
            component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO',
            item = 'pumpshotgun_mk2_luxuryfinish1',
        },
		['luxuryfinish2'] = {
            component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_02',
            item = 'pumpshotgun_mk2_luxuryfinish2',
        },
		['luxuryfinish3'] = {
            component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_03',
            item = 'pumpshotgun_mk2_luxuryfinish3',
        },
		['luxuryfinish4'] = {
            component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_04',
            item = 'pumpshotgun_mk2_luxuryfinish4',
        },
		['luxuryfinish5'] = {
            component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_05',
            item = 'pumpshotgun_mk2_luxuryfinish5',
        },
		['luxuryfinish6'] = {
            component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_06',
            item = 'pumpshotgun_mk2_luxuryfinish6',
        },
		['luxuryfinish7'] = {
            component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_07',
            item = 'pumpshotgun_mk2_luxuryfinish7',
        },
		['luxuryfinish8'] = {
            component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_08',
            item = 'pumpshotgun_mk2_luxuryfinish8',
        },
		['luxuryfinish9'] = {
            component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_09',
            item = 'pumpshotgun_mk2_luxuryfinish9',
        },
		['luxuryfinish10'] = {
            component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_10',
            item = 'pumpshotgun_mk2_luxuryfinish10',
        },
		['luxuryfinish11'] = {
            component = 'COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01',
            item = 'pumpshotgun_mk2_luxuryfinish11',
        },
    },
	-- ['WEAPON_DBSHOTGUN'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_AUTOSHOTGUN'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_MUSKET'] = {}, -- Placeholder, No usable components at this time
	
	-- ASSAULT RIFLES
	['WEAPON_ASSAULTRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_ASSAULTRIFLE_CLIP_01',
            item = 'assaultrifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_ASSAULTRIFLE_CLIP_02',
            item = 'assaultrifle_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_ASSAULTRIFLE_CLIP_03',
            item = 'assaultrifle_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
        ['scopesmall'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO',
            item = 'assaultrifle_scopesmall',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'assaultrifle_grip',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_ASSAULTRIFLE_VARMOD_LUXE',
            item = 'assaultrifle_luxuryfinish1',
        },
    },
    ['WEAPON_CARBINERIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_CARBINERIFLE_CLIP_01',
            item = 'carbinerifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_CARBINERIFLE_CLIP_02',
            item = 'carbinerifle_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_CARBINERIFLE_CLIP_03',
            item = 'carbinerifle_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
        ['scopemedium'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM',
            item = 'carbinerifle_scopemedium',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'carbinerifle_grip',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_CARBINERIFLE_VARMOD_LUXE',
            item = 'carbinerifle_luxuryfinish1',
        },
		['luxuryfinish2'] = {
            component = 'COMPONENT_CARBINERIFLE_VARMOD_MICH',
            item = 'carbinerifle_luxuryfinish2',
        },
    },
    ['WEAPON_ADVANCEDRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_ADVANCEDRIFLE_CLIP_01',
            item = 'advancedrifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_ADVANCEDRIFLE_CLIP_02',
            item = 'advancedrifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
        ['scopesmall'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            item = 'advancedrifle_scopesmall',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE',
            item = 'advancedrifle_luxuryfinish1',
        },
    },
    ['WEAPON_SPECIALCARBINE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_SPECIALCARBINE_CLIP_01',
            item = 'specialcarbine_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_SPECIALCARBINE_CLIP_02',
            item = 'specialcarbine_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_SPECIALCARBINE_CLIP_03',
            item = 'specialcarbine_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
        ['scopemedium'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM',
            item = 'specialcarbine_scopemedium',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'specialcarbine_grip',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER',
            item = 'specialcarbine_luxuryfinish1',
        },
    },
    ['WEAPON_BULLPUPRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_BULLPUPRIFLE_CLIP_01',
            item = 'bullpuprifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_BULLPUPRIFLE_CLIP_02',
            item = 'bullpuprifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
        ['scopesmall'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            item = 'bullpuprifle_scopesmall',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'bullpuprifle_grip',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_BULLPUPRIFLE_VARMOD_LOW',
            item = 'bullpuprifle_luxuryfinish1',
        },
    },
    ['WEAPON_COMPACTRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_COMPACTRIFLE_CLIP_01',
            item = 'compactrifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_COMPACTRIFLE_CLIP_02',
            item = 'compactrifle_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_COMPACTRIFLE_CLIP_03',
            item = 'compactrifle_drum',
            type = 'clip',
        },
    },
    ['WEAPON_HEAVYRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_HEAVYRIFLE_CLIP_01',
            item = 'heavyrifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_HEAVYRIFLE_CLIP_02',
            item = 'heavyrifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
		['holosight'] = {
            component = 'COMPONENT_HEAVYRIFLE_SIGHT_01',
            item = 'heavyrifle_sight',
        },
        ['scopemedium'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM',
            item = 'heavyrifle_scopemedium',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'heavyrifle_grip',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_HEAVYRIFLE_CAMO1',
            item = 'heavyrifle_luxuryfinish1',
        },
    },
	['WEAPON_ASSAULTRIFLE_MK2'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_01',
            item = 'assaultrifle_mk2_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_ASSAULTRIFLE_MK2_CLIP_02',
            item = 'assaultrifle_mk2_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
		['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'rifle_suppressor',
        },
		['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP_02',
            item = 'assaultrifle_mk2_grip',
        },
		['holosight'] = {
            component = 'COMPONENT_AT_SIGHTS',
            item = 'assaultrifle_mk2_sight',
        },
		['scopesmall'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO_MK2',
            item = 'assaultrifle_mk2_scopesmall',
        },
		['scopelarge'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM_MK2',
            item = 'assaultrifle_mk2_scopelarge',
        },
        ['muzzle1'] = {
            component = 'COMPONENT_AT_MUZZLE_01',
            item = 'assaultrifle_mk2_muzzle1',
        },
		['muzzle2'] = {
            component = 'COMPONENT_AT_MUZZLE_02',
            item = 'assaultrifle_mk2_muzzle2',
        },
		['muzzle3'] = {
            component = 'COMPONENT_AT_MUZZLE_03',
            item = 'assaultrifle_mk2_muzzle3',
        },
		['muzzle4'] = {
            component = 'COMPONENT_AT_MUZZLE_04',
            item = 'assaultrifle_mk2_muzzle4',
        },
		['muzzle5'] = {
            component = 'COMPONENT_AT_MUZZLE_05',
            item = 'assaultrifle_mk2_muzzle5',
        },
		['muzzle6'] = {
            component = 'COMPONENT_AT_MUZZLE_06',
            item = 'assaultrifle_mk2_muzzle6',
        },
		['muzzle7'] = {
            component = 'COMPONENT_AT_MUZZLE_07',
            item = 'assaultrifle_mk2_muzzle7',
        },
		['barrel1'] = {
            component = 'COMPONENT_AT_AR_BARREL_01',
            item = 'assaultrifle_mk2_barrel1',
        },
		['barrel2'] = {
            component = 'COMPONENT_AT_AR_BARREL_02',
            item = 'assaultrifle_mk2_barrel2',
        },
		['luxuryfinish1'] = {
            component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO',
            item = 'assaultrifle_mk2_luxuryfinish1',
        },
		['luxuryfinish2'] = {
            component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_02',
            item = 'assaultrifle_mk2_luxuryfinish2',
        },
		['luxuryfinish3'] = {
            component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_03',
            item = 'assaultrifle_mk2_luxuryfinish3',
        },
		['luxuryfinish4'] = {
            component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_04',
            item = 'assaultrifle_mk2_luxuryfinish4',
        },
		['luxuryfinish5'] = {
            component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_05',
            item = 'assaultrifle_mk2_luxuryfinish5',
        },
		['luxuryfinish6'] = {
            component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_06',
            item = 'assaultrifle_mk2_luxuryfinish6',
        },
		['luxuryfinish7'] = {
            component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_07',
            item = 'assaultrifle_mk2_luxuryfinish7',
        },
		['luxuryfinish8'] = {
            component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_08',
            item = 'assaultrifle_mk2_luxuryfinish8',
        },
		['luxuryfinish9'] = {
            component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_09',
            item = 'assaultrifle_mk2_luxuryfinish9',
        },
		['luxuryfinish10'] = {
            component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_10',
            item = 'assaultrifle_mk2_luxuryfinish10',
        },
		['luxuryfinish11'] = {
            component = 'COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01',
            item = 'assaultrifle_mk2_luxuryfinish11',
        },
    },
	['WEAPON_CARBINERIFLE_MK2'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_CARBINERIFLE_MK2_CLIP_01',
            item = 'carbinerifle_mk2_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_CARBINERIFLE_MK2_CLIP_02',
            item = 'carbinerifle_mk2_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
		['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
		['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP_02',
            item = 'carbinerifle_mk2_grip',
        },
		['holosight'] = {
            component = 'COMPONENT_AT_SIGHTS',
            item = 'carbinerifle_mk2_sight',
        },
		['scopesmall'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO_MK2',
            item = 'carbinerifle_mk2_scopesmall',
        },
		['scopelarge'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM_MK2',
            item = 'carbinerifle_mk2_scopelarge',
        },
        ['muzzle1'] = {
            component = 'COMPONENT_AT_MUZZLE_01',
            item = 'carbinerifle_mk2_muzzle1',
        },
		['muzzle2'] = {
            component = 'COMPONENT_AT_MUZZLE_02',
            item = 'carbinerifle_mk2_muzzle2',
        },
		['muzzle3'] = {
            component = 'COMPONENT_AT_MUZZLE_03',
            item = 'carbinerifle_mk2_muzzle3',
        },
		['muzzle4'] = {
            component = 'COMPONENT_AT_MUZZLE_04',
            item = 'carbinerifle_mk2_muzzle4',
        },
		['muzzle5'] = {
            component = 'COMPONENT_AT_MUZZLE_05',
            item = 'carbinerifle_mk2_muzzle5',
        },
		['muzzle6'] = {
            component = 'COMPONENT_AT_MUZZLE_06',
            item = 'carbinerifle_mk2_muzzle6',
        },
		['muzzle7'] = {
            component = 'COMPONENT_AT_MUZZLE_07',
            item = 'carbinerifle_mk2_muzzle7',
        },
		['barrel1'] = {
            component = 'COMPONENT_AT_CR_BARREL_01',
            item = 'carbinerifle_mk2_barrel1',
        },
		['barrel2'] = {
            component = 'COMPONENT_AT_CR_BARREL_02',
            item = 'carbinerifle_mk2_barrel2',
        },
		['luxuryfinish1'] = {
            component = 'COMPONENT_CARBINERIFLE_MK2_CAMO',
            item = 'carbinerifle_mk2_luxuryfinish1',
        },
		['luxuryfinish2'] = {
            component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_02',
            item = 'carbinerifle_mk2_luxuryfinish2',
        },
		['luxuryfinish3'] = {
            component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_03',
            item = 'carbinerifle_mk2_luxuryfinish3',
        },
		['luxuryfinish4'] = {
            component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_04',
            item = 'carbinerifle_mk2_luxuryfinish4',
        },
		['luxuryfinish5'] = {
            component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_05',
            item = 'carbinerifle_mk2_luxuryfinish5',
        },
		['luxuryfinish6'] = {
            component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_06',
            item = 'carbinerifle_mk2_luxuryfinish6',
        },
		['luxuryfinish7'] = {
            component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_07',
            item = 'carbinerifle_mk2_luxuryfinish7',
        },
		['luxuryfinish8'] = {
            component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_08',
            item = 'carbinerifle_mk2_luxuryfinish8',
        },
		['luxuryfinish9'] = {
            component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_09',
            item = 'carbinerifle_mk2_luxuryfinish9',
        },
		['luxuryfinish10'] = {
            component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_10',
            item = 'carbinerifle_mk2_luxuryfinish10',
        },
		['luxuryfinish11'] = {
            component = 'COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01',
            item = 'carbinerifle_mk2_luxuryfinish11',
        },
    },
	['WEAPON_SPECIALCARBINE_MK2'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_01',
            item = 'specialcarbine_mk2_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_SPECIALCARBINE_MK2_CLIP_02',
            item = 'specialcarbine_mk2_extendedclip',
            type = 'clip',
        },
		['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'rifle_suppressor',
        },
        ['holosight'] = {
            component = 'COMPONENT_AT_SIGHTS',
            item = 'specialcarbine_mk2_sight',
        },
		['scopesmall'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO_MK2',
            item = 'specialcarbine_mk2_scopesmall',
        },
		['scopelarge'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM_MK2',
            item = 'specialcarbine_mk2_scopelarge',
        },
        ['muzzle1'] = {
            component = 'COMPONENT_AT_MUZZLE_01',
            item = 'specialcarbine_mk2_muzzle1',
        },
		['muzzle2'] = {
            component = 'COMPONENT_AT_MUZZLE_02',
            item = 'specialcarbine_mk2_muzzle2',
        },
		['muzzle3'] = {
            component = 'COMPONENT_AT_MUZZLE_03',
            item = 'specialcarbine_mk2_muzzle3',
        },
		['muzzle4'] = {
            component = 'COMPONENT_AT_MUZZLE_04',
            item = 'specialcarbine_mk2_muzzle4',
        },
		['muzzle5'] = {
            component = 'COMPONENT_AT_MUZZLE_05',
            item = 'specialcarbine_mk2_muzzle5',
        },
		['muzzle6'] = {
            component = 'COMPONENT_AT_MUZZLE_06',
            item = 'specialcarbine_mk2_muzzle6',
        },
		['muzzle7'] = {
            component = 'COMPONENT_AT_MUZZLE_07',
            item = 'specialcarbine_mk2_muzzle7',
        },
		['barrel1'] = {
            component = 'COMPONENT_AT_SC_BARREL_01',
            item = 'specialcarbine_mk2_barrel1',
        },
		['barrel2'] = {
            component = 'COMPONENT_AT_SC_BARREL_02',
            item = 'specialcarbine_mk2_barrel2',
        },
		['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP_02',
            item = 'specialcarbine_mk2_grip',
        },
		['luxuryfinish1'] = {
            component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO',
            item = 'specialcarbine_mk2_luxuryfinish1',
        },
		['luxuryfinish2'] = {
            component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_02',
            item = 'specialcarbine_mk2_luxuryfinish2',
        },
		['luxuryfinish3'] = {
            component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_03',
            item = 'specialcarbine_mk2_luxuryfinish3',
        },
		['luxuryfinish4'] = {
            component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_04',
            item = 'specialcarbine_mk2_luxuryfinish4',
        },
		['luxuryfinish5'] = {
            component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_05',
            item = 'specialcarbine_mk2_luxuryfinish5',
        },
		['luxuryfinish6'] = {
            component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_06',
            item = 'specialcarbine_mk2_luxuryfinish6',
        },
		['luxuryfinish7'] = {
            component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_07',
            item = 'specialcarbine_mk2_luxuryfinish7',
        },
		['luxuryfinish8'] = {
            component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_08',
            item = 'specialcarbine_mk2_luxuryfinish8',
        },
		['luxuryfinish9'] = {
            component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_09',
            item = 'specialcarbine_mk2_luxuryfinish9',
        },
		['luxuryfinish10'] = {
            component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_10',
            item = 'specialcarbine_mk2_luxuryfinish10',
        },
		['luxuryfinish11'] = {
            component = 'COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01',
            item = 'specialcarbine_mk2_luxuryfinish11',
        },
    },
	['WEAPON_BULLPUPRIFLE_MK2'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_01',
            item = 'bullpuprifle_mk2_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_BULLPUPRIFLE_MK2_CLIP_02',
            item = 'bullpuprifle_mk2_extendedclip',
            type = 'clip',
        },
		['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['holosight'] = {
            component = 'COMPONENT_AT_SIGHTS',
            item = 'bullpuprifle_mk2_sight',
        },
		['scopesmall'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO_02_MK2',
            item = 'bullpuprifle_mk2_scopesmall',
        },
		['scopemedium'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL_MK2',
            item = 'bullpuprifle_mk2_scopemedium',
        },
        ['muzzle1'] = {
            component = 'COMPONENT_AT_MUZZLE_01',
            item = 'bullpuprifle_mk2_muzzle1',
        },
		['muzzle2'] = {
            component = 'COMPONENT_AT_MUZZLE_02',
            item = 'bullpuprifle_mk2_muzzle2',
        },
		['muzzle3'] = {
            component = 'COMPONENT_AT_MUZZLE_03',
            item = 'bullpuprifle_mk2_muzzle3',
        },
		['muzzle4'] = {
            component = 'COMPONENT_AT_MUZZLE_04',
            item = 'bullpuprifle_mk2_muzzle4',
        },
		['muzzle5'] = {
            component = 'COMPONENT_AT_MUZZLE_05',
            item = 'bullpuprifle_mk2_muzzle5',
        },
		['muzzle6'] = {
            component = 'COMPONENT_AT_MUZZLE_06',
            item = 'bullpuprifle_mk2_muzzle6',
        },
		['muzzle7'] = {
            component = 'COMPONENT_AT_MUZZLE_07',
            item = 'bullpuprifle_mk2_muzzle7',
        },
		['barrel1'] = {
            component = 'COMPONENT_AT_BP_BARREL_01',
            item = 'bullpuprifle_mk2_barrel1',
        },
		['barrel2'] = {
            component = 'COMPONENT_AT_BP_BARREL_02',
            item = 'bullpuprifle_mk2_barrel2',
        },
		['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP_02',
            item = 'bullpuprifle_mk2_grip',
        },
		['luxuryfinish1'] = {
            component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO',
            item = 'bullpuprifle_mk2_luxuryfinish1',
        },
		['luxuryfinish2'] = {
            component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_02',
            item = 'bullpuprifle_mk2_luxuryfinish2',
        },
		['luxuryfinish3'] = {
            component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_03',
            item = 'bullpuprifle_mk2_luxuryfinish3',
        },
		['luxuryfinish4'] = {
            component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_04',
            item = 'bullpuprifle_mk2_luxuryfinish4',
        },
		['luxuryfinish5'] = {
            component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_05',
            item = 'bullpuprifle_mk2_luxuryfinish5',
        },
		['luxuryfinish6'] = {
            component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_06',
            item = 'bullpuprifle_mk2_luxuryfinish6',
        },
		['luxuryfinish7'] = {
            component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_07',
            item = 'bullpuprifle_mk2_luxuryfinish7',
        },
		['luxuryfinish8'] = {
            component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_08',
            item = 'bullpuprifle_mk2_luxuryfinish8',
        },
		['luxuryfinish9'] = {
            component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_09',
            item = 'bullpuprifle_mk2_luxuryfinish9',
        },
		['luxuryfinish10'] = {
            component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_10',
            item = 'bullpuprifle_mk2_luxuryfinish10',
        },
		['luxuryfinish11'] = {
            component = 'COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01',
            item = 'bullpuprifle_mk2_luxuryfinish11',
        },
    },
	['WEAPON_MILITARYRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_MILITARYRIFLE_CLIP_01',
            item = 'militaryrifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_MILITARYRIFLE_CLIP_02',
            item = 'militaryrifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
        ['ironsights'] = {
            component = 'COMPONENT_MILITARYRIFLE_SIGHT_01',
            item = 'militaryrifle_ironsights',
        },
		['scopesmall'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            item = 'militaryrifle_scopesmall',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
    },
	['WEAPON_TACTICALRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_TACTICALRIFLE_CLIP_01',
            item = 'tacticalrifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_TACTICALRIFLE_CLIP_02',
            item = 'tacticalrifle_extendedclip',
            type = 'clip',
        },
    },
	
	-- MACHINE GUNS
	['WEAPON_MG'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_MG_CLIP_01',
            item = 'mg_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_MG_CLIP_02',
            item = 'mg_extendedclip',
            type = 'clip',
        },
		['scopesmall'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL_02',
            item = 'mg_scopesmall',
        },
		['luxuryfinish1'] = {
            component = 'COMPONENT_MG_VARMOD_LOWRIDER',
            item = 'mg_luxuryfinish1',
        },
    },
	['WEAPON_COMBATMG'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_COMBATMG_CLIP_01',
            item = 'combatmg_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_COMBATMG_CLIP_02',
            item = 'combatmg_extendedclip',
            type = 'clip',
        },
		['scopemedium'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM',
            item = 'combatmg_scopemedium',
        },
		['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'combatmg_grip',
        },
		['luxuryfinish1'] = {
            component = 'COMPONENT_COMBATMG_VARMOD_LOWRIDER',
            item = 'combatmg_luxuryfinish1',
        },
    },
	['WEAPON_COMBATMG_MK2'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_COMBATMG_MK2_CLIP_01',
            item = 'combatmg_mk2_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_COMBATMG_MK2_CLIP_02',
            item = 'combatmg_mk2_extendedclip',
            type = 'clip',
        },
        ['holosight'] = {
            component = 'COMPONENT_AT_SIGHTS',
            item = 'combatmg_mk2_sight',
        },
		['scopemedium'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL_MK2',
            item = 'combatmg_mk2_scopemedium',
        },
		['scopelarge'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM_MK2',
            item = 'combatmg_mk2_scopelarge',
        },
        ['muzzle1'] = {
            component = 'COMPONENT_AT_MUZZLE_01',
            item = 'combatmg_mk2_muzzle1',
        },
		['muzzle2'] = {
            component = 'COMPONENT_AT_MUZZLE_02',
            item = 'combatmg_mk2_muzzle2',
        },
		['muzzle3'] = {
            component = 'COMPONENT_AT_MUZZLE_03',
            item = 'combatmg_mk2_muzzle3',
        },
		['muzzle4'] = {
            component = 'COMPONENT_AT_MUZZLE_04',
            item = 'combatmg_mk2_muzzle4',
        },
		['muzzle5'] = {
            component = 'COMPONENT_AT_MUZZLE_05',
            item = 'combatmg_mk2_muzzle5',
        },
		['muzzle6'] = {
            component = 'COMPONENT_AT_MUZZLE_06',
            item = 'combatmg_mk2_muzzle6',
        },
		['muzzle7'] = {
            component = 'COMPONENT_AT_MUZZLE_07',
            item = 'combatmg_mk2_muzzle7',
        },
		['barrel1'] = {
            component = 'COMPONENT_AT_MG_BARREL_01',
            item = 'combatmg_mk2_barrel1',
        },
		['barrel2'] = {
            component = 'COMPONENT_AT_MG_BARREL_02',
            item = 'combatmg_mk2_barrel2',
        },
		['luxuryfinish1'] = {
            component = 'COMPONENT_COMBATMG_MK2_CAMO',
            item = 'combatmg_mk2_luxuryfinish1',
        },
		['luxuryfinish2'] = {
            component = 'COMPONENT_COMBATMG_MK2_CAMO_02',
            item = 'combatmg_mk2_luxuryfinish2',
        },
		['luxuryfinish3'] = {
            component = 'COMPONENT_COMBATMG_MK2_CAMO_03',
            item = 'combatmg_mk2_luxuryfinish3',
        },
		['luxuryfinish4'] = {
            component = 'COMPONENT_COMBATMG_MK2_CAMO_04',
            item = 'combatmg_mk2_luxuryfinish4',
        },
		['luxuryfinish5'] = {
            component = 'COMPONENT_COMBATMG_MK2_CAMO_05',
            item = 'combatmg_mk2_luxuryfinish5',
        },
		['luxuryfinish6'] = {
            component = 'COMPONENT_COMBATMG_MK2_CAMO_06',
            item = 'combatmg_mk2_luxuryfinish6',
        },
		['luxuryfinish7'] = {
            component = 'COMPONENT_COMBATMG_MK2_CAMO_07',
            item = 'combatmg_mk2_luxuryfinish7',
        },
		['luxuryfinish8'] = {
            component = 'COMPONENT_COMBATMG_MK2_CAMO_08',
            item = 'combatmg_mk2_luxuryfinish8',
        },
		['luxuryfinish9'] = {
            component = 'COMPONENT_COMBATMG_MK2_CAMO_09',
            item = 'combatmg_mk2_luxuryfinish9',
        },
		['luxuryfinish10'] = {
            component = 'COMPONENT_COMBATMG_MK2_CAMO_10',
            item = 'combatmg_mk2_luxuryfinish10',
        },
		['luxuryfinish11'] = {
            component = 'COMPONENT_COMBATMG_MK2_CAMO_IND_01',
            item = 'combatmg_mk2_luxuryfinish11',
        },
    },
	-- ['WEAPON_RAYCARBINE'] = {}, -- Placeholder, No usable components at this time
	
	-- SNIPER RIFLES
	['WEAPON_SNIPERRIFLE'] = {
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'sniper_suppressor',
        },
		['scopemedium'] = {
            component = 'COMPONENT_AT_SCOPE_LARGE',
            item = 'sniperrifle_scopemedium',
            type = 'scope',
        },
        ['scopelarge'] = {
            component = 'COMPONENT_AT_SCOPE_MAX',
            item = 'sniperrifle_scopelarge',
            type = 'scope',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_SNIPERRIFLE_VARMOD_LUXE',
            item = 'sniperrifle_luxuryfinish1',
        },
    },
    ['WEAPON_MARKSMANRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_MARKSMANRIFLE_CLIP_01',
            item = 'marksmanrifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_MARKSMANRIFLE_CLIP_02',
            item = 'marksmanrifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'wep_flashlight',
        },
        ['scopelarge'] = {
            component = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM',
            item = 'marksmanrifle_scopelarge',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'sniper_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'marksmanrifle_grip',
        },
        ['luxuryfinish1'] = {
            component = 'COMPONENT_MARKSMANRIFLE_VARMOD_LUXE',
            item = 'marksmanrifle_luxuryfinish1',
        },
    },
	['WEAPON_HEAVYSNIPER_MK2'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_01',
            item = 'heavysniper_mk2_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_HEAVYSNIPER_MK2_CLIP_02',
            item = 'heavysniper_mk2_extendedclip',
            type = 'clip',
        },
		['suppressor'] = {
            component = 'COMPONENT_AT_SR_SUPP_03',
            item = 'sniper_suppressor',
        },
        ['scopelarge'] = {
            component = 'COMPONENT_AT_SCOPE_MAX',
            item = 'heavysniper_mk2_scopelarge',
        },
        ['muzzle1'] = {
            component = 'COMPONENT_AT_MUZZLE_08',
            item = 'heavysniper_mk2_muzzle1',
        },
		['muzzle2'] = {
            component = 'COMPONENT_AT_MUZZLE_09',
            item = 'heavysniper_mk2_muzzle2',
        },
		['barrel1'] = {
            component = 'COMPONENT_AT_SR_BARREL_01',
            item = 'heavysniper_mk2_barrel1',
        },
		['barrel2'] = {
            component = 'COMPONENT_AT_SR_BARREL_02',
            item = 'heavysniper_mk2_barrel2',
        },
		['luxuryfinish1'] = {
            component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO',
            item = 'heavysniper_mk2_luxuryfinish1',
        },
		['luxuryfinish2'] = {
            component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_02',
            item = 'heavysniper_mk2_luxuryfinish2',
        },
		['luxuryfinish3'] = {
            component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_03',
            item = 'heavysniper_mk2_luxuryfinish3',
        },
		['luxuryfinish4'] = {
            component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_04',
            item = 'heavysniper_mk2_luxuryfinish4',
        },
		['luxuryfinish5'] = {
            component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_05',
            item = 'heavysniper_mk2_luxuryfinish5',
        },
		['luxuryfinish6'] = {
            component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_06',
            item = 'heavysniper_mk2_luxuryfinish6',
        },
		['luxuryfinish7'] = {
            component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_07',
            item = 'heavysniper_mk2_luxuryfinish7',
        },
		['luxuryfinish8'] = {
            component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_08',
            item = 'heavysniper_mk2_luxuryfinish8',
        },
		['luxuryfinish9'] = {
            component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_09',
            item = 'heavysniper_mk2_luxuryfinish9',
        },
		['luxuryfinish10'] = {
            component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_10',
            item = 'heavysniper_mk2_luxuryfinish10',
        },
		['luxuryfinish11'] = {
            component = 'COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01',
            item = 'heavysniper_mk2_luxuryfinish11',
        },
    },
	['WEAPON_MARKSMANRIFLE_MK2'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_01',
            item = 'marksmanrifle_mk2_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_MARKSMANRIFLE_MK2_CLIP_02',
            item = 'marksmanrifle_mk2_extendedclip',
            type = 'clip',
        },
		['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'sniper_suppressor',
        },
        ['holosight'] = {
            component = 'COMPONENT_AT_SIGHTS',
            item = 'marksmanrifle_mk2_sight',
        },
		['scopemedium'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM_MK2',
            item = 'marksmanrifle_mk2_scopemedium',
        },
		['scopelarge'] = {
            component = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2',
            item = 'marksmanrifle_mk2_scopelarge',
        },
        ['muzzle1'] = {
            component = 'COMPONENT_AT_MUZZLE_01',
            item = 'marksmanrifle_mk2__muzzle1',
        },
		['muzzle2'] = {
            component = 'COMPONENT_AT_MUZZLE_02',
            item = 'marksmanrifle_mk2__muzzle2',
        },
		['muzzle3'] = {
            component = 'COMPONENT_AT_MUZZLE_03',
            item = 'marksmanrifle_mk2__muzzle3',
        },
		['muzzle4'] = {
            component = 'COMPONENT_AT_MUZZLE_04',
            item = 'marksmanrifle_mk2__muzzle4',
        },
		['muzzle5'] = {
            component = 'COMPONENT_AT_MUZZLE_05',
            item = 'marksmanrifle_mk2__muzzle5',
        },
		['muzzle6'] = {
            component = 'COMPONENT_AT_MUZZLE_06',
            item = 'marksmanrifle_mk2__muzzle6',
        },
		['muzzle7'] = {
            component = 'COMPONENT_AT_MUZZLE_07',
            item = 'marksmanrifle_mk2__muzzle7',
        },
		['barrel1'] = {
            component = 'COMPONENT_AT_MRFL_BARREL_01',
            item = 'marksmanrifle_mk2_barrel1',
        },
		['barrel2'] = {
            component = 'COMPONENT_AT_MRFL_BARREL_02',
            item = 'marksmanrifle_mk2_barrel2',
        },
		['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP_02',
            item = 'marksmanrifle_mk2_grip',
        },
		['luxuryfinish1'] = {
            component = 'COMPONENT_MARKSMANRIFLE_MK2_CAMO',
            item = 'marksmanrifle_mk2_luxuryfinish1',
        },
		['luxuryfinish2'] = {
            component = 'COMPONENT_MARKSMANRIFLE_MK2_CAMO_02',
            item = 'marksmanrifle_mk2_luxuryfinish2',
        },
		['luxuryfinish3'] = {
            component = 'COMPONENT_MARKSMANRIFLE_MK2_CAMO_03',
            item = 'marksmanrifle_mk2_luxuryfinish3',
        },
		['luxuryfinish4'] = {
            component = 'COMPONENT_MARKSMANRIFLE_MK2_CAMO_04',
            item = 'marksmanrifle_mk2_luxuryfinish4',
        },
		['luxuryfinish5'] = {
            component = 'COMPONENT_MARKSMANRIFLE_MK2_CAMO_05',
            item = 'marksmanrifle_mk2_luxuryfinish5',
        },
		['luxuryfinish6'] = {
            component = 'COMPONENT_MARKSMANRIFLE_MK2_CAMO_06',
            item = 'marksmanrifle_mk2_luxuryfinish6',
        },
		['luxuryfinish7'] = {
            component = 'COMPONENT_MARKSMANRIFLE_MK2_CAMO_07',
            item = 'marksmanrifle_mk2_luxuryfinish7',
        },
		['luxuryfinish8'] = {
            component = 'COMPONENT_MARKSMANRIFLE_MK2_CAMO_08',
            item = 'marksmanrifle_mk2_luxuryfinish8',
        },
		['luxuryfinish9'] = {
            component = 'COMPONENT_MARKSMANRIFLE_MK2_CAMO_09',
            item = 'marksmanrifle_mk2_luxuryfinish9',
        },
		['luxuryfinish10'] = {
            component = 'COMPONENT_MARKSMANRIFLE_MK2_CAMO_10',
            item = 'marksmanrifle_mk2_luxuryfinish10',
        },
		['luxuryfinish11'] = {
            component = 'COMPONENT_MARKSMANRIFLE_MK2_CAMO_IND_01',
            item = 'marksmanrifle_mk2_luxuryfinish11',
        },
		-- ['WEAPON_HEAVYSNIPER'] = {}, -- Placeholder, No usable components at this time
		-- ['WEAPON_PRECISIONRIFLE'] = {}, -- Placeholder, No usable components at this time
    },
	-- ['WEAPON_PRECISIONRIFLE'] = {}, -- Placeholder, No usable components at this time
	
	-- HEAVY WEAPONS
    ['WEAPON_RPG'] = {
        ['luxuryfinish1'] = {
            component = 'COMPONENT_RPG_VARMOD_TVR',
            item = 'rpg_luxuryfinish1',
        },
    },
	-- ['WEAPON_GRENADELAUNCHER'] = {}, -- Placeholder, No usable components at this time
    -- ['WEAPON_GRENADELAUNCHER_SMOKE'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_RAYMINIGUN'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_MINIGUN'] = {}, -- Placeholder, No usable components at this time
    -- ['WEAPON_FIREWORK'] = {}, -- Placeholder, No usable components at this time
    -- ['WEAPON_EMPLAUNCHER'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_COMPACTLAUNCHER'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_RAILGUN'] = {}, -- Placeholder, No usable components at this time
	-- ['WEAPON_HOMINGLAUNCHER'] = {}, -- Placeholder, No usable components at this time
    -- ['WEAPON_RAILGUNXM3'] = {}, -- Placeholder, No usable components at this time
	
}

local function getConfigWeaponAttachments(weapon)
    return WeaponAttachments[weapon]
end

exports('getConfigWeaponAttachments', getConfigWeaponAttachments)