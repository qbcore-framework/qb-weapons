fx_version 'cerulean'
game 'gta5'

description 'QB-Weapons'
version '1.1.0'
lua54 'yes'

shared_scripts {
	'@qb-core/import.lua',
	'config.lua'
}

server_scripts {
	'server/sv_main.lua',
	'server/sv_durability.lua',
	'server/sv_modifications.lua'
}

client_scripts {
	'client/cl_main.lua',
	'client/obj_player.lua',
	'client/obj_weapon.lua',
	'client/poi-handling.lua',
}

files {
    'data/weaponsnspistol.meta',
}

data_file 'WEAPONINFO_FILE_PATCH' 'data/weaponsnspistol.meta'
