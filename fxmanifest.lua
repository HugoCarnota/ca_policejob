fx_version 'adamant'

game 'gta5'

description 'ESX Police Job'

version '1.4.0'

ui_page 'ui/index.html'

files {
  'ui/index.html',
  'ui/style.css',
  'ui/img/*.png',
  'ui/script.js',
  "ui/Adventure.otf",
    "ui/bankgothic.ttf",
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server/luxvehcontrol.lua',
	'locales/br.lua',
	'locales/de.lua',
	'locales/en.lua',
	'locales/pl.lua',
	'locales/fr.lua',
	'locales/fi.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'locales/ko.lua',
	'locales/cs.lua',
	'config.lua',
	'config_eup.lua',
	'server/main.lua',
	'server/communityservice.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'client/luxvehcontrol.lua',
	'client/speed.lua',
	'locales/br.lua',
	'locales/de.lua',
	'locales/en.lua',
	'locales/pl.lua',
	'locales/fr.lua',
	'locales/fi.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'locales/ko.lua',
	'locales/cs.lua',
	'config.lua',
	'config_eup.lua',
	'client/main.lua',
	'client/vehicle.lua',
	'client/communityservice.lua',
	"essentials.lua",
	"compass.lua",
	"streetname.lua",
	"client/holster.lua"
}









