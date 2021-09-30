Config = Config or {}
Config.debug = false

--? Locations to repair weapons
Config.RepairLocations = {
	[1] = { coords = vector4(964.02, -1267.41, 34.97, 35.5), IsRepairing = false,  RepairingData = {}, }
}

--? Weapon category repair costs
Config.RepairCosts = {
    ['pistol'] 	= 1000,
    ['smg'] 	= 3000,
    ['rifle'] 	= 5000,
}

--? Weapon recoil modifiers
Config.Recoils = {
	[`WEAPON_PISTOL`]					= 0.3,  -- PISTOL
	[`WEAPON_COMBATPISTOL`]				= 0.2,  -- COMBAT PISTOL
	[`WEAPON_APPISTOL`]					= 0.3,  -- AP PISTOL
	[`WEAPON_PISTOL50`]					= 0.6,  -- PISTOL .50
	[`WEAPON_MICROSMG`]					= 0.5,  -- MICRO SMG
	[`WEAPON_SMG`]						= 0.4,  -- SMG
	[`WEAPON_ASSAULTSMG`]				= 0.1,  -- ASSAULT SMG
	[`WEAPON_ASSAULTRIFLE`]				= 0.5,  -- ASSAULT RIFLE
	[`WEAPON_CARBINERIFLE`]				= 0.3,  -- CARBINE RIFLE
	[`WEAPON_ADVANCEDRIFLE`]			= 0.1,  -- ADVANCED RIFLE
	[`WEAPON_MG`]						= 0.1,  -- MG
	[`WEAPON_COMBATMG`]					= 0.1,  -- COMBAT MG
	[`WEAPON_PUMPSHOTGUN`]				= 0.4,  -- PUMP SHOTGUN
	[`WEAPON_SAWNOFFSHOTGUN`]			= 0.7,  -- SAWNOFF SHOTGUN
	[`WEAPON_ASSAULTSHOTGUN`]			= 0.4,  -- ASSAULT SHOTGUN
	[`WEAPON_BULLPUPSHOTGUN`]			= 0.2,  -- BULLPUP SHOTGUN
	[`WEAPON_STUNGUN`]					= 0.1,  -- STUN GUN
	[`WEAPON_SNIPERRIFLE`]				= 0.5,  -- SNIPER RIFLE
	[`WEAPON_HEAVYSNIPER`]				= 0.7,  -- HEAVY SNIPER
	[`WEAPON_REMOTESNIPER`]				= 1.2,  -- REMOTE SNIPER
	[`WEAPON_GRENADELAUNCHER`]			= 1.0,  -- GRENADE LAUNCHER
	[`WEAPON_GRENADELAUNCHER_SMOKE`]	= 1.0,  -- GRENADE LAUNCHER SMOKE
	[`WEAPON_RPG`]						= 0.0,  -- RPG
	[`WEAPON_STINGER`]					= 0.0,  -- STINGER
	[`WEAPON_MINIGUN`]					= 0.01, -- MINIGUN
	[`WEAPON_SNSPISTOL`]				= 0.2,  -- SNS PISTOL
	[`WEAPON_GUSENBERG`]				= 0.1,  -- GUSENBERG
	[`WEAPON_SPECIALCARBINE`]			= 0.2,  -- SPECIAL CARBINE
	[`WEAPON_HEAVYPISTOL`]				= 0.5,  -- HEAVY PISTOL
	[`WEAPON_BULLPUPRIFLE`]				= 0.2,  -- BULLPUP RIFLE
	[`WEAPON_VINTAGEPISTOL`]			= 0.4,  -- VINTAGE PISTOL
	[`WEAPON_MUSKET`]					= 0.7,  -- MUSKET
	[`WEAPON_HEAVYSHOTGUN`]				= 0.2,  -- HEAVY SHOTGUN
	[`WEAPON_MARKSMANRIFLE`]			= 0.3,  -- MARKSMAN RIFLE
	[`WEAPON_HOMINGLAUNCHER`]			= 0.0,  -- HOMING LAUNCHER
	[`WEAPON_FLAREGUN`]					= 0.9,  -- FLARE GUN
	[`WEAPON_COMBATPDW`]				= 0.2,  -- COMBAT PDW
	[`WEAPON_MARKSMANPISTOL`]			= 0.9,  -- MARKSMAN PISTOL
	[`WEAPON_RAILGUN`]					= 2.4,  -- RAILGUN
	[`WEAPON_MACHINEPISTOL`]			= 0.3,  -- MACHINE PISTOL
	[`WEAPON_REVOLVER`]					= 0.6,  -- REVOLVER
	[`WEAPON_DBSHOTGUN`]				= 0.7,  -- DOUBLE BARREL SHOTGUN
	[`WEAPON_COMPACTRIFLE`]				= 0.3,  -- COMPACT RIFLE
	[`WEAPON_AUTOSHOTGUN`]				= 0.2,  -- AUTO SHOTGUN
	[`WEAPON_COMPACTLAUNCHER`]			= 0.5,  -- COMPACT LAUNCHER
	[`WEAPON_MINISMG`]					= 0.1,  -- MINI SMG
	[`WEAPON_PISTOL_MK2`]				= 0.5,  -- PISTOL MK2
	[`WEAPON_SMG_MK2`] 					= 0.1,  -- SMG MK2
	[`WEAPON_ASSAULTRIFLE_MK2`] 		= 0.2,  -- ASSAULT RIFLE MK2
	[`WEAPON_CARBINERIFLE_MK2`] 		= 0.1,  -- CARBINE RIFLE MK2
	[`WEAPON_COMBATMG_MK2`] 			= 0.1,  -- COMBAT MG MK2
	[`WEAPON_PUMPSHOTGUN_MK2`] 			= 0.35, -- PUMP SHOTGUN MK2
	[`WEAPON_HEAVYSNIPER_MK2`] 			= 0.6,  -- HEAVY SNIPER MK2
	[`WEAPON_MARKSMANRIFLE_MK2`] 		= 0.25, -- MARKSMAN RIFLE MK2
	[`WEAPON_SPECIALCARBINE_MK2`] 		= 0.15, -- SPECIAL CARBINE MK2
	[`WEAPON_BULLPUPRIFLE_MK2`] 		= 0.15, -- BULLPUP RIFLE MK2
	[`WEAPON_REVOLVER_MK2`] 			= 0.6,  -- REVOLVER MK2
}


