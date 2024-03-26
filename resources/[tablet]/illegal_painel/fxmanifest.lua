
fx_version "bodacious"
game "gta5"

description 'rs_painel'

ui_page "index.html"
client_script {
	"@vrp/lib/utils.lua",
    "client.lua"}

server_scripts {    
	"@vrp/lib/utils.lua",
	"@vrp/lib/itemlist.lua",
    '@vrp/lib/utils.lua',
    'server.lua',
    'config.lua'
}

files {
    'index.html',
    'style.css',
    'index.js',
    'img/*'
}