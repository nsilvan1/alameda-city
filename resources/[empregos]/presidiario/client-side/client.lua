-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("corrections",cRP)
vSERVER = Tunnel.getInterface("corrections")
trabalhou = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local lastPosition = 1
local serviceBlip = nil
local selectPosition = 1
local lastPassenger = nil
local currentStatus = false
local serviceStatus = false
local trabalhou = false 
local currentPassenger = nil
local initService = vector3(1852.0,2582.25,45.66)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOPVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
local stopVehicle = {
	{ 1859.02,3676.95,33.67,121.89 },
	{ -442.49,6037.48,31.34,130.4 },
	{ 1855.02,2586.36,45.66,175.75 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWNPEDS
-----------------------------------------------------------------------------------------------------------------------------------------
local spawnPeds = {
	{ 1858.0,3701.79,34.27,212.6 },
	{ -448.23,6008.14,31.71,314.65 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWNMODELS
-----------------------------------------------------------------------------------------------------------------------------------------
local spawnModels = {
	{ "s_m_y_prismuscl_01",0x5F2113A1 },
	{ "u_m_y_prisoner_01",0x7B9B4BC0 },
	{ "s_m_y_prisoner_01",0xB1BB9B59 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			local distance = #(coords - initService)
			if distance <= 2 then
				timeDistance = 1

				if serviceStatus then
					DrawText3D(initService["x"],initService["y"],initService["z"],"~g~E~w~   FINALIZAR - ~b~TRANSPORTE DE PRESIDIÁRIO~b~")
				else
						DrawText3D(initService["x"],initService["y"],initService["z"],"~g~E~w~   INICIAR - ~b~TRANSPORTE DE PRESIDIÁRIO~b~")
				
				end

				if IsControlJustPressed(1,38) then
					if serviceStatus then
						serviceStatus = false
						PlaySoundFrontend(-1, "ERROR", "HUD_AMMO_SHOP_SOUNDSET", 1)
						TriggerEvent("Notify","vermelho","Você saiu do serviço de TRANSPORTE DE PRESIDIÁRIO",5000)

						if DoesBlipExist(serviceBlip) then
							RemoveBlip(serviceBlip)
							serviceBlip = nil
						end

						if currentPassenger ~= nil then
							TriggerServerEvent("tryDeleteObject",PedToNet(currentPassenger))
							currentPassenger = nil
						end

						if lastPassenger ~= nil then
							TriggerServerEvent("tryDeleteObject",lastPassenger)
							lastPassenger = nil
						end
					else
						if vSERVER.checkPermission() then
							if not trabalhou and vSERVER.validateDatePrision()  then 
								vSERVER.insertDatePrision()
								repeat
									if lastPosition == selectPosition then			
										selectPosition = math.random(#stopVehicle - 1)
									end
								until lastPosition ~= selectPosition

								currentPassenger = nil
								currentStatus = false
								
								serviceStatus = true
								
								PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
								TriggerEvent("Notify","verde","Você entrou no serviço de TRANSPORTE DE PRESIDIÁRIO",5000)
								TriggerEvent("Notify","amarelo","<b>Obrigatório</b> usar veículo <b>PBUS</b> da garagem ao lado para realizar o trabalho",10000)
								--TriggerEvent("Notify","verde","Você entrou no serviço de TRANSPORTE DE PRESIDIÁRIO",5000)
								lastPassenger = nil
								blipPassenger()
								trabalhou = false
							else 
								TriggerEvent("Notify","amarelo","Você já fez este serviço hoje,<br> Agora vai atrás de <b>BANDIDO</b>.",10000)
							end 
						end
					end
				end
			end
		else
			if serviceStatus then
				local coords = GetEntityCoords(ped)
				local vehicle = GetVehiclePedIsUsing(ped)
				local distance = #(coords - vector3(stopVehicle[selectPosition][1],stopVehicle[selectPosition][2],stopVehicle[selectPosition][3]))
				if distance <= 100 then
					timeDistance = 1

					DrawMarker(1,stopVehicle[selectPosition][1],stopVehicle[selectPosition][2],stopVehicle[selectPosition][3] - 3,0,0,0,0,0,0,5.0,5.0,3.0,255,255,255,25,0,0,0,0)
					DrawMarker(21,stopVehicle[selectPosition][1],stopVehicle[selectPosition][2],stopVehicle[selectPosition][3],0,0,0,0,180.0,130.0,1.5,1.5,1.0,42,137,255,100,0,0,0,1)

					if IsControlJustPressed(1,38) and distance <= 2.5 and GetEntityModel(vehicle) == -2007026063 then
										
						if currentStatus then
							FreezeEntityPosition(vehicle,true)

							if DoesEntityExist(currentPassenger) then
								vSERVER.paymentService()
								Citizen.Wait(1000)
								TaskLeaveVehicle(currentPassenger,vehicle,262144)
								TaskWanderStandard(currentPassenger,10.0,10)
								Citizen.Wait(1000)
								SetVehicleDoorShut(vehicle,3,0)
								Citizen.Wait(1000)
							end

							FreezeEntityPosition(vehicle,false)

							lastPassenger = PedToNet(currentPassenger)
							lastPosition = selectPosition
							currentStatus = false

							repeat
								if lastPosition == selectPosition then
									selectPosition = math.random(#stopVehicle)
								end
							until lastPosition ~= selectPosition

							serviceStatus = false
							trabalhou = true
							RemoveBlip(serviceBlip)
							serviceBlip = nil
							PlaySoundFrontend(-1, "ERROR", "HUD_AMMO_SHOP_SOUNDSET", 1)
							TriggerEvent("Notify","vermelho","Você finalizou o serviço de TRANSPORTE DE PRESIDIÁRIO",5000)

							SetTimeout(10000,function()
								if lastPassenger ~= nil then
									TriggerServerEvent("tryDeleteObject",lastPassenger)
									lastPassenger = nil
								end
							end)
						else
							generatePassenger(vehicle)
						end
					end
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
function generatePassenger(vehicle)
	if lastPassenger ~= nil then
		TriggerServerEvent("tryDeleteObject",lastPassenger)
		lastPassenger = nil
	end

	local randModels = math.random(#spawnModels)
	local mHash = GetHashKey(spawnModels[randModels][1])

	RequestModel(mHash)
	while not HasModelLoaded(mHash) do
		Citizen.Wait(1)
	end

	if HasModelLoaded(mHash) then
		currentPassenger = CreatePed(4,spawnModels[randModels][2],spawnPeds[selectPosition][1],spawnPeds[selectPosition][2],spawnPeds[selectPosition][3],3374176,true,false)
		TaskEnterVehicle(currentPassenger,vehicle,-1,2,1.0,1,0)
		SetEntityAsMissionEntity(currentPassenger,true,true)
		SetEntityInvincible(currentPassenger,true)
		SetModelAsNoLongerNeeded(mHash)

		while true do
			Citizen.Wait(1)

			if IsPedSittingInVehicle(currentPassenger,vehicle) then
				break
			end
		end

		lastPosition = selectPosition
		selectPosition = #stopVehicle

		currentStatus = true
		blipPassenger()
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MAKEBLIPMARKED
-----------------------------------------------------------------------------------------------------------------------------------------
function blipPassenger()
	if DoesBlipExist(serviceBlip) then
		RemoveBlip(serviceBlip)
		serviceBlip = nil
	end

	serviceBlip = AddBlipForCoord(stopVehicle[selectPosition][1],stopVehicle[selectPosition][2],stopVehicle[selectPosition][3])
	SetBlipSprite(serviceBlip,12)
	SetBlipColour(serviceBlip,5)
	SetBlipScale(serviceBlip,0.9)
	SetBlipRoute(serviceBlip,true)
	SetBlipAsShortRange(serviceBlip,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Presidiário")
	EndTextCommandSetBlipName(serviceBlip)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text)
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

function timersevice()
    local src = source
    local user_id = vRP.getUserId(src)
    if timer[user_id] ~= nil then
		print('entrou aqui. ')
        xtimer = timer[user_id]
        horas = 0
        minutos = 0
        segundos = 0
        if xtimer/3600 >= 1 then
            horas = (xtimer-(xtimer%3600))/3600
            xtimer = xtimer - (xtimer-(xtimer%3600) )
            if horas < 10 then
                horas = "0" .. tostring(horas)
            end
        end

        if xtimer/60 >= 1 then
            minutos = (xtimer-(xtimer%60))/60
            xtimer = xtimer - (xtimer-(xtimer%60) )
            if minutos < 10 then
                minutos = "0" .. tostring(minutos)
            end
        end

        segundos = xtimer

        if segundos < 10 then
            segundos = "0" .. tostring(segundos)
            
        end
        TriggerClientEvent("Notify",src,"vermelho","Aguarde <b>".. string.sub(horas, 1, 2) .. ":" .. string.sub(minutos, 1, 2) .. ":" .. string.sub(segundos, 1, 2),5000)
        timersevice()
    else 
        trabalhou = false
    end
end