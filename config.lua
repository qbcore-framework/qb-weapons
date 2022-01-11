Config = Config or {}

Config.DurabilityBlockedWeapons = {
    "weapon_stungun",
    "weapon_nightstick",
    "weapon_flashlight",
    "weapon_unarmed",
}

Config.DurabilityMultiplier = {
	-- Melee
	-- ['weapon_unarmed'] 				 = 0.15,
	['weapon_dagger'] 				 = 0.15,
	['weapon_bat'] 				 	 = 0.15,
	['weapon_bottle'] 				 = 0.15,
	['weapon_crowbar'] 				 = 0.15,
	-- ['weapon_flashlight'] 			 = 0.15,
	['weapon_golfclub'] 			 = 0.15,
	['weapon_hammer'] 				 = 0.15,
	['weapon_hatchet'] 				 = 0.15,
	['weapon_knuckle'] 				 = 0.15,
	-- ['weapon_knife'] 				 = 0.15,
	['weapon_machete'] 				 = 0.15,
	['weapon_switchblade'] 			 = 0.15,
	-- ['weapon_nightstick'] 			 = 0.15,
	['weapon_wrench'] 				 = 0.15,
	['weapon_battleaxe'] 			 = 0.15,
	['weapon_poolcue'] 				 = 0.15,
	['weapon_briefcase'] 			 = 0.15,
	['weapon_briefcase_02'] 		 = 0.15,
	['weapon_garbagebag'] 			 = 0.15,
	['weapon_handcuffs'] 			 = 0.15,
	['weapon_bread'] 				 = 0.15,
	['weapon_stone_hatchet'] 		 = 0.15,

	-- Handguns
	['weapon_pistol'] 				 = 0.15,
	['weapon_pistol_mk2'] 			 = 0.15,
	['weapon_combatpistol'] 		 = 0.15,
	['weapon_appistol'] 			 = 0.15,
	-- ['weapon_stungun'] 				 = 0.15,
	['weapon_pistol50'] 			 = 0.15,
	['weapon_snspistol'] 			 = 0.15,
	['weapon_heavypistol'] 			 = 0.15,
	['weapon_vintagepistol'] 		 = 0.15,
	['weapon_flaregun'] 			 = 0.15,
	['weapon_marksmanpistol'] 		 = 0.15,
	['weapon_revolver'] 			 = 0.15,
	['weapon_revolver_mk2'] 		 = 0.15,
	['weapon_doubleaction'] 		 = 0.15,
	['weapon_snspistol_mk2'] 		 = 0.15,
	['weapon_raypistol'] 			 = 0.15,
	['weapon_ceramicpistol'] 		 = 0.15,
	['weapon_navyrevolver'] 		 = 0.15,
	['weapon_gadgetpistol'] 		 = 0.15,

	-- Submachine Guns
	['weapon_microsmg'] 			 = 0.15,
	['weapon_smg'] 				     = 0.15,
	['weapon_smg_mk2'] 				 = 0.15,
	['weapon_assaultsmg'] 			 = 0.15,
	['weapon_combatpdw'] 			 = 0.15,
	['weapon_machinepistol'] 		 = 0.15,
	['weapon_minismg'] 				 = 0.15,
	['weapon_raycarbine'] 			 = 0.15,

	-- Shotguns
	['weapon_pumpshotgun'] 			= 0.15,
	['weapon_sawnoffshotgun'] 		= 0.15,
	['weapon_assaultshotgun'] 		= 0.15,
	['weapon_bullpupshotgun'] 		= 0.15,
	['weapon_musket'] 				= 0.15,
	['weapon_heavyshotgun'] 		= 0.15,
	['weapon_dbshotgun'] 			= 0.15,
	['weapon_autoshotgun'] 			= 0.15,
	['weapon_pumpshotgun_mk2'] 		= 0.15,
	['weapon_combatshotgun'] 		= 0.15,

	-- Assault Rifles
	['weapon_assaultrifle'] 		= 0.15,
	['weapon_assaultrifle_mk2'] 	= 0.15,
	['weapon_carbinerifle'] 		= 0.15,
	['weapon_carbinerifle_mk2'] 	= 0.15,
	['weapon_advancedrifle'] 		= 0.15,
	['weapon_specialcarbine'] 		= 0.15,
	['weapon_bullpuprifle'] 		= 0.15,
	['weapon_compactrifle'] 		= 0.15,
	['weapon_specialcarbine_mk2'] 	= 0.15,
	['weapon_bullpuprifle_mk2'] 	= 0.15,
	['weapon_militaryrifle'] 		= 0.15,

	-- Light Machine Guns
	['weapon_mg'] 				    = 0.15, 
	['weapon_combatmg'] 			= 0.15,
	['weapon_gusenberg'] 			= 0.15,
	['weapon_combatmg_mk2'] 		= 0.15,

	-- Sniper Rifles
	['weapon_sniperrifle'] 			= 0.15,
	['weapon_heavysniper'] 			= 0.15,
	['weapon_marksmanrifle'] 		= 0.15,
	['weapon_remotesniper'] 		= 0.15,
	['weapon_heavysniper_mk2'] 		= 0.15,
	['weapon_marksmanrifle_mk2'] 	= 0.15,

	-- Heavy Weapons
	['weapon_rpg'] 				    = 0.15,
	['weapon_grenadelauncher'] 		= 0.15,
	['weapon_grenadelauncher_smoke']= 0.15,
	['weapon_minigun'] 				= 0.15,
	['weapon_firework'] 			= 0.15,
	['weapon_railgun'] 				= 0.15,
	['weapon_hominglauncher'] 		= 0.15,
	['weapon_compactlauncher'] 		= 0.15,
	['weapon_rayminigun'] 			= 0.15,

	-- Throwables
	['weapon_grenade'] 				= 0.15,
	['weapon_bzgas'] 				= 0.15,
	['weapon_molotov'] 				= 0.15,
	['weapon_stickybomb'] 			= 0.15,
	['weapon_proxmine'] 			= 0.15,
	['weapon_snowball'] 			= 0.15,
	['weapon_pipebomb'] 			= 0.15,
	['weapon_ball'] 				= 0.15,
	['weapon_smokegrenade'] 		= 0.15,
	['weapon_flare'] 				= 0.15,

	-- Miscellaneous
	['weapon_petrolcan'] 			= 0.15,
	['weapon_fireextinguisher'] 	= 0.15,
	['weapon_hazardcan'] 			= 0.15,
}

