fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Kakarot'
description 'Manages all weapon logic for ammo, attachments, and more'
version '1.2.1'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua',
}

client_script 'client/main.lua'
server_script 'server/main.lua'

files {
    'weaponsnspistol.meta'
}

data_file 'WEAPONINFO_FILE_PATCH' 'weaponsnspistol.meta'
