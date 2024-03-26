Config = {}

Config.DistanceToVolume = 30.0 -- The distance that will be with the volume at 1.0, so if the volume is 0.5 the distance will be 15.0, if the volume is 0.2 the distance will be 6.
Config.PlayToEveryone = true -- The music in car will be played to everyone? Or just for the people that are in that vehicle? If false the DistanceToVolume will not do anything
Config.ItemInVehicle = false -- Put here, if you want the radio to be an item, inside "", like "radio". With or false you will need to do /carradio
Config.CommandVehicle = "som" -- Only will work if Config.ItemInVehicle == false
Config.Permissao = "Premium" --
Config.Zones = {
	{
		name = "Cyber Bar", -- O nome do rádio, não importa
		coords = vector3(373.97,-933.03,24.7), -- a posição onde a música é tocada
		job = "Admin", --o trabalho que pode mudar a música
		range = 30.0, -- o alcance que a música pode ser ouvida
		volume = 1.00, --volume padrão? mínimo 0,00, máximo 1,00
		deflink = "https://www.youtube.com/watch?v=OsLEaZe9gPc",-- o link padrão, se nill não vai jogar nada -- https://www.youtube.com/watch?v=uDRHjKmCfJQ&t
		isplaying = true, -- a música vai tocar quando o servidor iniciar?
		loop = true,-- quando a musica para ela vai repetir?
		deftime = 0, -- onde começa a música? 0 e começará no início
		changemusicblip = vector3(374.7,-935.14,25.33) -- 	onde o jogador pode mudar a música
	},
}