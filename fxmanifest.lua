fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'boss-buyer'
author 'Boss.dev'
version '0.0.1'

shared_scripts {
    '@ox_lib/init.lua',
    'locales/en.lua',
    'shared/*.lua'
}

server_script 'server/*.lua'

client_script 'client/*.lua'

dependencies {
    'rsg-core',
    'rsg-target',
    'ox_lib',
}

lua54 'yes'