--? Wheapons that require the Police holster animation
Config.HolsterWeapons = {
	--'WEAPON_STUNGUN',
	[`WEAPON_PISTOL`] = true,
	[`WEAPON_PISTOL_MK2`] = true,
	[`WEAPON_COMBATPISTOL`] = true,
	[`WEAPON_APPISTOL`] = true,
	[`WEAPON_PISTOL50`] = true,
	[`WEAPON_REVOLVER`] = true,
	[`WEAPON_SNSPISTOL`] = true,
	[`WEAPON_HEAVYPISTOL`] = true,
	[`WEAPON_VINTAGEPISTOL`] = true,
}

--? Weapons exempt from durability
Config.Unbreakable = {
    'weapon_stungun', 'weapon_nightstick', 'weapon_flashlight', 'weapon_unarmed',
	'weapon_grenade', 'weapon_stickybomb', 'weapon_smokegrenade', 'weapon_bzgas',
    'weapon_molotov', 'weapon_ball', 'weapon_proxmine', 'weapon_snowball',
	'weapon_pipebomb',
}

--? Duarability multipliers
Config.DurabilityModifiers = {
    [`weapon_knife`] 				 = 0.15,
    [`weapon_hammer`] 				 = 0.15,
    [`weapon_bat`] 					 = 0.15,
    [`weapon_golfclub`] 			 = 0.15,
    [`weapon_crowbar`] 				 = 0.15,
    [`weapon_pistol`] 				 = 0.15,
    [`weapon_pistol_mk2`] 			 = 0.15,
    [`weapon_combatpistol`] 		 = 0.15,
    [`weapon_appistol`] 			 = 0.15,
    [`weapon_pistol50`] 			 = 0.15,
    [`weapon_microsmg`] 			 = 0.15,
    [`weapon_smg`] 				 	 = 0.15,
    [`weapon_assaultsmg`] 			 = 0.15,
    [`weapon_assaultrifle`] 		 = 0.15,
    [`weapon_carbinerifle`] 		 = 0.15,
    [`weapon_advancedrifle`] 		 = 0.15,
    [`weapon_mg`] 					 = 0.15,
    [`weapon_combatmg`] 			 = 0.15,
    [`weapon_pumpshotgun`] 			 = 0.15,
    [`weapon_sawnoffshotgun`] 		 = 0.15,
    [`weapon_assaultshotgun`] 		 = 0.15,
    [`weapon_bullpupshotgun`] 		 = 0.15,
    [`weapon_stungun`] 				 = 0.15,
    [`weapon_sniperrifle`] 			 = 0.15,
    [`weapon_heavysniper`] 			 = 0.15,
    [`weapon_remotesniper`] 		 = 0.15,
    [`weapon_grenadelauncher`] 		 = 0.15,
    [`weapon_grenadelauncher_smoke`] = 0.15,
    [`weapon_rpg`] 					 = 0.15,
    [`weapon_minigun`] 				 = 0.15,
    [`weapon_fireextinguisher`] 	 = 0.15,
    [`weapon_petrolcan`] 			 = 0.15,
    [`weapon_briefcase`] 			 = 0.15,
    [`weapon_briefcase_02`] 		 = 0.15,
    [`weapon_flare`] 				 = 0.15,
    [`weapon_snspistol`] 			 = 0.15,
    [`weapon_bottle`] 				 = 0.15,
    [`weapon_gusenberg`] 			 = 0.15,
    [`weapon_specialcarbine`] 		 = 0.15,
    [`weapon_heavypistol`] 			 = 0.15,
    [`weapon_bullpuprifle`] 		 = 0.15,
    [`weapon_dagger`] 				 = 0.15,
    [`weapon_vintagepistol`] 		 = 0.15,
    [`weapon_musket`] 			     = 0.15,
    [`weapon_heavyshotgun`] 		 = 0.15,
    [`weapon_marksmanrifle`] 		 = 0.15,
    [`weapon_hominglauncher`] 		 = 0.15,
    [`weapon_flaregun`] 			 = 0.15,
    [`weapon_garbagebag`] 			 = 0.15,
    [`weapon_handcuffs`] 			 = 0.15,
    [`weapon_combatpdw`] 			 = 0.15,
    [`weapon_marksmanpistol`] 		 = 0.15,
    [`weapon_knuckle`] 				 = 0.15,
    [`weapon_hatchet`] 				 = 0.15,
    [`weapon_railgun`] 				 = 0.15,
    [`weapon_machete`] 				 = 0.15,
    [`weapon_machinepistol`] 		 = 0.15,
    [`weapon_switchblade`] 			 = 0.15,
    [`weapon_revolver`] 			 = 0.15,
    [`weapon_dbshotgun`] 			 = 0.15,
    [`weapon_compactrifle`] 		 = 0.15,
    [`weapon_autoshotgun`] 			 = 0.15,
    [`weapon_battleaxe`] 			 = 0.15,
    [`weapon_compactlauncher`] 		 = 0.15,
    [`weapon_minismg`] 				 = 0.15,
    [`weapon_poolcue`] 				 = 0.15,
    [`weapon_wrench`] 				 = 0.15,
    [`weapon_bread`] 				 = 0.15,
}

