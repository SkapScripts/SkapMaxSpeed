fx_version 'cerulean'
game 'gta5'
use_experimental_fxv2_oal 'yes'
lua54 'yes'

author 'Skap.Dev'
description 'Fake ID Script by Skap for QB'
repository ''

shared_script {'config.lua', '@ox_lib/init.lua', '@oxmysql/lib/MySQL.lua'}

client_scripts {'client.lua'}

server_scripts {'server.lua', 'webhooks.lua'}
