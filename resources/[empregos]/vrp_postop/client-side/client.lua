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
Tunnel.bindInterface("vrp_postop",cRP)
vSERVER = Tunnel.getInterface("vrp_postop")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local posPackage = 0
local maxPackage = 25
local boxVehicles = {}
local trabalhandoEntregador = false;
local inService = false
local inPackage = false
local handPackage = false
local initPackage = { 161.2,-2948.84,6.0 }
local initTrabalho = { 158.93,-2946.4,7.23 }

-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTOCKADE
-----------------------------------------------------------------------------------------------------------------------------------------
local delivery = {
	{ 441.05,-981.03,30.69 },
	{ 312.33,-592.95,43.29 },
	{ -560.21,286.91,82.18 },
	{ -1369.07,-170.16,47.49 },
	{ -1080.28,-245.41,37.77 },
	{ -1845.02,-1195.58,19.19 },
	{ -1388.36,-586.94,30.22 },
	{ -1061.01,-521.63,36.09 },
	{ -1037.62,-1397.11,5.56 },
	{ -598.2,-929.91,23.87 },
	{ -32.54,-1112.79,26.49 },
	{ -655.84,-863.59,24.57 },
	{ -287.61,-1061.45,27.2 },
	{ -202.15,-1158.68,23.82 },
	{ 438.52,-622.98,28.71 },
	{ 382.18,-1076.52,29.43 },
	{ 143.66,-1041.32,29.37 },
	{ 166.39,-1451.17,29.25 },
	{ 20.42,-1505.47,31.86 },
	{ 410.53,-1910.7,25.46 },
	{ 849.16,-2097.55,30.26 },
	{ 200.49,335.86,105.62 },
	{ -143.73,229.41,94.94 },
	{ 110.21,-637.12,44.25 },
	{ 416.84,-1109.05,30.05 },
	{ 89.42,-1745.43,30.08 },
	{ -72.67,-1820.75,26.95 },
	{ 1174.36,-418.83,67.21 },
	{ 638.18,1.91,82.79 },
	{ 245.9,371.91,105.74 },
	{ -20.91,239.43,109.56 },
	{ -357.31,-50.8,49.04 },
	{ -345.43,-131.03,39.01 },
	{ -561.91,-131.06,38.44 },
	{ 196.19,-406.36,45.33 },
	{ 1200.5,-1277.37,35.58 },
	{ 229.65,-22.33,74.99 }
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

					if DoesEntityExist(vehicle) and GetEntityModel(vehicle) == GetHashKey("boxville4") then
						local coordsVeh = GetOffsetFromEntityInWorldCoords(vehicle,0.0,-3.5,0.0)
						local distance = #(coords - coordsVeh)
						if distance <= 1.2 then
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
										TriggerServerEvent("vrp_postop:remPackage",plate)
										vRP.createObjects("anim@heists@box_carry@","idle","hei_prop_heist_box",50,28422)
									end
								end
							end
						end
					end

					local distance = #(coords - vector3(initPackage[1],initPackage[2],initPackage[3]))
					if distance <= 1 then
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
						if distance <= 0.6 and IsControlJustPressed(1,38) and handPackage then
							inPackage = false
							handPackage = false
							vSERVER.paymentMethod()
							vRP.removeObjects("one")
							TriggerEvent("vrp_postop:initDelivery")
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
				DrawText3DNew(initTrabalho[1],initTrabalho[2],initTrabalho[3],"~g~E~w~   INICIAR - ~b~ENTREGADOR~b~" 	)
				if IsControlJustPressed(1,38)  then	
					trabalhandoEntregador = true
					startthreadstockade()
					startthreadblock()
					inService = true
					TriggerEvent("vrp_postop:initDelivery")
					--PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
					TriggerEvent("Notify","verde","Você entrou no serviço de ENTREGADOR",5000)
					TriggerEvent("Notify","amarelo","<b>Obrigatório</b> usar veículo <b>BOXVILLE</b> da garagem ao lado para realizar o trabalho",10000)
				end
			else 
				DrawText3DNew(initTrabalho[1],initTrabalho[2],initTrabalho[3],"~g~E~w~   FINALIZAR - ~b~ENTREGADOR~b~" 	)
				timeDistance = 4
				if IsControlJustPressed(1,38)  then	
					inService = false
					trabalhandoEntregador = false
					PlaySoundFrontend(-1, "ERROR", "HUD_AMMO_SHOP_SOUNDSET", 1)
					TriggerEvent("Notify","vermelho","Você saiu do serviço de ENTREGADOR",5000)
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
-- ENTREGADOR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("entregador",function(source,args)
	if GetEntityHealth(PlayerPedId()) > 101 then
		if inService then
			inService = false
		else
			startthreadstockade()
			startthreadblock()
			inService = true
			TriggerEvent("vrp_postop:initDelivery")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP_POSTOP:UPDATEPACKAGE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_postop:updatePackage")
AddEventHandler("vrp_postop:updatePackage",function(status)
	boxVehicles = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP_POSTOP:UPDATEPACKAGE
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterNetEvent("vrp_postop:initDelivery")
-- AddEventHandler("vrp_postop:initDelivery",function()
-- 	posPackage = math.random(#delivery)
-- 	TriggerEvent("NotifyPush",{ time = os.date("%H:%M:%S - %d/%m/%Y"), text = "Ei preciso de uma entreguinha aqui obrigado!",  code = 20, title = "Entrega de encomenda", x = delivery[posPackage][1], y = delivery[posPackage][2], z = delivery[posPackage][3], name = callName[math.random(#callName)].." "..callName2[math.random(#callName2)], rgba = {30,90,160} })
-- end)

RegisterNetEvent("vrp_postop:initDelivery")
AddEventHandler("vrp_postop:initDelivery",function()
	posPackage = math.random(#delivery)
	TriggerEvent("NotifyPush",{ code = "QTH", title = "Entrega de encomenda", x = delivery[posPackage][1], y = delivery[posPackage][2], z = delivery[posPackage][3], name = callName[math.random(#callName)].." "..callName2[math.random(#callName2)], rgba = {75,100,160} })
	PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
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