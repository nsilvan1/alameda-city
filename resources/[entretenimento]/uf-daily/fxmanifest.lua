fx_version 'cerulean'
game 'gta5'

ui_page "ui/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"@vrp/lib/itemlist.lua",
	"src/client.lua",
	"config/config.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"@vrp/lib/itemlist.lua",
	"src/server.lua",
	"config/config.lua"
}

files {
	"ui/**",
}