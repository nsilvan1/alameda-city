--shared_script "@ThnAC/natives.lua"
fx_version 'adamant'
games {'gta5'}

client_scripts {
	"@vrp/lib/utils.lua",
	"@vrp/lib/itemlist.lua",
    'config.lua',
    'client.lua'
}

server_scripts {
	"@vrp/lib/utils.lua",
	"@vrp/lib/itemlist.lua",
    'config.lua',
    'server.lua'
}