Config.WeaponRepairPoints = {
    [1] = {
        coords = vector3(964.02, -1267.41, 34.97),
        IsRepairing = false,
        RepairingData = {},
    }
}

Config.WeaponRepairCosts = {
    ["pistol"] = 1000,
    ["smg"] = 3000,
    ["mg"] = 4000,
    ["rifle"] = 5000,
    ["sniper"] = 7000,
}

WeaponAttachments = {
    -- PISTOLS
    ['WEAPON_PISTOL'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_PISTOL_CLIP_02',
            label = 'Extended Clip',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            label = 'Flashlight',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP_02',
            label = 'Suppressor',
            item = 'pistol_suppressor',
        },
    },
    ['WEAPON_COMBATPISTOL'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_COMBATPISTOL_CLIP_02',
            label = 'Extended Clip',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            label = 'Flashlight',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            label = 'Suppressor',
            item = 'pistol_suppressor',
        },                                                  
    },
    ['WEAPON_APPISTOL'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_APPISTOL_CLIP_02',
            label = 'Extended Clip',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            label = 'Flashlight',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            label = 'Suppressor',
            item = 'pistol_suppressor',
        },                                                    
    },
    ['WEAPON_PISTOL50'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_PISTOL50_CLIP_02',
            label = 'Extended Clip',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            label = 'Flashlight',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            label = 'Suppressor',
            item = 'pistol_suppressor',
        },                                           
    },
    ['WEAPON_SNSPISTOL'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_SNSPISTOL_CLIP_02',
            label = 'Extended Clip',
            item = 'pistol_extendedclip',
            type = 'clip',
        },                                          
    },
    ['WEAPON_HEAVYPISTOL'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_HEAVYPISTOL_CLIP_02',
            label = 'Extended Clip',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            label = 'Flashlight',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            label = 'Suppressor',
            item = 'pistol_suppressor',
        },                                           
    },
    ['WEAPON_VINTAGEPISTOL'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_VINTAGEPISTOL_CLIP_02',
            label = 'Extended Clip',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            label = 'Suppressor',
            item = 'pistol_suppressor',
        },                                           
    },
    -- SMG'S
    ['WEAPON_MICROSMG'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_MICROSMG_CLIP_02',
            label = 'Extended Clip',
            item = 'microsmg_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            label = 'Flashlight',
            item = 'smg_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO',
            label = 'Scope',
            item = 'smg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            label = 'Suppressor',
            item = 'smg_suppressor',
        },                                             
    },
    ['WEAPON_SMG'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_SMG_CLIP_02',
            label = 'Extended Clip',
            item = 'smg_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_SMG_CLIP_03',
            label = 'Drum Magazine',
            item = 'smg_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            label = 'Flashlight',
            item = 'smg_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO_02',
            label = 'Scope',
            item = 'smg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            label = 'Suppressor',
            item = 'smg_suppressor',
        },                                           
    },
    ['WEAPON_ASSAULTSMG'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_ASSAULTSMG_CLIP_02',
            label = 'Extended Clip',
            item = 'smg_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            label = 'Flashlight',
            item = 'smg_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO',
            label = 'Scope',
            item = 'smg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            label = 'Suppressor',
            item = 'smg_suppressor',
        },                                          
    },
    ['WEAPON_MINISMG'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_MINISMG_CLIP_02',
            label = 'Extended Clip',
            item = 'smg_extendedclip',
            type = 'clip',
        },
    },
    ['WEAPON_MACHINEPISTOL'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_MACHINEPISTOL_CLIP_02',
            label = 'Extended Clip',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_MACHINEPISTOL_CLIP_03',
            label = 'Drum Magazine',
            item = 'pistol_drum',
            type = 'clip',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            label = 'Suppressor',
            item = 'pistol_suppressor',
        },                                            
    },
    ['WEAPON_COMBATPDW'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_COMBATPDW_CLIP_02',
            label = 'Extended Clip',
            item = 'smg_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_COMBATPDW_CLIP_03',
            label = 'Drum Magazine',
            item = 'smg_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            label = 'Flashlight',
            item = 'smg_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            label = 'Scope',
            item = 'smg_scope',
        },                                            
    },
    -- SHOTGUNS
    ['WEAPON_PUMPSHOTGUN'] = {
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            label = 'Flashlight',
            item = 'shotgun_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_SR_SUPP',
            label = 'Suppressor',
            item = 'shotgun_suppressor',
        },                                      
    },
    ['WEAPON_ASSAULTSHOTGUN'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_ASSAULTSHOTGUN_CLIP_02',
            label = 'Extended Clip',
            item = 'shotgun_extendedclip',
            type = 'clip',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            label = 'Suppressor',
            item = 'shotgun_suppressor',
        },
                               
    },
    ['WEAPON_BULLPUPSHOTGUN'] = {
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            label = 'Suppressor',
            item = 'shotgun_suppressor',
        },                                  
    },
    ['WEAPON_HEAVYSHOTGUN'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_HEAVYSHOTGUN_CLIP_02',
            label = 'Extended Clip',
            item = 'shotgun_extendedclip',
            type = 'clip',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            label = 'Suppressor',
            item = 'shotgun_suppressor',
        },                               
    },
    ['WEAPON_COMBATSHOTGUN'] = {
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            label = 'Suppressor',
            item = 'shotgun_suppressor',
        },                                  
    },
    -- RIFLES
    ['WEAPON_ASSAULTRIFLE'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_ASSAULTRIFLE_CLIP_02',
            label = 'Extended Clip',
            item = 'rifle_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_ASSAULTRIFLE_CLIP_03',
            label = 'Drum Magazine',
            item = 'rifle_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            label = 'Flashlight',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO',
            label = 'Scope',
            item = 'rifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            label = 'Suppressor',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            label = 'Grip',
            item = 'rifle_grip',
        },        
    },
    ['WEAPON_CARBINERIFLE'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_CARBINERIFLE_CLIP_02',
            label = 'Extended Clip',
            item = 'rifle_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_CARBINERIFLE_CLIP_03',
            label = 'Drum Magazine',
            item = 'rifle_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            label = 'Flashlight',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM',
            label = 'Scope',
            item = 'rifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            label = 'Suppressor',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            label = 'Grip',
            item = 'rifle_grip',
        },                           
    },
    ['WEAPON_ADVANCEDRIFLE'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_ADVANCEDRIFLE_CLIP_02',
            label = 'Extended Clip',
            item = 'rifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            label = 'Flashlight',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            label = 'Scope',
            item = 'rifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            label = 'Suppressor',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            label = 'Grip',
            item = 'rifle_grip',
        },                           
    },
    ['WEAPON_SPECIALCARBINE'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_SPECIALCARBINE_CLIP_02',
            label = 'Extended Clip',
            item = 'rifle_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_SPECIALCARBINE_CLIP_03',
            label = 'Drum Magazine',
            item = 'rifle_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            label = 'Flashlight',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM',
            label = 'Scope',
            item = 'rifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            label = 'Suppressor',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            label = 'Grip',
            item = 'rifle_grip',
        },                            
    },
    ['WEAPON_BULLPUPRIFLE'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_BULLPUPRIFLE_CLIP_02',
            label = 'Extended Clip',
            item = 'rifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            label = 'Flashlight',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            label = 'Scope',
            item = 'rifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            label = 'Suppressor',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            label = 'Grip',
            item = 'rifle_grip',
        },                           
    },
    ['WEAPON_COMPACTRIFLE'] = {
        ['extendedclip'] = {
            component = 'COMPONENT_COMPACTRIFLE_CLIP_02',
            label = 'Extended Clip',
            item = 'rifle_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_COMPACTRIFLE_CLIP_03',
            label = 'Drum Magazine',
            item = 'rifle_drum',
            type = 'clip',
        },                               
    },
    ['WEAPON_SNIPERRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_SNIPERRIFLE_CLIP_01',
            label = 'Default Clip',
            item = 'sniperrifle_defaultclip',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            label = 'Suppressor',
            item = 'smg_suppressor',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_LARGE',
            label = 'Scope',
            item = 'sniper_scope',
            type = 'scope',
        },
        ['advancedscope'] = {
            component = 'COMPONENT_AT_SCOPE_MAX',
            label = 'Scope',
            item = 'snipermax_scope',
            type = 'scope',
        },
        ['grip'] = {
            component = 'COMPONENT_SNIPERRIFLE_VARMOD_LUXE',
            label = 'Grip',
            item = 'sniper_grip',
        },                             
    },
    ['WEAPON_HEAVYSNIPER'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_HEAVYSNIPER_CLIP_01',
            label = 'Default Clip',
            item = 'heavysniper_defaultclip',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_LARGE',
            label = 'Scope',
            item = 'sniper_scope',
            type = 'scope',
        },
        ['advancedscope'] = {
            component = 'COMPONENT_AT_SCOPE_MAX',
            label = 'Scope',
            item = 'snipermax_scope',
            type = 'scope',
        },                            
    },
    ['WEAPON_MARKSMANRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_MARKSMANRIFLE_CLIP_01',
            label = 'Default Clip',
            item = 'marksmanrifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_MARKSMANRIFLE_CLIP_02',
            label = 'Extended Clip',
            item = 'marksmanrifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            label = 'Flashlight',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM',
            label = 'Scope',
            item = 'marksmanrifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            label = 'Suppressor',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            label = 'Grip',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_MARKSMANRIFLE_VARMOD_LUXE',
            label = 'Luxury Finish',
            item = 'marksmanrifle_luxuryfinish',
        },                              
    },
}
