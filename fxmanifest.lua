-- This resource is part of the default Cfx.re asset pack (cfx-server-data)
-- Altering or recreating for local use only is strongly discouraged.

version '0.0.1'
author 'Validant <Validant.de>'
description 'A Resource for the Control Panel.'
repository ''
game 'gta5'
fx_version 'cerulean'

client_script '/client/client.lua'
server_script '/server/server.lua'
shared_script {'config.lua'}

ui_page 'html/notify.html'
files {
    'html/listener.js',
    'html/reset.css',
    'html/bs.css',
    'html/style.css',
    'html/notify.html'
}

server_export 'notify'