--? Weapon Attachments
WeaponAttachments = {	-- TODO: This should be renamed, but it can't be without editing the inventory as well. The fight over weapon custody in many places..
--* Pistols 
	['WEAPON_PISTOL'] = {
		['defaultclip'] 	= { component = 'COMPONENT_PISTOL_CLIP_01', 			label = 'Default Clip', 		item = 'pistol_defaultclip', 		type = 'clip', },
		['extendedclip'] 	= { component = 'COMPONENT_PISTOL_CLIP_02', 			label = 'Extended Clip', 		item = 'pistol_extendedclip', 		type = 'clip', },
		['flashlight'] 		= { component = 'COMPONENT_AT_PI_FLSH', 				label = 'Flashlight', 			item = 'pistol_flashlight', 		},
		['suppressor'] 		= { component = 'COMPONENT_AT_PI_SUPP_02', 				label = 'Suppressor', 			item = 'pistol_suppressor', 		},
		['luxuryfinish'] 	= { component = 'COMPONENT_PISTOL_VARMOD_LUXE', 		label = 'Luxury Finish', 		item = 'pistol_luxuryfinish', 		},
	},

	['WEAPON_COMBATPISTOL'] = {
		['defaultclip'] 	= { component = 'COMPONENT_COMBATPISTOL_CLIP_01', 		label = 'Default Clip', 		item = 'combatpistol_defaultclip', 	type = 'clip', },
		['extendedclip'] 	= { component = 'COMPONENT_COMBATPISTOL_CLIP_02', 		label = 'Extended Clip', 		item = 'combatpistol_extendedclip', type = 'clip', },
		['flashlight'] 		= { component = 'COMPONENT_AT_PI_FLSH', 				label = 'Flashlight', 			item = 'pistol_flashlight', 		},
		['suppressor'] 		= { component = 'COMPONENT_AT_PI_SUPP', 				label = 'Suppressor', 			item = 'pistol_suppressor', 		},
		['luxuryfinish'] 	= { component = 'COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER', label = 'Luxury Finish', 		item = 'combatpistol_luxuryfinish', },
	},

	['WEAPON_APPISTOL'] = {
		['defaultclip'] 	= { component = 'COMPONENT_APPISTOL_CLIP_01', 			label = 'Default Clip', 		item = 'appistol_defaultclip', 		type = 'clip', },
		['extendedclip'] 	= { component = 'COMPONENT_APPISTOL_CLIP_02', 			label = 'Extended Clip', 		item = 'appistol_extendedclip', 	type = 'clip', },
		['flashlight'] 		= { component = 'COMPONENT_AT_PI_FLSH', 				label = 'Flashlight', 			item = 'pistol_flashlight', 		},
		['suppressor'] 		= { component = 'COMPONENT_AT_PI_SUPP', 				label = 'Suppressor', 			item = 'pistol_suppressor', 		},
		['luxuryfinish'] 	= { component = 'COMPONENT_APPISTOL_VARMOD_LUXE', 		label = 'Luxury Finish', 		item = 'appistol_luxuryfinish', 	},
	},

	['WEAPON_PISTOL50'] = {
		['defaultclip'] 	= { component = 'COMPONENT_PISTOL50_CLIP_01', 			label = 'Default Clip', 		item = 'pistol50_defaultclip', 		type = 'clip', },
		['extendedclip'] 	= { component = 'COMPONENT_PISTOL50_CLIP_02', 			label = 'Extended Clip', 		item = 'pistol50_extendedclip', 	type = 'clip', },
		['flashlight'] 		= { component = 'COMPONENT_AT_PI_FLSH', 				label = 'Flashlight', 			item = 'pistol_flashlight', 		},
		['suppressor'] 		= { component = 'COMPONENT_AT_PI_SUPP', 				label = 'Suppressor', 			item = 'pistol_suppressor', 		},
		['luxuryfinish'] 	= { component = 'COMPONENT_PISTOL50_VARMOD_LUXE', 		label = 'Luxury Finish', 		item = 'pistol50_luxuryfinish', 	},
	},

	['WEAPON_REVOLVER'] = {
		['defaultclip'] 	= { component = 'COMPONENT_REVOLVER_CLIP_01', 			label = 'Default Clip', 		item = 'revovler_defaultclip', 		},
		['vipvariant'] 		= { component = 'COMPONENT_REVOLVER_VARMOD_GOON', 		label = 'VIP Variant', 			item = 'revolver_vipvariant', 		type = 'skin', },
		['bodyguardvariant']= { component = 'COMPONENT_REVOLVER_VARMOD_BOSS', 		label = 'Bodyguard Variant', 	item = 'revolver_bodyguardvariant', type = 'skin', },
	},

	['WEAPON_SNSPISTOL'] = {
		['defaultclip'] 	= { component = 'COMPONENT_SNSPISTOL_CLIP_01', 			label = 'Default Clip', 		item = 'snspistol_defaultclip', 	type = 'clip', },
		['extendedclip'] 	= { component = 'COMPONENT_SNSPISTOL_CLIP_02', 			label = 'Extended Clip', 		item = 'snspistol_extendedclip', 	type = 'clip', },
		['grip'] 			= { component = 'COMPONENT_SNSPISTOL_VARMOD_LOWRIDER', 	label = 'Wood Grip', 			item = 'snspistol_grip', 			},
	},

	['WEAPON_HEAVYPISTOL'] = { 
		['defaultclip'] 	= { component = 'COMPONENT_HEAVYPISTOL_CLIP_01', 		label = 'Default Clip', 		item = 'heavypistol_defaultclip', 	type = 'clip', },
		['extendedclip'] 	= { component = 'COMPONENT_HEAVYPISTOL_CLIP_02', 		label = 'Extended Clip', 		item = 'heavypistol_extendedclip', 	type = 'clip', },
		['flashlight'] 		= { component = 'COMPONENT_AT_PI_FLSH', 				label = 'Flashlight', 			item = 'pistol_flashlight', 		},
		['suppressor'] 		= { component = 'COMPONENT_AT_PI_SUPP', 				label = 'Suppressor', 			item = 'pistol_suppressor', 		},
		['grip'] 			= { component = 'COMPONENT_HEAVYPISTOL_VARMOD_LUXE', 	label = 'Wood Grip', 			item = 'heavypistol_grip', 			},
	},

	['WEAPON_VINTAGEPISTOL'] = { 
		['defaultclip'] 	= { component = 'COMPONENT_VINTAGEPISTOL_CLIP_01', 		label = 'Default Clip', 		item = 'vintagepistol_defaultclip', 	type = 'clip', },
		['extendedclip'] 	= { component = 'COMPONENT_VINTAGEPISTOL_CLIP_02', 		label = 'Extended Clip', 		item = 'vintagepistol_extendedclip', 	type = 'clip', },
		['suppressor'] 		= { component = 'COMPONENT_AT_PI_SUPP', 				label = 'Suppressor', 			item = 'pistol_suppressor', 			type = 'silencer', }, },

--* SMG's
	['WEAPON_MICROSMG'] = { 
		['defaultclip'] 	= { component = 'COMPONENT_MICROSMG_CLIP_01', 			label = 'Default Clip', 		item = 'microsmg_defaultclip', 		type = 'clip', },
		['extendedclip'] 	= { component = 'COMPONENT_MICROSMG_CLIP_02', 			label = 'Extended Clip', 		item = 'microsmg_extendedclip', 	type = 'clip', },
		['flashlight'] 		= { component = 'COMPONENT_AT_PI_FLSH', 				label = 'Flashlight', 			item = 'pistol_flashlight', 		},
		['scope'] 			= { component = 'COMPONENT_AT_SCOPE_MACRO', 			label = 'Scope', 				item = 'microsmg_scope', 			},
		['suppressor'] 		= { component = 'COMPONENT_AT_AR_SUPP_02', 				label = 'Suppressor', 			item = 'smg_suppressor', 			},
		['luxuryfinish'] 	= { component = 'COMPONENT_MICROSMG_VARMOD_LUXE', 		label = 'Luxury Finish', 		item = 'microsmg_luxuryfinish', 	},
	},

	['WEAPON_SMG'] = {
		['defaultclip'] 	= { component = 'COMPONENT_SMG_CLIP_01', 				label = 'Default Clip', 		item = 'smg_defaultclip', 			type = 'clip', },
		['extendedclip'] 	= { component = 'COMPONENT_SMG_CLIP_02', 				label = 'Extended Clip', 		item = 'smg_extendedclip', 			type = 'clip', },
		['drum'] 			= { component = 'COMPONENT_SMG_CLIP_03', 				label = 'Drum Magazine', 		item = 'smg_drum', 					type = 'clip', },
		['flashlight'] 		= { component = 'COMPONENT_AT_AR_FLSH', 				label = 'Flashlight', 			item = 'rifle_flashlight', 			},
		['scope'] 			= { component = 'COMPONENT_AT_SCOPE_MACRO_02', 			label = 'Scope', 				item = 'smg_scope', 				},
		['suppressor'] 		= { component = 'COMPONENT_AT_PI_SUPP', 				label = 'Suppressor', 			item = 'pistol_suppressor', 		},
		['luxuryfinish'] 	= { component = 'COMPONENT_SMG_VARMOD_LUXE', 			label = 'Luxury Finish', 		item = 'smg_luxuryfinish', 			},
	},

	['WEAPON_ASSAULTSMG'] = { 
		['defaultclip'] 	= { component = 'COMPONENT_ASSAULTSMG_CLIP_01', 		label = 'Default Clip', 		item = 'assaultsmg_defaultclip', 	type = 'clip', },
		['extendedclip'] 	= { component = 'COMPONENT_ASSAULTSMG_CLIP_02', 		label = 'Extended Clip', 		item = 'assaultsmg_extendedclip', 	type = 'clip', },
		['flashlight'] 		= { component = 'COMPONENT_AT_AR_FLSH', 				label = 'Flashlight', 			item = 'rifle_flashlight', 			},
		['scope'] 			= { component = 'COMPONENT_AT_SCOPE_MACRO', 			label = 'Scope', 				item = 'microsmg_scope', 			},
		['suppressor'] 		= { component = 'COMPONENT_AT_AR_SUPP_02', 				label = 'Suppressor', 			item = 'smg_suppressor', 			},
		['luxuryfinish'] 	= { component = 'COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER', label = 'Luxury Finish', 		item = 'assaultsmg_luxuryfinish', 	},
	},

	['WEAPON_MINISMG'] = {
		['defaultclip'] 	= { component = 'COMPONENT_MINISMG_CLIP_01', 			label = 'Default Clip', 		item = 'minismg_defaultclip', 		type = 'clip', },
		['extendedclip'] 	= { component = 'COMPONENT_MINISMG_CLIP_02', 			label = 'Extended Clip', 		item = 'minismg_extendedclip', 		type = 'clip', },
	},

	['WEAPON_MACHINEPISTOL'] = {
		['defaultclip'] 	= { component = 'COMPONENT_MACHINEPISTOL_CLIP_01', 		label = 'Default Clip', 		item = 'machinepistol_defaultclip', 	type = 'clip', },
		['extendedclip'] 	= { component = 'COMPONENT_MACHINEPISTOL_CLIP_02', 		label = 'Extended Clip', 		item = 'machinepistol_extendedclip', 	type = 'clip', },
		['drum'] 			= { component = 'COMPONENT_MACHINEPISTOL_CLIP_03', 		label = 'Drum Magazine', 		item = 'machinepistol_drum', 			type = 'clip', },
		['suppressor'] 		= { component = 'COMPONENT_AT_PI_SUPP', 				label = 'Suppressor', 			item = 'pistol_suppressor', 			},
	},

	['WEAPON_COMBATPDW'] = { 
		['defaultclip'] 	= { component = 'COMPONENT_COMBATPDW_CLIP_01', 			label = 'Default Clip', 		item = 'combatpdw_defaultclip', 	type = 'clip', },
		['extendedclip'] 	= { component = 'COMPONENT_COMBATPDW_CLIP_02', 			label = 'Extended Clip', 		item = 'combatpdw_extendedclip', 	type = 'clip', },
		['drum'] 			= { component = 'COMPONENT_COMBATPDW_CLIP_03', 			label = 'Drum Magazine', 		item = 'combatpdw_drum', 			type = 'clip', },
		['flashlight'] 		= { component = 'COMPONENT_AT_AR_FLSH', 				label = 'Flashlight', 			item = 'rifle_flashlight', 			},
		['grip'] 			= { component = 'COMPONENT_AT_AR_AFGRIP', 				label = 'Grip', 				item = 'combatpdw_grip', 			},
		['scope'] 			= { component = 'COMPONENT_AT_SCOPE_SMALL', 			label = 'Scope', 				item = 'combatpdw_scope', 			},
	},

--* SHOTGUNS 
	['WEAPON_PUMPSHOTGUN'] = {
		['flashlight'] 		= { component = 'COMPONENT_AT_AR_FLSH', 				label = 'Flashlight', 			item = 'rifle_flashlight', 			},
		['suppressor'] 		= { component = 'COMPONENT_AT_SR_SUPP', 				label = 'Suppressor', 			item = 'shotgun_suppressor', 		},
		['luxuryfinish'] 	= { component = 'COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER',label = 'Luxury Finish', 		item = 'pumpshotgun_luxuryfinish', 	},
	},

	['WEAPON_SAWNOFFSHOTGUN'] = {
		['luxuryfinish'] 	= { component = 'COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE', label = 'Luxury Finish', 		item = 'sawnoffshotgun_luxuryfinish', },
	},

	['WEAPON_ASSAULTSHOTGUN'] = {
		['defaultclip'] 	= { component = 'COMPONENT_ASSAULTSHOTGUN_CLIP_01', 	label = 'Default Clip', 		item = 'assaultshotgun_defaultclip', 	type = 'clip', },
		['extendedclip'] 	= { component = 'COMPONENT_ASSAULTSHOTGUN_CLIP_02', 	label = 'Extended Clip', 		item = 'assaultshotgun_extendedclip', 	type = 'clip', },
		['flashlight'] 		= { component = 'COMPONENT_AT_AR_FLSH', 				label = 'Flashlight', 			item = 'rifle_flashlight', 				},
		['suppressor'] 		= { component = 'COMPONENT_AT_AR_SUPP', 				label = 'Suppressor', 			item = 'rifle_suppressor', 				},
		['grip'] 			= { component = 'COMPONENT_AT_AR_AFGRIP', 				label = 'Grip', 				item = 'rifle_grip', 					},
	},

	['WEAPON_BULLPUPSHOTGUN'] = { 
		['flashlight'] 		= { component = 'COMPONENT_AT_AR_FLSH', 				label = 'Flashlight', 			item = 'rifle_flashlight', 				},
		['suppressor'] 		= { component = 'COMPONENT_AT_AR_SUPP_02', 				label = 'Suppressor', 			item = 'smg_suppressor', 				},
		['grip'] 			= { component = 'COMPONENT_AT_AR_AFGRIP', 				label = 'Grip', 				item = 'rifle_grip', 					},
	},

	['WEAPON_HEAVYSHOTGUN'] = {
		['defaultclip'] 	= { component = 'COMPONENT_HEAVYSHOTGUN_CLIP_01', 		label = 'Default Clip', 		item = 'heavyshotgun_defaultclip', 	type = 'clip', },
		['extendedclip'] 	= { component = 'COMPONENT_HEAVYSHOTGUN_CLIP_02', 		label = 'Extended Clip', 		item = 'heavyshotgun_extendedclip', type = 'clip', },
		['drum'] 			= { component = 'COMPONENT_HEAVYSHOTGUN_CLIP_03', 		label = 'Drum Magazine', 		item = 'heavyshotgun_drum', 		type = 'clip', },
		['flashlight'] 		= { component = 'COMPONENT_AT_AR_FLSH', 				label = 'Flashlight', 			item = 'rifle_flashlight', 			},
		['suppressor'] 		= { component = 'COMPONENT_AT_AR_SUPP_02', 				label = 'Suppressor', 			item = 'smg_suppressor', 			},
		['grip'] 			= { component = 'COMPONENT_AT_AR_AFGRIP', 				label = 'Grip', 				item = 'rifle_grip', 				},
	},

	['WEAPON_COMBATSHOTGUN'] = {
		['flashlight'] 		= { component = 'COMPONENT_AT_AR_FLSH', 				label = 'Flashlight', 			item = 'rifle_flashlight', 			},
		['suppressor'] 		= { component = 'COMPONENT_AT_AR_SUPP', 				label = 'Suppressor', 			item = 'rifle_suppressor', 			},
	},

--* Rifles
	['WEAPON_ASSAULTRIFLE'] = {
		['defaultclip'] 	= { component = 'COMPONENT_ASSAULTRIFLE_CLIP_01', 		label = 'Default Clip', 		item = 'assaultrifle_defaultclip', 	type = 'clip', },
		['extendedclip'] 	= { component = 'COMPONENT_ASSAULTRIFLE_CLIP_02', 		label = 'Extended Clip', 		item = 'assaultrifle_extendedclip', type = 'clip', },
		['drum'] 			= { component = 'COMPONENT_ASSAULTRIFLE_CLIP_03', 		label = 'Drum Magazine', 		item = 'assaultrifle_drum', 		type = 'clip', },
		['flashlight'] 		= { component = 'COMPONENT_AT_AR_FLSH', 				label = 'Flashlight', 			item = 'rifle_flashlight', 			},
		['scope'] 			= { component = 'COMPONENT_AT_SCOPE_MACRO', 			label = 'Scope', 				item = 'microsmg_scope', 			},
		['suppressor'] 		= { component = 'COMPONENT_AT_AR_SUPP_02', 				label = 'Suppressor', 			item = 'smg_suppressor', 			},
		['grip'] 			= { component = 'COMPONENT_AT_AR_AFGRIP', 				label = 'Grip', 				item = 'rifle_grip', 				},
		['luxuryfinish'] 	= { component = 'COMPONENT_ASSAULTRIFLE_VARMOD_LUXE', 	label = 'Luxury Finish', 		item = 'assaultrifle_luxuryfinish', },
    },

    ['WEAPON_CARBINERIFLE'] = {
        ['defaultclip'] 	= { component = 'COMPONENT_CARBINERIFLE_CLIP_01', 		label = 'Default Clip', 		item = 'carbinerifle_defaultclip', 	type = 'clip', },
        ['extendedclip'] 	= { component = 'COMPONENT_CARBINERIFLE_CLIP_02', 		label = 'Extended Clip', 		item = 'carbinerifle_extendedclip', type = 'clip', },
        ['drum'] 			= { component = 'COMPONENT_CARBINERIFLE_CLIP_03', 		label = 'Drum Magazine', 		item = 'carbinerifle_drum', 		type = 'clip', },
        ['flashlight'] 		= { component = 'COMPONENT_AT_AR_FLSH', 				label = 'Flashlight', 			item = 'rifle_flashlight', 			},
        ['scope'] 			= { component = 'COMPONENT_AT_SCOPE_MEDIUM', 			label = 'Scope', 				item = 'carbinerifle_scope', 		},
        ['suppressor'] 		= { component = 'COMPONENT_AT_AR_SUPP', 				label = 'Suppressor', 			item = 'rifle_suppressor', 			},
        ['grip'] 			= { component = 'COMPONENT_AT_AR_AFGRIP', 				label = 'Grip', 				item = 'rifle_grip', 				},
        ['luxuryfinish'] 	= { component = 'COMPONENT_CARBINERIFLE_VARMOD_LUXE', 	label = 'Luxury Finish', 		item = 'carbinerifle_luxuryfinish', },
    },

    ['WEAPON_ADVANCEDRIFLE'] = {
        ['defaultclip'] 	= { component = 'COMPONENT_ADVANCEDRIFLE_CLIP_01', 		label = 'Default Clip', 		item = 'advancedrifle_defaultclip', 	type = 'clip', },
        ['extendedclip'] 	= { component = 'COMPONENT_ADVANCEDRIFLE_CLIP_02', 		label = 'Extended Clip', 		item = 'advancedrifle_extendedclip', 	type = 'clip', },
        ['flashlight'] 		= { component = 'COMPONENT_AT_AR_FLSH', 				label = 'Flashlight', 			item = 'rifle_flashlight', 				},
        ['scope'] 			= { component = 'COMPONENT_AT_SCOPE_SMALL', 			label = 'Scope', 				item = 'combatpdw_scope', 				},
        ['suppressor'] 		= { component = 'COMPONENT_AT_AR_SUPP', 				label = 'Suppressor', 			item = 'rifle_suppressor', 				},
        ['grip'] 			= { component = 'COMPONENT_AT_AR_AFGRIP', 				label = 'Grip', 				item = 'rifle_grip', 					},
        ['luxuryfinish'] 	= { component = 'COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE', 	label = 'Luxury Finish', 		item = 'advancedrifle_luxuryfinish', 	},
    },

    ['WEAPON_SPECIALCARBINE'] = {
        ['defaultclip'] 	= { component = 'COMPONENT_SPECIALCARBINE_CLIP_01', 	label = 'Default Clip', 		item = 'specialcarbine_defaultclip', 	type = 'clip', },
        ['extendedclip'] 	= { component = 'COMPONENT_SPECIALCARBINE_CLIP_02', 	label = 'Extended Clip', 		item = 'specialcarbine_extendedclip', 	type = 'clip', },
        ['drum'] 			= { component = 'COMPONENT_SPECIALCARBINE_CLIP_03', 	label = 'Drum Magazine', 		item = 'specialcarbine_drum', 			type = 'clip', },
        ['flashlight'] 		= { component = 'COMPONENT_AT_AR_FLSH', 				label = 'Flashlight', 			item = 'rifle_flashlight', 				},
        ['scope'] 			= { component = 'COMPONENT_AT_SCOPE_MEDIUM', 			label = 'Scope', 				item = 'carbinerifle_scope', 			},
        ['suppressor'] 		= { component = 'COMPONENT_AT_AR_SUPP_02', 				label = 'Suppressor', 			item = 'smg_suppressor', 				},
        ['grip'] 			= { component = 'COMPONENT_AT_AR_AFGRIP', 				label = 'Grip', 				item = 'rifle_grip', 					},
        ['luxuryfinish'] 	= { component = 'COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER', label = 'Luxury Finish', 	item = 'specialcarbine_luxuryfinish', 	},
    },

    ['WEAPON_BULLPUPRIFLE'] = {
        ['defaultclip'] 	= { component = 'COMPONENT_BULLPUPRIFLE_CLIP_01', 		label = 'Default Clip', 		item = 'bullpuprifle_defaultclip', 	type = 'clip', },
        ['extendedclip'] 	= { component = 'COMPONENT_BULLPUPRIFLE_CLIP_02', 		label = 'Extended Clip', 		item = 'bullpuprifle_extendedclip', type = 'clip', },
        ['flashlight'] 		= { component = 'COMPONENT_AT_AR_FLSH', 				label = 'Flashlight', 			item = 'rifle_flashlight', 			},
        ['scope'] 			= { component = 'COMPONENT_AT_SCOPE_SMALL', 			label = 'Scope', 				item = 'combatpdw_scope', 			},
        ['suppressor'] 		= { component = 'COMPONENT_AT_AR_SUPP', 				label = 'Suppressor', 			item = 'rifle_suppressor', 			},
        ['grip'] 			= { component = 'COMPONENT_AT_AR_AFGRIP', 				label = 'Grip', 				item = 'rifle_grip', 				},
        ['luxuryfinish'] 	= { component = 'COMPONENT_BULLPUPRIFLE_VARMOD_LOW', 	label = 'Luxury Finish', 		item = 'bullpuprifle_luxuryfinish', },
    },

    ['WEAPON_COMPACTRIFLE'] = {
        ['defaultclip'] 	= { component = 'COMPONENT_COMPACTRIFLE_CLIP_01', 		label = 'Default Clip', 		item = 'compactrifle_defaultclip', 	type = 'clip', },
        ['extendedclip'] 	= { component = 'COMPONENT_COMPACTRIFLE_CLIP_02', 		label = 'Extended Clip', 		item = 'compactrifle_extendedclip', type = 'clip', },
        ['drum'] 			= { component = 'COMPONENT_COMPACTRIFLE_CLIP_03', 		label = 'Drum Magazine', 		item = 'compactrifle_drum', 		type = 'clip', },
    },

--* Machine Guns
    ['WEAPON_GUSENBERG'] = {
        ['defaultclip'] 	= { component = 'COMPONENT_GUSENBERG_CLIP_01', 			label = 'Default Clip', 		item = 'gusenberg_defaultclip', 	type = 'clip', },
        ['extendedclip'] 	= { component = 'COMPONENT_GUSENBERG_CLIP_02', 			label = 'Extended Clip', 		item = 'gusenberg_extendedclip', 	type = 'clip', },
    },

--* Sniper Rifles
    ['WEAPON_SNIPERRIFLE'] = {
        ['defaultclip'] 	= { component = 'COMPONENT_SNIPERRIFLE_CLIP_01', 		label = 'Default Clip', 		item = 'sniperrifle_defaultclip', 	},
        ['suppressor'] 		= { component = 'COMPONENT_AT_AR_SUPP_02', 				label = 'Suppressor', 			item = 'smg_suppressor', 			},
        ['scope'] 			= { component = 'COMPONENT_AT_SCOPE_LARGE', 			label = 'Scope', 				item = 'sniper_scope', 				type = 'scope', },
        ['advancedscope'] 	= { component = 'COMPONENT_AT_SCOPE_MAX', 				label = 'Scope', 				item = 'snipermax_scope', 			type = 'scope', },
        ['grip'] 			= { component = 'COMPONENT_SNIPERRIFLE_VARMOD_LUXE', 	label = 'Grip', 				item = 'sniper_grip', 				},
    },

    ['WEAPON_HEAVYSNIPER'] = {
        ['defaultclip'] 	= { component = 'COMPONENT_HEAVYSNIPER_CLIP_01', 		label = 'Default Clip', 		item = 'heavysniper_defaultclip',	},
        ['scope'] 			= { component = 'COMPONENT_AT_SCOPE_LARGE', 			label = 'Scope', 				item = 'sniper_scope', 				type = 'scope', },
        ['advancedscope'] 	= { component = 'COMPONENT_AT_SCOPE_MAX', 				label = 'Scope', 				item = 'snipermax_scope', 			type = 'scope', },
    },

    ['WEAPON_MARKSMANRIFLE'] = {
        ['defaultclip'] 	= { component = 'COMPONENT_MARKSMANRIFLE_CLIP_01', 		label = 'Default Clip', 		item = 'marksmanrifle_defaultclip', 	type = 'clip', },
        ['extendedclip'] 	= { component = 'COMPONENT_MARKSMANRIFLE_CLIP_02', 		label = 'Extended Clip', 		item = 'marksmanrifle_extendedclip', 	type = 'clip', },
        ['flashlight'] 		= { component = 'COMPONENT_AT_AR_FLSH', 				label = 'Flashlight', 			item = 'rifle_flashlight', 				},
        ['scope'] 			= { component = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM', 	label = 'Scope', 				item = 'marksmanrifle_scope', 			},
        ['suppressor'] 		= { component = 'COMPONENT_AT_AR_SUPP', 				label = 'Suppressor', 			item = 'rifle_suppressor', 				},
        ['grip'] 			= { component = 'COMPONENT_AT_AR_AFGRIP', 				label = 'Grip', 				item = 'rifle_grip', 					},
        ['luxuryfinish'] 	= { component = 'COMPONENT_MARKSMANRIFLE_VARMOD_LUXE', 	label = 'Luxury Finish', 		item = 'marksmanrifle_luxuryfinish', 	},
    },
}
