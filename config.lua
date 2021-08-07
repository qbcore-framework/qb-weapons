Config = Config or {}

Config.DurabilityBlockedWeapons = {
    "weapon_stungun",
    "weapon_nightstick",
    "weapon_flashlight",
    "weapon_unarmed",
}

Config.DurabilityMultiplier = {
    ["weapon_unarmed"] 				 = 0.15,
    ["weapon_knife"] 				 = 0.15,
    ["weapon_nightstick"] 			 = 0.15,
    ["weapon_hammer"] 				 = 0.15,
    ["weapon_bat"] 					 = 0.15,
    ["weapon_golfclub"] 			 = 0.15,
    ["weapon_crowbar"] 				 = 0.15,
    ["weapon_pistol"] 				 = 0.15,
    ["weapon_pistol_mk2"] 			 = 0.15,
    ["weapon_combatpistol"] 		 = 0.15,
    ["weapon_appistol"] 			 = 0.15,
    ["weapon_pistol50"] 			 = 0.15,
    ["weapon_microsmg"] 			 = 0.15,
    ["weapon_smg"] 				 	 = 0.15,
    ["weapon_assaultsmg"] 			 = 0.15,
    ["weapon_assaultrifle"] 		 = 0.15,
    ["weapon_carbinerifle"] 		 = 0.15,
    ["weapon_advancedrifle"] 		 = 0.15,
    ["weapon_mg"] 					 = 0.15,
    ["weapon_combatmg"] 			 = 0.15,
    ["weapon_pumpshotgun"] 			 = 0.15,
    ["weapon_sawnoffshotgun"] 		 = 0.15,
    ["weapon_assaultshotgun"] 		 = 0.15,
    ["weapon_bullpupshotgun"] 		 = 0.15,
    ["weapon_stungun"] 				 = 0.15,
    ["weapon_sniperrifle"] 			 = 0.15,
    ["weapon_heavysniper"] 			 = 0.15,
    ["weapon_remotesniper"] 		 = 0.15,
    ["weapon_grenadelauncher"] 		 = 0.15,
    ["weapon_grenadelauncher_smoke"] = 0.15,
    ["weapon_rpg"] 					 = 0.15,
    ["weapon_minigun"] 				 = 0.15,
    ["weapon_grenade"] 				 = 0.15,
    ["weapon_stickybomb"] 			 = 0.15,
    ["weapon_smokegrenade"] 		 = 0.15,
    ["weapon_bzgas"] 				 = 0.15,
    ["weapon_molotov"] 				 = 0.15,
    ["weapon_fireextinguisher"] 	 = 0.15,
    ["weapon_petrolcan"] 			 = 0.15,
    ["weapon_briefcase"] 			 = 0.15,
    ["weapon_briefcase_02"] 		 = 0.15,
    ["weapon_ball"] 				 = 0.15,
    ["weapon_flare"] 				 = 0.15,
    ["weapon_snspistol"] 			 = 0.15,
    ["weapon_bottle"] 				 = 0.15,
    ["weapon_gusenberg"] 			 = 0.15,
    ["weapon_specialcarbine"] 		 = 0.15,
    ["weapon_heavypistol"] 			 = 0.15,
    ["weapon_bullpuprifle"] 		 = 0.15,
    ["weapon_dagger"] 				 = 0.15,
    ["weapon_vintagepistol"] 		 = 0.15,
    ["weapon_firework"] 			 = 0.15,
    ["weapon_musket"] 			     = 0.15,
    ["weapon_heavyshotgun"] 		 = 0.15,
    ["weapon_marksmanrifle"] 		 = 0.15,
    ["weapon_hominglauncher"] 		 = 0.15,
    ["weapon_proxmine"] 			 = 0.15,
    ["weapon_snowball"] 		     = 0.15,
    ["weapon_flaregun"] 			 = 0.15,
    ["weapon_garbagebag"] 			 = 0.15,
    ["weapon_handcuffs"] 			 = 0.15,
    ["weapon_combatpdw"] 			 = 0.15,
    ["weapon_marksmanpistol"] 		 = 0.15,
    ["weapon_knuckle"] 				 = 0.15,
    ["weapon_hatchet"] 				 = 0.15,
    ["weapon_railgun"] 				 = 0.15,
    ["weapon_machete"] 				 = 0.15,
    ["weapon_machinepistol"] 		 = 0.15,
    ["weapon_switchblade"] 			 = 0.15,
    ["weapon_revolver"] 			 = 0.15,
    ["weapon_dbshotgun"] 			 = 0.15,
    ["weapon_compactrifle"] 		 = 0.15,
    ["weapon_autoshotgun"] 			 = 0.15,
    ["weapon_battleaxe"] 			 = 0.15,
    ["weapon_compactlauncher"] 		 = 0.15,
    ["weapon_minismg"] 				 = 0.15,
    ["weapon_pipebomb"] 			 = 0.15,
    ["weapon_poolcue"] 				 = 0.15,
    ["weapon_wrench"] 				 = 0.15,
    ["weapon_autoshotgun"] 		 	 = 0.15,
    ["weapon_bread"] 				 = 0.15,
}

Config.WeaponRepairPoints = {
    [1] = {
        coords = {x = 964.02, y = -1267.41, z = 34.97, h = 35.5, r = 1.0},
        IsRepairing = false,
        RepairingData = {},
    }
}

Config.WeaponRepairCotsts = {
    ["pistol"] = 1000,
    ["smg"] = 3000,
    ["rifle"] = 5000,
}

Config.WeaponAttachments = {
    ["WEAPON_SNSPISTOL"] = {
        ["extendedclip"] = {
            component = "COMPONENT_SNSPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_VINTAGEPISTOL"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Demper",
            item = "pistol_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_VINTAGEPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
    },
    ["WEAPON_PISTOL"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP_02",
            label = "Demper",
            item = "pistol_suppressor",
        },                                                     
    },
    ["WEAPON_MICROSMG"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Demper",
            item = "smg_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_MICROSMG_CLIP_02",
            label = "Extended Clip",
            item = "smg_extendedclip",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Flashlight",
            item = "smg_flashlight",
        },
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MACRO",
            label = "Scope",
            item = "smg_scope",
        },
    },
    ["WEAPON_MINISMG"] = {
        ["extendedclip"] = {
            component = "COMPONENT_MINISMG_CLIP_02",
            label = "Extended Clip",
            item = "smg_extendedclip",
        },
    },
    ["WEAPON_COMPACTRIFLE"] = {
        ["extendedclip"] = {
            component = "COMPONENT_COMPACTRIFLE_CLIP_02",
            label = "Extended Clip",
            item = "rifle_extendedclip",
        },
        ["drummag"] = {
            component = "COMPONENT_COMPACTRIFLE_CLIP_03",
            label = "Drum Mag",
            item = "rifle_drummag",
        },
    },
}

Config.Throwables = {
    'weapon_molotov', 'weapon_stickybomb', 'weapon_snowball'
}
