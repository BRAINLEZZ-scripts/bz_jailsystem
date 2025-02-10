fx_version 'cerulean'
game 'gta5'

author 'BRAINLEZZ'
description 'Simple Jail System for Police and Sheriff'
version '1.0'

files {
    'html/ui.html',
    'html/style.css',
    'html/script.js'
}

ui_page 'html/ui.html'


shared_script '@es_extended/imports.lua' -- Uncomment if using ESX



client_script 'client.lua'
server_script 'server.lua'
shared_script 'config.lua'