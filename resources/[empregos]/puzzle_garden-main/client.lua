---------------------------------------------
-- Nosso Discord
-- https://discord.gg/UajwX4a
---------------------------------------------

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
gaR = Tunnel.getInterface("puzzle_garden") 
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local servico = false
local selecionado = 0
local processo = false
local criandoBlip = false
local segundos = 0
local isCreative = false
local startLoc = vector3(-1348.39,142.51,56.43)
local animTime = 10
local isRandom = true

local locs = {
	[1] =  { ['x'] = -1368.32, 	['y'] = 46.57, 		['z'] = 53.91  	},
	[2] =  { ['x'] = -1346.85, 	['y'] = 120.5, 		['z'] = 56.37  	},
	[3] =  { ['x'] = -1370.17, 	['y'] = 66.53, 		['z'] = 53.92  	},
	[4] =  { ['x'] = -1372.97, 	['y'] = 172.81,		['z'] = 58.02 	},
	[5] =  { ['x'] = -1323.31, 	['y'] = 64.3, 		['z'] = 53.54  	},
	[6] =  { ['x'] = -1322.29, 	['y'] = 56.09, 		['z'] = 53.55 	},
	[7] =  { ['x'] = -1218.48, 	['y'] = 107.57,		['z'] = 58.04  	},
	[8] =  { ['x'] = -1108.74, 	['y'] = 157.63,		['z'] = 63.04  	},
	[9] =  { ['x'] = -987.46, 	['y'] = -101.82, 	['z'] = 40.58  	},
	[10] = { ['x'] = -1112.58, 	['y'] = -106.0, 	['z'] = 41.85 	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INICIAR TRABALHO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 1000
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		local distancia = #(coords - vector3(-1348.51,142.73,56.44))

		if distancia > 50  then idle = 3  * 1000 end
		if distancia > 100 then idle = 10 * 1000 end
		if distancia <= 20 then idle = 5

			if distancia <= 3 then
				if not servico then 
					DrawText3DNew(-1348.51,142.73,56.44,"~g~E~w~   INICIAR - ~b~JARDINEIRO~b~" 	)
					if IsControlJustPressed(0,38) then
						servico = true
						if isRandom then selecionado = math.random(#locs) else selecionado = 1 end
						CriandoBlip(locs,selecionado)
						PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
						TriggerEvent("Notify","verde","Você entrou no serviço de JARDINEIRO",5000)
						TriggerEvent("Notify","amarelo","<b>Obrigatório</b> usar veículo <b>MOWER</b> da garagem ao lado para realizar o trabalho",10000) 	
					end
				else 
						DrawText3DNew(-1348.51,142.73,56.44,"~g~E~w~   FINALIZAR - ~b~JARDINEIRO ~b~" 	)
						if IsControlJustPressed(0,38) then
							servico = false
							RemoveBlip(blips)
							PlaySoundFrontend(-1, "ERROR", "HUD_AMMO_SHOP_SOUNDSET", 1)
							TriggerEvent("Notify","vermelho","Você saiu do serviço de JARDINEIRO",5000)
							TriggerEvent("Notify","amarelo","<b>Favor</b> devolver o veículo <b>MOWER</b> a garagem ",10000) 	

						end
				end 
			end
		end
		Citizen.Wait(idle)
  end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- JARDINS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local idle = 500
		if servico and not processo and not criandoBlip then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local vehicle = getNearVehicle(8)
			if Vdist(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z,x,y,z)  > 21 then idle = 3 * 1000 end
			if Vdist(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z,x,y,z) <= 20 then idle = 5

				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,250,100,50,150,1,0,0,1)
				if Vdist(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z,x,y,z) <= 1 then
					drawTxt("PRESSIONE  ~r~E~w~  PARA ~y~PLANTAR AS FLORES",4,0.5,0.90,0.50,255,255,255,200)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped)  then
						if GetEntityModel(vehicle) == GetHashKey("mower") then 
							LocalPlayer["state"]["Cancel"] = true
							LocalPlayer["state"]["Commands"] = true
							RemoveBlip(blips)
							TriggerEvent("countDown",10)
							TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GARDENER_PLANT", 0, true)
							FreezeEntityPosition(ped,true)
							segundos = animTime
							processo = true

							Wait(segundos * 1000)
							object = CreateObject(GetHashKey("prop_plant_fern_01a"),locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-1.3, true, true, true)
							LocalPlayer["state"]["Cancel"] = false
							LocalPlayer["state"]["Commands"] = false
							if isRandom then
								random = math.random(#locs)
								if random == selecionado then random = selecionado + 1 end
								selecionado = random
							else
								selecionado = selecionado + 1
							end

							TriggerEvent("delObject",object)

							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
							gaR.PayJob()
							CriandoBlip(locs,selecionado)
						else 
							TriggerEvent("Notify","amarelo","<b>Obrigatório</b> que o veículo <b>MOWER</b> esteja próximo para PLANTAR.",10000) 	
						end
					end
				end
			end
		end
	Citizen.Wait(idle)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterKeyMapping("StopGardenService","Sair Serviço Jardineiro","keyboard","f7")
-- RegisterCommand("StopGardenService",function(source,args)
-- 	if servico then
-- 		servico = false
-- 		RemoveBlip(blips)
-- 		PlaySoundFrontend(-1, "ERROR", "HUD_AMMO_SHOP_SOUNDSET", 1)
-- 		TriggerEvent("Notify","aviso","Você saiu de serviço.")
-- 	end
-- end)

RegisterNetEvent('countDown')
AddEventHandler('countDown',function(segundos)
	repeat
		Citizen.Wait(1000)
		segundos = segundos - 1
		if segundos == 0 then
			ClearPedTasks(PlayerPedId())
			Wait(4000)
			FreezeEntityPosition(PlayerPedId(),false)
			TriggerEvent('cancelando',false)
			processo = false
		end
	until segundos == 0
end)

RegisterNetEvent("delObject")
AddEventHandler("delObject",function(object)
	Citizen.Wait( 30 * 1000 )
	DeleteObject(object)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entregar Drogas")
	EndTextCommandSetBlipName(blips)
end


function DrawText3DNew(x,y,z,text)
	local onScreen,_x,_y = GetScreenCoordFromWorldCoord(x,y,z)

	if onScreen then
		BeginTextCommandDisplayText("STRING")
		AddTextComponentSubstringKeyboardDisplay(text)
		SetTextColour(255,255,255,150)
		SetTextScale(0.35,0.35)
		SetTextFont(4)
		SetTextCentre(1)
		EndTextCommandDisplayText(_x,_y)

		local width = string.len(text) / 160 * 0.45
		DrawRect(_x,_y + 0.0125,width,0.03,38,42,56,200)
	end
end

function getNearVehicle(radius)
	local veh
	local vehs = getNearVehicles(radius)
	local min = radius + 0.0001
	for _veh,dist in pairs(vehs) do
		if dist < min then
			min = dist
			veh = _veh
		end
	end
	return veh 
end

function getNearVehicles(radius)
	local r = {}
	local coords = GetEntityCoords(PlayerPedId())

	local vehs = {}
	local it,veh = FindFirstVehicle()
	if veh then
		table.insert(vehs,veh)
	end
	local ok
	repeat
		ok,veh = FindNextVehicle(it)
		if ok and veh then
			table.insert(vehs,veh)
		end
	until not ok
	EndFindVehicle(it)

	for _,veh in pairs(vehs) do
		local coordsVeh = GetEntityCoords(veh)
		local distance = #(coords - coordsVeh)
		if distance <= radius then
			r[veh] = distance
		end
	end
	return r
end