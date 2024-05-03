fx_version 'cerulean'
game 'gta5'

description 'Himalaia City'
version '1.0.0'

client_scripts {

'@PolyZone/client.lua',
'@PolyZone/BoxZone.lua',
'@PolyZone/CircleZone.lua',
'@PolyZone/ComboZone.lua',

}

server_scripts {

'server/*.lua',
'@oxmysql/lib/MySQL.lua',

}

lua54 'yes'