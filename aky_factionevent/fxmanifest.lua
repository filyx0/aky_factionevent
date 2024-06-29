game 'common'

name 'aky_factionevent'
version '1.0.0'
fx_version 'cerulean'
author 'aky_scripts'
lua54 'yes'

shared_scripts {
    'config.lua',
    '@aky_lib/lib.lua',
    '@es_extended/imports.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    'client/*.lua'
}

server_script {
    'server/*.lua'
}

dependencies {
	'aky_lib',
    'es_extended'
}

files {
    'locales/*.lua'
}