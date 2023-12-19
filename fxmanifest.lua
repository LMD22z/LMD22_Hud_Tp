fx_version 'cerulean'
game       'gta5'
lua54      'yes'

author 'LMD22 Dev'
description 'Simple Hud Teleport'
version '1.0.0'

--
-- Client
--

client_scripts {
    'client/client.lua',
}

--
-- NUI
--

ui_page 'nui/nui.html'

files {
    'nui/nui.html',
    'nui/style.css',
    'nui/script.js',
    'nui/images/*',
}
