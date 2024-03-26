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
Tunnel.bindInterface("vrp_contrabando",cRP)
vSERVER = Tunnel.getInterface("vrp_contrabando")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local posPackage = 0
local maxPackage = 3
local boxVehicles = {}
local trabalhandoEntregador = false;
local inService = false
local inPackage = false
local handPackage = false
local initTrabalho = { 2122.63,4784.79,40.96 } 
local initPackage = { 2145.28,4777.4,40.96 }
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTOCKADE
-----------------------------------------------------------------------------------------------------------------------------------------
local delivery = {
	{-1686.47,-3149.36,13.99},
	{-1832.12,3020.29,32.81 },
	{ 1716.37,3294.99,41.3},
	{ 2122.63,4784.79,40.96 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CALLNAMES
-----------------------------------------------------------------------------------------------------------------------------------------
local callName = { "James","John","Robert","Michael","William","David","Richard","Charles","Joseph","Thomas","Christopher","Daniel","Paul","Mark","Donald","George","Kenneth","Steven","Edward","Brian","Ronald","Anthony","Kevin","Jason","Matthew","Gary","Timothy","Jose","Larry","Jeffrey","Frank","Scott","Eric","Stephen","Andrew","Raymond","Gregory","Joshua","Jerry","Dennis","Walter","Patrick","Peter","Harold","Douglas","Henry","Carl","Arthur","Ryan","Roger","Joe","Juan","Jack","Albert","Jonathan","Justin","Terry","Gerald","Keith","Samuel","Willie","Ralph","Lawrence","Nicholas","Roy","Benjamin","Bruce","Brandon","Adam","Harry","Fred","Wayne","Billy","Steve","Louis","Jeremy","Aaron","Randy","Howard","Eugene","Carlos","Russell","Bobby","Victor","Martin","Ernest","Phillip","Todd","Jesse","Craig","Alan","Shawn","Clarence","Sean","Philip","Chris","Johnny","Earl","Jimmy","Antonio","Mary","Patricia","Linda","Barbara","Elizabeth","Jennifer","Maria","Susan","Margaret","Dorothy","Lisa","Nancy","Karen","Betty","Helen","Sandra","Donna","Carol","Ruth","Sharon","Michelle","Laura","Sarah","Kimberly","Deborah","Jessica","Shirley","Cynthia","Angela","Melissa","Brenda","Amy","Anna","Rebecca","Virginia","Kathleen","Pamela","Martha","Debra","Amanda","Stephanie","Carolyn","Christine","Marie","Janet","Catherine","Frances","Ann","Joyce","Diane","Alice","Julie","Heather","Teresa","Doris","Gloria","Evelyn","Jean","Cheryl","Mildred","Katherine","Joan","Ashley","Judith","Rose","Janice","Kelly","Nicole","Judy","Christina","Kathy","Theresa","Beverly","Denise","Tammy","Irene","Jane","Lori","Rachel","Marilyn","Andrea","Kathryn","Louise","Sara","Anne","Jacqueline","Wanda","Bonnie","Julia","Ruby","Lois","Tina","Phyllis","Norma","Paula","Diana","Annie","Lillian","Emily","Robin" }
local callName2 = { "Smith","Johnson","Williams","Jones","Brown","Davis","Miller","Wilson","Moore","Taylor","Anderson","Thomas","Jackson","White","Harris","Martin","Thompson","Garcia","Martinez","Robinson","Clark","Rodriguez","Lewis","Lee","Walker","Hall","Allen","Young","Hernandez","King","Wright","Lopez","Hill","Scott","Green","Adams","Baker","Gonzalez","Nelson","Carter","Mitchell","Perez","Roberts","Turner","Phillips","Campbell","Parker","Evans","Edwards","Collins","Stewart","Sanchez","Morris","Rogers","Reed","Cook","Morgan","Bell","Murphy","Bailey","Rivera","Cooper","Richardson","Cox","Howard","Ward","Torres","Peterson","Gray","Ramirez","James","Watson","Brooks","Kelly","Sanders","Price","Bennett","Wood","Barnes","Ross","Henderson","Coleman","Jenkins","Perry","Powell","Long","Patterson","Hughes","Flores","Washington","Butler","Simmons","Foster","Gonzales","Bryant","Alexander","Russell","Griffin","Diaz","Hayes" }
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTOCKADE
-----------------------------------------------------------------------------------------------------------------------------------------
function startthreadstockade()
	Citizen.CreateThread(function()
		while trabalhandoEntregador do
			local timeDistance = 500
			local ped = PlayerPedId()

			if inService then
				if not IsPedInAnyVehicle(ped) then
					local vehicle = getNearVehicle(11)
					local coords = GetEntityCoords(ped)

					if DoesEntityExist(vehicle) and GetEntityModel(vehicle) == GetHashKey("velum2") then
					local coordsVeh = GetOffsetFromEntityInWorldCoords(vehicle,-1.0,-1.0,-1.0)
						local distance = #(coords - coordsVeh)
						if distance <= 1.5 then
							timeDistance = 4
							local plate = GetVehicleNumberPlateText(vehicle)

							if inPackage then
								if boxVehicles[plate] == nil then
									DrawText3D(coordsVeh.x,coordsVeh.y,coordsVeh.z,"~g~E~w~   GUARDAR ENCOMENDA\nTOTAL DE ENCOMENDAS:  0/"..maxPackage,550,0.0225,0.06)
								else
									DrawText3D(coordsVeh.x,coordsVeh.y,coordsVeh.z,"~g~E~w~   GUARDAR ENCOMENDA\nTOTAL DE ENCOMENDAS:  "..boxVehicles[plate].."/"..maxPackage,550,0.0225,0.06)
								end

								if IsControlJustPressed(1,38) and vSERVER.addPackage(plate) then
									inPackage = false
									handPackage = false
									vRP.removeObjects("one")
								end
							else
								if boxVehicles[plate] == nil then
									DrawText3D(coordsVeh.x,coordsVeh.y,coordsVeh.z,"~g~E~w~   RETIRAR ENCOMENDA\nTOTAL DE ENCOMENDAS:  0/"..maxPackage,550,0.0225,0.06)
								else
									DrawText3D(coordsVeh.x,coordsVeh.y,coordsVeh.z,"~g~E~w~   RETIRAR ENCOMENDA\nTOTAL DE ENCOMENDAS:  "..boxVehicles[plate].."/"..maxPackage,550,0.0225,0.06)
								end

								if IsControlJustPressed(1,38) and boxVehicles[plate] then
									if boxVehicles[plate] > 0 then
										inPackage = true
										handPackage = true
										TriggerServerEvent("vrp_contrabando:remPackage",plate)
										vRP.createObjects("anim@heists@box_carry@","idle","hei_prop_heist_box",50,28422)
									end
								end
							end
						end
					end

					local distance = #(coords - vector3(initPackage[1],initPackage[2],initPackage[3]))
					if distance <= 1.5 then
						timeDistance = 4

						if inPackage then
							DrawText3D(initPackage[1],initPackage[2],initPackage[3],"~g~E~w~   GUARDAR ENCOMENDA",350,0.0125,0.03)
						else
							DrawText3D(initPackage[1],initPackage[2],initPackage[3],"~g~E~w~   RETIRAR ENCOMENDA",350,0.0125,0.03)
						end

						if IsControlJustPressed(1,38) then
							if inPackage then
								inPackage = false
								vRP.removeObjects("one")
							else
								inPackage = true
								vRP.createObjects("anim@heists@box_carry@","idle","hei_prop_heist_box",50,28422)
							end
						end
					end

					local distance = #(coords - vector3(delivery[posPackage][1],delivery[posPackage][2],delivery[posPackage][3]))
					if distance <= 30 then
						timeDistance = 4
						DrawText3D(delivery[posPackage][1],delivery[posPackage][2],delivery[posPackage][3],"~g~E~w~   ENTREGAR ENCOMENDA",350,0.0125,0.03)
						if distance <= 1 and IsControlJustPressed(1,38) and handPackage then
							inPackage = false
							handPackage = false
							posPackage = posPackage + 1	
							vSERVER.paymentMethod()
							vRP.removeObjects("one")
							TriggerEvent("vrp_contrabando:initDelivery")
						end
					end
				end
			end

			Citizen.Wait(timeDistance)
		end
	end)
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP_GANGS:Iniciar Trabalho
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do 
		local ped = PlayerPedId()
		local timeDistance = 500
		local coords = GetEntityCoords(ped)
		local distance = #(coords - vector3(initTrabalho[1],initTrabalho[2],initTrabalho[3]))
		if distance <= 1 then
			if not trabalhandoEntregador  then 
				timeDistance = 4
				DrawText3DNew(initTrabalho[1],initTrabalho[2],initTrabalho[3],"~g~E~w~   INICIAR - ~b~CONTRABANDO~b~" 	)
				if IsControlJustPressed(1,38)  then	
					posPackage = 1
					trabalhandoEntregador = true
					startthreadstockade()
					startthreadblock()
					inService = true
					TriggerEvent("vrp_contrabando:initDelivery")
					--PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
					TriggerEvent("Notify","verde","Você entrou no serviço de CONTRABANDO",5000)
					TriggerEvent("Notify","amarelo","<b>Obrigatório</b> usar veículo <b>VELUM2</b> da garagem ao lado para realizar o trabalho",10000)
				end
			else 
				DrawText3DNew(initTrabalho[1],initTrabalho[2],initTrabalho[3],"~g~E~w~   FINALIZAR - ~b~CONTRABANDO~b~" 	)
				timeDistance = 4
				if IsControlJustPressed(1,38)  then	
					inService = false
					trabalhandoEntregador = false
					PlaySoundFrontend(-1, "ERROR", "HUD_AMMO_SHOP_SOUNDSET", 1)
					TriggerEvent("Notify","vermelho","Você saiu do serviço de CONTRABANDO",5000)
				end 
			end 

		end
      Citizen.Wait(timeDistance)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP_GANGS:THREADBLOCK
-----------------------------------------------------------------------------------------------------------------------------------------
function startthreadblock()
	Citizen.CreateThread(function()
		while true do
			local timeDistance = 500
			if inPackage then
				timeDistance = 4
				DisableControlAction(1,245,true)
				DisableControlAction(1,167,true)
				DisableControlAction(1,21,true)
				DisableControlAction(1,22,true)
				DisableControlAction(1,23,true)
			end

			Citizen.Wait(timeDistance)
		end
	end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTRABANDO
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterCommand("contrabando",function(source,args)
-- 	if GetEntityHealth(PlayerPedId()) > 101 then
-- 		if inService then
-- 			inService = false
-- 		else
-- 			posPackage = 1
-- 			startthreadstockade()
-- 			startthreadblock()
-- 			inService = true
-- 			TriggerEvent("vrp_contrabando:initDelivery")
-- 			TriggerEvent("Notify","amarelo","Retire seu avião da garagem e carregue três encomendas.",7000)
-- 		end
-- 	end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- vrp_contrabando:UPDATEPACKAGE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_contrabando:updatePackage")
AddEventHandler("vrp_contrabando:updatePackage",function(status)
	boxVehicles = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- vrp_contrabando:UPDATEPACKAGE
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterNetEvent("vrp_contrabando:initDelivery")
-- AddEventHandler("vrp_contrabando:initDelivery",function()
-- 	posPackage = math.random(#delivery)
-- 	TriggerEvent("NotifyPush",{ time = os.date("%H:%M:%S - %d/%m/%Y"), text = "Ei preciso de uma entreguinha aqui obrigado!",  code = 20, title = "Entrega de encomenda", x = delivery[posPackage][1], y = delivery[posPackage][2], z = delivery[posPackage][3], name = callName[math.random(#callName)].." "..callName2[math.random(#callName2)], rgba = {30,90,160} })
-- end)lll
-- posPackage = posPackage + 1	
RegisterNetEvent("vrp_contrabando:initDelivery")
AddEventHandler("vrp_contrabando:initDelivery",function()
	if posPackage == 4 then 
		inService = false
		trabalhandoEntregador = false
		TriggerEvent("NotifyPush",{ code = "QTH", title = "Retornar a base", x = delivery[posPackage][1], y = delivery[posPackage][2], z = delivery[posPackage][3], name = callName[math.random(#callName)].." "..callName2[math.random(#callName2)], rgba = {75,100,160} })
      	PlaySoundFrontend(-1, "ERROR", "HUD_AMMO_SHOP_SOUNDSET", 1)
		TriggerEvent("Notify","amarelo","Você terminou o serviço de CONTRABANDO",5000)
	else 
	   TriggerEvent("NotifyPush",{ code = "QTH", title = "Entrega de encomenda", x = delivery[posPackage][1], y = delivery[posPackage][2], z = delivery[posPackage][3], name = callName[math.random(#callName)].." "..callName2[math.random(#callName2)], rgba = {75,100,160} })
       PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
	end 
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DWTEXT
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text,h,g,f)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,100)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / h
	DrawRect(_x,_y+g,0.01+factor,f,0,0,0,100)
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
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETNEARVEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------
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
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETNEARVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
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