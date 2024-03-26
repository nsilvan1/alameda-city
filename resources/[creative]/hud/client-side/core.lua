-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
vSERVER = Tunnel.getInterface("hud")
vRPS = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Stress = 0
local Hunger = 100
local Thirst = 100
local Oxigen = 100
local Movie = false
local Pause = false
local Compass = true
local Display = false
local Lataria = 1000.0
local Foods = GetGameTimer()
local Wanted = GetGameTimer()
local Repose = GetGameTimer()
local timer = GetGameTimer()
local timerZone = GlobalState["Hours"] .. ':' .. GlobalState["Minutes"]
-----------------------------------------------------------------------------------------------------------------------------------------
-- NITRO
-----------------------------------------------------------------------------------------------------------------------------------------
local nitroFuel = 0
local nitroActive = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIGHTTRAILS
-----------------------------------------------------------------------------------------------------------------------------------------
local LightTrails = {}
local LightParticles = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PURGESPRAYS
-----------------------------------------------------------------------------------------------------------------------------------------
local PurgeSprays = {}
local PurgeParticles = {}
local sprayActive = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEATBELT
-----------------------------------------------------------------------------------------------------------------------------------------
local beltSpeed = 0
local beltLock = false
local beltVelocity = vec3(0,0,0)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DIVINABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local divingMask = nil
local divingTank = nil
local divingTimers = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEAPONABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Weapon = ""
local lastMax = -1
local lastMin = -1
local WeaponActive = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- MUMBLABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Mumble = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- MUMBLECONNECTED
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("mumbleConnected",function()
	if not Mumble then
		SendNUIMessage({ mumble = false })
		Mumble = true
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MUMBLEDISCONNECTED
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("mumbleDisconnected",function()
	if Mumble then
		SendNUIMessage({ mumble = true })
		Mumble = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:WANTEDCLIENT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:wantedClient")
AddEventHandler("hud:wantedClient",function(Seconds)
	Wanted = GetGameTimer() + (Seconds * 1000)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:REPOSECLIENT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:reposeClient")
AddEventHandler("hud:reposeClient",function(Seconds)
	Repose = GetGameTimer() + (Seconds * 1000)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADCIRCLE
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	DisplayRadar(false)

	RequestStreamedTextureDict("circlemap",false)
	while not HasStreamedTextureDictLoaded("circlemap") do
		Wait(100)
	end

	AddReplaceTexture("platform:/textures/graphics","radarmasksm","circlemap","radarmasksm")

	SetMinimapClipType(1)
	SetMinimapComponentPosition("minimap","L","B",0.009,-0.0125,0.16,0.28)
	SetMinimapComponentPosition("minimap_mask","L","B",0.155,0.12,0.080,0.15)
	SetMinimapComponentPosition("minimap_blur","L","B",0.0095,0.015,0.229,0.311)

	SetBigmapActive(true,false)

	Wait(5000)

	SetBigmapActive(false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADGLOBAL
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		if LocalPlayer["state"]["Active"] then
			if divingMask ~= nil then
				if GetGameTimer() >= divingTimers then
					SendNUIMessage({ oxigen = Oxigen - 1, oxigenShow = divingMask })
					divingTimers = GetGameTimer() + 30000
					Oxigen = Oxigen - 1
					vRPS.Oxigen()

					if Oxigen <= 0 then
						local ped = PlayerPedId()
						local health = GetEntityHealth(ped)
					
						SetEntityHealth(ped,health - 50)
					end
				end
			end
		end

		Wait(5000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADFOODS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local vardowngrade = 1
	while true do
		if LocalPlayer["state"]["Active"] then
			local ped = PlayerPedId()
			if GetGameTimer() >= Foods and GetEntityHealth(ped) > 100 then
				SendNUIMessage({ thirst = Thirst - vardowngrade })
				SendNUIMessage({ hunger = Hunger - vardowngrade })
				Foods = GetGameTimer() + 90000
				Thirst = Thirst - vardowngrade
				Hunger = Hunger - vardowngrade
			    vSERVER.downgrade( vardowngrade )
				vRPS.Foods()
			end
		end

		Wait(30000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		SetWeatherTypeNow(GlobalState["Weather"])
		SetWeatherTypePersist(GlobalState["Weather"])
		SetWeatherTypeNowPersist(GlobalState["Weather"])
		NetworkOverrideClockTime(GlobalState["Hours"],GlobalState["Minutes"],00)

		Wait(1)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROGRESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Progress")
AddEventHandler("Progress",function(progressTimer)
	SendNUIMessage({ progress = true, progressTimer = progressTimer })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHUD
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local timeDistance = 999
		if LocalPlayer["state"]["Active"] then
			if IsPauseMenuActive() then
				SendNUIMessage({ hud = false })
				Pause = true
			else
				if Display then
					if Pause then
						SendNUIMessage({ hud = true })
						Pause = false
						displayHud()
					else
						displayHud()

						local ped = PlayerPedId()
						if IsPedInAnyVehicle(ped) then
							timeDistance = 500
						end
					end
				end
			end
		end

		Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISPLAYHUD
-----------------------------------------------------------------------------------------------------------------------------------------
function displayHud()
	local pid = PlayerId()
	local ped = PlayerPedId()
	local Armour = GetPedArmour(ped)
	local Health = GetEntityHealth(ped)
	local Coords = GetEntityCoords(ped)
	local streetHash01,streetHash02 = GetStreetNameAtCoord(Coords["x"],Coords["y"],Coords["z"])
	local Street01 = GetStreetNameFromHashKey(streetHash01)
	local Street02 = GetStreetNameFromHashKey(streetHash02)
	local Gadget = HasPedGotWeapon(ped,-72657034,false)
	local hours = GetClockHours()
	local minutes = GetClockMinutes()

	if Street02 == "" then
		Street02 = ""
	else
		Street02 = "   <b>I</b>   "..Street02
	end

	if hours <= 9 then
		hours = "0"..hours
	end

	if minutes <= 9 then
		minutes = "0"..minutes
	end


	if IsPedInAnyVehicle(ped) then
		if not IsMinimapRendering() then
			DisplayRadar(true)
		end

		local Vehicle = GetVehiclePedIsUsing(ped)
		local Fuel = GetVehicleFuelLevel(Vehicle)
		local Rotation = GetEntityHeading(Vehicle)
		local Gear = GetVehicleCurrentGear(Vehicle)
		local Lataria = GetVehicleBodyHealth(Vehicle)
		local Locked = GetVehicleDoorLockStatus(Vehicle)
		local Speed = GetEntitySpeed(Vehicle) * 3.6

		if (Speed == 0 and Gear == 0) or (Speed == 0 and Gear == 1) then
			Gear = "N"
		elseif (Speed > 0 and Gear == 0) then
			Gear = "R"
		end

		local nitroShow = 0
		if nitroActive then
			nitroShow = nitroFuel
		else
			local Plate = GetVehicleNumberPlateText(Vehicle)
			nitroShow = GlobalState["Nitro"][Plate] or 0
		end

		SendNUIMessage({ vehicle = true, timerZone = hours .. ':' .. minutes, timer = GetGameTimer(), wanted = Wanted, repose = Repose, tea = LocalPlayer["state"]["Tea"], talking = MumbleIsPlayerTalking(pid), nitro = nitroShow, health = Health, armour = Armour, street01 = Street01, street02 = Street02, fuel = Fuel, speed = Speed, belt = beltLock, locked = Locked, rotation = Rotation, lataria = parseInt(Lataria / 10)..'%', gear = Gear, parachute = Gadget })
	else
		if IsMinimapRendering() then
			DisplayRadar(false)
		end

		SendNUIMessage({ vehicle = false,  timerZone = hours .. ':' .. minutes, timer = GetGameTimer(), wanted = Wanted, repose = Repose, tea = LocalPlayer["state"]["Tea"], talking = MumbleIsPlayerTalking(pid), health = Health, armour = Armour, street01 = Street01, street02 = Street02, parachute = Gadget })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("hud",function(source,args,rawCommand)
	if exports["chat"]:statusChat() and MumbleIsConnected() then
		Display = not Display

		displayHud()
		SendNUIMessage({ hud = Display, vehicle = IsPedInAnyVehicle(PlayerPedId()) })

		if IsMinimapRendering() and not Display then
			DisplayRadar(false)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPASS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("compass",function(source,args,rawCommand)
	if exports["chat"]:statusChat() and MumbleIsConnected() then
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			Compass = not Compass
			SendNUIMessage({ compass = Compass, vehicle = 1 })

			if Compass then
				TriggerEvent("Notify","verde","Compasso ativado.",3000)
			else
				TriggerEvent("Notify","verde","Compasso desativado.",3000)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOVIE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("movie",function(source,args,rawCommand)
	if exports["chat"]:statusChat() and MumbleIsConnected() then
		Movie = not Movie

		displayHud()
		SendNUIMessage({ movie = Movie })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:TOGGLEHOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:toggleHood")
AddEventHandler("hud:toggleHood",function()
	showHood = not showHood

	if showHood then
		SetPedComponentVariation(PlayerPedId(),1,69,0,1)
	else
		SetPedComponentVariation(PlayerPedId(),1,0,0,1)
	end

	SendNUIMessage({ hood = showHood })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:REMOVEHOOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:RemoveHood")
AddEventHandler("hud:RemoveHood",function()
	if showHood then
		showHood = false
		SendNUIMessage({ hood = showHood })
		SetPedComponentVariation(PlayerPedId(),1,0,0,1)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:HUNGER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Hunger")
AddEventHandler("hud:Hunger",function(number)
	SendNUIMessage({ hunger = number })
	Hunger = number
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:THIRST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Thirst")
AddEventHandler("hud:Thirst",function(number)
	SendNUIMessage({ thirst = number })
	Thirst = number
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:STRESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Stress")
AddEventHandler("hud:Stress",function(number)
	SendNUIMessage({ stress = number })
	Stress = number
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:OXIGEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Oxigen")
AddEventHandler("hud:Oxigen",function(number)
	SendNUIMessage({ oxigen = number, oxigenShow = divingMask })
	Oxigen = number
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RECHARGEOXIGEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:rechargeOxigen")
AddEventHandler("hud:rechargeOxigen",function()
	TriggerEvent("Notify","verde","Reabastecimento concluído.",3000)
	SendNUIMessage({ oxigen = 100, oxigenShow = divingMask })
	vRPS.rechargeOxigen()
	Oxigen = 100
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:WEAPON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Weapon")
AddEventHandler("hud:Weapon",function(Status,Hash)
	if Status then
		Weapon = Hash
		WeaponActive = true
		WeaponName = itemName(Weapon)

		while WeaponActive do
			local ped = PlayerPedId()
			local _,Min = GetAmmoInClip(ped,Weapon)
			local Max = GetAmmoInPedWeapon(ped,Weapon)

			if lastMax ~= Max or lastMin ~= Min then
				if (Max - Min) <= 0 then
					Max = 0
				else
					Max = Max - Min
				end

				SendNUIMessage({ weapons = true, minAmmo = Min, maxAmmo = Max, name = WeaponName })
				lastMax = Max
				lastMin = Min
			end

			Wait(100)
		end
	else
		SendNUIMessage({ weapons = false })
		WeaponActive = false
		lastMax = -1
		lastMin = -1
		Weapon = ""
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:ACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Active")
AddEventHandler("hud:Active",function(status)
	Display = status

	displayHud()

	SendNUIMessage({ hud = Display })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:RADIO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Radio")
AddEventHandler("hud:Radio",function(number)
	if number <= 0 then
		SendNUIMessage({ radio = "" })
	else
		SendNUIMessage({ radio = "<text>"..parseInt(number).." Mhz</text>" })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:VOIP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Voip")
AddEventHandler("hud:Voip",function(number)
	local Number = tonumber(number)
	local Target = { "Baixo","Médio","Alto","Muito Alto","Megafone" }

	SendNUIMessage({ voice = Target[Number] })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FOWARDPED
-----------------------------------------------------------------------------------------------------------------------------------------
function fowardPed(ped)
	local heading = GetEntityHeading(ped) + 90.0
	if heading < 0.0 then
		heading = 360.0 + heading
	end

	heading = heading * 0.0174533

	return { x = math.cos(heading) * 2.0, y = math.sin(heading) * 2.0 }
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBELT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local timeDistance = 999
		if LocalPlayer["state"]["Active"] then
			local ped = PlayerPedId()
			if IsPedInAnyVehicle(ped) then
				if not IsPedOnAnyBike(ped) and not IsPedInAnyHeli(ped) and not IsPedInAnyPlane(ped) then
					timeDistance = 1

					local Vehicle = GetVehiclePedIsUsing(ped)
					if GetVehicleDoorLockStatus(Vehicle) == 2 or beltLock then
						DisableControlAction(1,75,true)
					end

					local speed = GetEntitySpeed(Vehicle) * 3.6
					if speed ~= beltSpeed then
						if (beltSpeed - speed) >= 60 and not beltLock then
							local fowardVeh = fowardPed(ped)
							local coords = GetEntityCoords(ped)
							local health = GetEntityHealth(ped)
							SetEntityCoords(ped,coords["x"] + fowardVeh["x"],coords["y"] + fowardVeh["y"],coords["z"] - 0.47,false,false,false,false)
							SetEntityVelocity(ped,beltVelocity["x"],beltVelocity["y"],beltVelocity["z"])
							SetEntityHealth(ped,health - 50)

							Wait(1)

							SetPedToRagdoll(ped,5000,5000,0,0,0,0)
						end

						beltVelocity = GetEntityVelocity(Vehicle)
						beltSpeed = speed
					end
				end
			else
				if beltSpeed ~= 0 then
					beltSpeed = 0
				end

				if beltLock then
					SendNUIMessage({ seatbelt = false })
					beltLock = false
				end
			end
		end

		Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEATBELT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("seatbelt",function(source,args,rawCommand)
	if MumbleIsConnected() then
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			if not IsPedOnAnyBike(ped) then
				if beltLock then
					TriggerEvent("sounds:source","unbelt",0.5)
					SendNUIMessage({ seatbelt = false })
					beltLock = false
				else
					TriggerEvent("sounds:source","belt",0.5)
					SendNUIMessage({ seatbelt = true })
					beltLock = true
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KEYMAPPING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("seatbelt","Colocar/Retirar o cinto.","keyboard","G")
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHEALTHREDUCE
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local foodTimers = GetGameTimer()

	while true do
		if LocalPlayer["state"]["Active"] then
			if GetGameTimer() >= foodTimers then
				foodTimers = GetGameTimer() + 10000

				local ped = PlayerPedId()
				local health = GetEntityHealth(ped)
				if health > 100 then
					if Hunger >= 10 and Hunger <= 20 then
						SetEntityHealth(ped,health - 1)
						TriggerEvent("Notify","hunger","Sofrendo com a fome.",3000)
					elseif Hunger <= 9 then
						SetEntityHealth(ped,health - 2)
						TriggerEvent("Notify","hunger","Sofrendo com a fome.",3000)
					end

					if Thirst >= 10 and Thirst <= 20 then
						SetEntityHealth(ped,health - 1)
						TriggerEvent("Notify","thirst","Sofrendo com a sede.",3000)
					elseif Thirst <= 9 then
						SetEntityHealth(ped,health - 2)
						TriggerEvent("Notify","thirst","Sofrendo com a sede.",3000)
					end
				end
			end
		end

		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSHAKESTRESS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local timeDistance = 999
		if LocalPlayer["state"]["Active"] then
			local ped = PlayerPedId()
			if GetEntityHealth(ped) > 100 then
				if Stress >= 99 then
					timeDistance = 2500
					ShakeGameplayCam("LARGE_EXPLOSION_SHAKE",0.35)
				elseif Stress >= 80 and Stress <= 98 then
					timeDistance = 5000
					ShakeGameplayCam("LARGE_EXPLOSION_SHAKE",0.25)
				elseif Stress >= 60 and Stress <= 79 then
					timeDistance = 7500
					ShakeGameplayCam("LARGE_EXPLOSION_SHAKE",0.15)
				elseif Stress >= 40 and Stress <= 59 then
					timeDistance = 10000
					ShakeGameplayCam("LARGE_EXPLOSION_SHAKE",0.05)
				end
			end
		end

		Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:REMOVESCUBA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:RemoveScuba")
AddEventHandler("hud:RemoveScuba",function()
	local ped = PlayerPedId()
	if DoesEntityExist(divingMask) or DoesEntityExist(divingTank) then
		if DoesEntityExist(divingMask) then
			SendNUIMessage({ oxigen = Oxigen, oxigenShow = nil })
			TriggerServerEvent("tryDeleteObject",ObjToNet(divingMask))
			divingMask = nil
		end

		if DoesEntityExist(divingTank) then
			TriggerServerEvent("tryDeleteObject",ObjToNet(divingTank))
			divingTank = nil
		end

		SetEnableScuba(ped,false)
		SetPedMaxTimeUnderwater(ped,10.0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:DIVING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:Diving")
AddEventHandler("hud:Diving",function()
	local ped = PlayerPedId()

	if DoesEntityExist(divingMask) or DoesEntityExist(divingTank) then
		if DoesEntityExist(divingMask) then
			SendNUIMessage({ oxigen = Oxigen, oxigenShow = nil })
			TriggerServerEvent("tryDeleteObject",ObjToNet(divingMask))
			divingMask = nil
		end

		if DoesEntityExist(divingTank) then
			TriggerServerEvent("tryDeleteObject",ObjToNet(divingTank))
			divingTank = nil
		end

		SetEnableScuba(ped,false)
		SetPedMaxTimeUnderwater(ped,10.0)
	else
		local coords = GetEntityCoords(ped)
		local myObject,objNet = vRPS.CreateObject("p_s_scuba_tank_s",coords["x"],coords["y"],coords["z"])
		if myObject then
			local spawnObjects = 0
			divingTank = NetworkGetEntityFromNetworkId(objNet)
			while not DoesEntityExist(divingTank) and spawnObjects <= 1000 do
				divingTank = NetworkGetEntityFromNetworkId(objNet)
				spawnObjects = spawnObjects + 1
				Wait(1)
			end

			spawnObjects = 0
			local objectControl = NetworkRequestControlOfEntity(divingTank)
			while not objectControl and spawnObjects <= 1000 do
				objectControl = NetworkRequestControlOfEntity(divingTank)
				spawnObjects = spawnObjects + 1
				Wait(1)
			end

			AttachEntityToEntity(divingTank,ped,GetPedBoneIndex(ped,24818),-0.28,-0.24,0.0,180.0,90.0,0.0,1,1,0,0,2,1)
	
			SetEntityAsNoLongerNeeded(divingTank)
		end

		local myObject,objNet = vRPS.CreateObject("p_s_scuba_mask_s",coords["x"],coords["y"],coords["z"])
		if myObject then
			local spawnObjects = 0
			divingMask = NetworkGetEntityFromNetworkId(objNet)
			while not DoesEntityExist(divingMask) and spawnObjects <= 1000 do
				divingMask = NetworkGetEntityFromNetworkId(objNet)
				spawnObjects = spawnObjects + 1
				Wait(1)
			end

			spawnObjects = 0
			local objectControl = NetworkRequestControlOfEntity(divingMask)
			while not objectControl and spawnObjects <= 1000 do
				objectControl = NetworkRequestControlOfEntity(divingMask)
				spawnObjects = spawnObjects + 1
				Wait(1)
			end

			AttachEntityToEntity(divingMask,ped,GetPedBoneIndex(ped,12844),0.0,0.0,0.0,180.0,90.0,0.0,1,1,0,0,2,1)
	
			SetEntityAsNoLongerNeeded(divingMask)
		end

		SetEnableScuba(ped,true)
		SetPedMaxTimeUnderwater(ped,2000.0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NITROENABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function nitroEnable()
	if nitroActive then return end

	local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped) then
		local vehicle = GetVehiclePedIsUsing(ped)
		if GetPedInVehicleSeat(vehicle,-1) == ped then
			local vehPlate = GetVehicleNumberPlateText(vehicle)
			nitroFuel = GlobalState["Nitro"][vehPlate] or 0

			if nitroFuel >= 1 then
				TriggerEvent("sounds:source","nitro",1.0)
				nitroActive = true

				while nitroActive do
					if nitroFuel >= 1 then
						nitroFuel = nitroFuel - 1

						if not GetScreenEffectIsActive("RaceTurbo") then
							StartScreenEffect("RaceTurbo",0,true)
						end

						SetVehicleCheatPowerIncrease(vehicle,5.0)
						ModifyVehicleTopSpeed(vehicle,20.0)
						fireExaust(vehicle)
					else
						SetVehicleCheatPowerIncrease(vehicle,0.0)
						vSERVER.updateNitro(vehPlate,nitroFuel)
						ModifyVehicleTopSpeed(vehicle,0.0)

						if GetScreenEffectIsActive("RaceTurbo") then
							StopScreenEffect("RaceTurbo")
						end

						nitroActive = false
					end

					Citizen.Wait(100)
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NITRODISABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function nitroDisable()
	if nitroActive then
		nitroActive = false

		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsUsing(ped)
			local vehPlate = GetVehicleNumberPlateText(vehicle)

			SetVehicleCheatPowerIncrease(vehicle,0.0)
			vSERVER.updateNitro(vehPlate,nitroFuel)
			ModifyVehicleTopSpeed(vehicle,0.0)

			if GetScreenEffectIsActive("RaceTurbo") then
				StopScreenEffect("RaceTurbo")
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVENITRO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("+activeNitro",nitroEnable)
RegisterCommand("-activeNitro",nitroDisable)
RegisterKeyMapping("+activeNitro","Ativação do nitro.","keyboard","LMENU")
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETLIGHTTRAIL
-----------------------------------------------------------------------------------------------------------------------------------------
function SetLightTrail(Vehicle,Enable)
	if LightTrails[Vehicle] == Enable then
		return
	end

	if Enable then
		local Particles = {}
		local LeftTrail = CreateLightTrail(Vehicle,GetEntityBoneIndexByName(Vehicle,"taillight_l"))
		local RightTrail = CreateLightTrail(Vehicle,GetEntityBoneIndexByName(Vehicle,"taillight_r"))

		table.insert(Particles,LeftTrail)
		table.insert(Particles,RightTrail)

		LightTrails[Vehicle] = true
		LightParticles[Vehicle] = Particles
	else
		if LightParticles[Vehicle] and #LightParticles[Vehicle] > 0 then
			for _,v in ipairs(LightParticles[Vehicle]) do
				StopLightTrail(v)
			end
		end

		LightTrails[Vehicle] = nil
		LightParticles[Vehicle] = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATELIGHTTRAIL
-----------------------------------------------------------------------------------------------------------------------------------------
function CreateLightTrail(Vehicle,Bone)
	UseParticleFxAssetNextCall("core")
	local Particle = StartParticleFxLoopedOnEntityBone("veh_light_red_trail",Vehicle,0.0,0.0,0.0,0.0,0.0,0.0,Bone,1.0,false,false,false)
	SetParticleFxLoopedEvolution(Particle,"speed",1.0,false)

	return Particle
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOPLIGHTTRAIL
-----------------------------------------------------------------------------------------------------------------------------------------
function StopLightTrail(Particle)
	CreateThread(function()
		local endTime = GetGameTimer() + 500
		while GetGameTimer() < endTime do 
			Wait(0)
			local now = GetGameTimer()
			local Scale = (endTime - now) / 500
			SetParticleFxLoopedScale(Particle,Scale)
			SetParticleFxLoopedAlpha(Particle,Scale)
		end

		StopParticleFxLooped(Particle)
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETPURGESPRAYS
-----------------------------------------------------------------------------------------------------------------------------------------
function SetPurgeSprays(Vehicle,Enable)
	if PurgeSprays[Vehicle] == Enable then
		return
	end

	if Enable then
		local Particles = {}
		local Bone = GetEntityBoneIndexByName(Vehicle,"bonnet")
		local Position = GetWorldPositionOfEntityBone(Vehicle,Bone)
		local Offset = GetOffsetFromEntityGivenWorldCoords(Vehicle,Position["x"],Position["y"],Position["z"])

		for i = 0,3 do
			local LeftPurge = CreatePurgeSprays(Vehicle,Offset["x"] - 0.5,Offset["y"] + 0.05,Offset["z"],40.0,-20.0,0.0,0.5)
			local RightPurge = CreatePurgeSprays(Vehicle,Offset["x"] + 0.5,Offset["y"] + 0.05,Offset["z"],40.0,20.0,0.0,0.5)

			table.insert(Particles,LeftPurge)
			table.insert(Particles,RightPurge)
		end

		PurgeSprays[Vehicle] = true
		PurgeParticles[Vehicle] = Particles
	else
		if PurgeParticles[Vehicle] then
			RemoveParticleFxFromEntity(Vehicle)
		end

		PurgeSprays[Vehicle] = nil
		PurgeParticles[Vehicle] = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATEPURGESPRAYS
-----------------------------------------------------------------------------------------------------------------------------------------
function CreatePurgeSprays(Vehicle,xOffset,yOffset,zOffset,xRot,yRot)
	UseParticleFxAssetNextCall("core")
	return StartNetworkedParticleFxNonLoopedOnEntity("ent_sht_steam",Vehicle,xOffset,yOffset,zOffset,xRot,yRot,0.0,0.5,false,false,false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HUD:ACTIVENITRO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:activeNitro")
AddEventHandler("hud:activeNitro",function(vehNet,Status)
	if NetworkDoesNetworkIdExist(vehNet) then
		local Vehicle = NetToEnt(vehNet)
		if DoesEntityExist(Vehicle) then
			SetVehicleNitroEnabled(Vehicle,Status)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXAUSTS
-----------------------------------------------------------------------------------------------------------------------------------------
local exausts = {
	"exhaust","exhaust_2","exhaust_3","exhaust_4","exhaust_5","exhaust_6","exhaust_7","exhaust_8",
	"exhaust_9","exhaust_10","exhaust_11","exhaust_12","exhaust_13","exhaust_14","exhaust_15","exhaust_16"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIREEXAUST
-----------------------------------------------------------------------------------------------------------------------------------------
function fireExaust(Vehicle)
	RequestNamedPtfxAsset("core")
	while not HasNamedPtfxAssetLoaded("core") do
		Wait(1)
	end

	for _,Exaust in ipairs(exausts) do
		local exaustNumber = GetEntityBoneIndexByName(Vehicle,Exaust)

		if exaustNumber > -1 then
			UseParticleFxAssetNextCall("core")
			StartNetworkedParticleFxNonLoopedOnEntityBone("veh_backfire",Vehicle,0.0,0.0,0.0,0.0,0.0,0.0,exaustNumber,1.75,false,false,false)
		end
	end
end