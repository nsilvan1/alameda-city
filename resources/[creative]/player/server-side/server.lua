-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("player",cRP)
vCLIENT = Tunnel.getInterface("player")
vSKINSHOP = Tunnel.getInterface("skinshop")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("me",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id and args[1] then
		local message = string.sub(rawCommand:sub(4),1,100)

		local activePlayers = vRPC.activePlayers(source)
		for _,v in ipairs(activePlayers) do
			async(function()
				TriggerClientEvent("showme:pressMe",v,source,message,10)
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPGRADESTRESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("upgradeStress")
AddEventHandler("upgradeStress",function(number)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.upgradeStress(user_id,number)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOWNGRADESTRESS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("downgradeStress")
AddEventHandler("downgradeStress",function(number)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.downgradeStress(user_id,number)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:KICKSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:kickSystem")
AddEventHandler("player:kickSystem",function(message)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.hasGroup(user_id,"Admin") then
			vRP.kick(user_id,message)
		end
	end
end)

---------------------------------------------------------------
-- /FPS
--------------------------------------------------------------
RegisterCommand("fps",function(source,args)
    if args[1] == "on" then
        SetTimecycleModifier("cinema")
        TriggerEvent("Notify","sucesso","Sucesso","Boost de fps ligado!")
    elseif args[1] == "off" then
        SetTimecycleModifier("default")
        TriggerEvent("Notify","sucesso","Sucesso","Boost de fps desligado!")
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- E
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("e",function(source,args,rawCommand)
	if exports["chat"]:statusChat(source) then
		local user_id = vRP.getUserId(source)
		if user_id and vRP.getHealth(source) > 101 then
			if args[2] == "friend" then
				local otherPlayer = vRPC.nearestPlayer(source)
				if otherPlayer then
					if vRP.getHealth(otherPlayer) > 101 and not vCLIENT.getHandcuff(otherPlayer) then
						local identity = vRP.userIdentity(user_id)
						if vRP.request(otherPlayer,"Pedido de <b>"..identity["name"].."</b> da animação <b>"..args[1].."</b>?") then
							TriggerClientEvent("emotes",otherPlayer,args[1])
							TriggerClientEvent("emotes",source,args[1])
						end
					end
				end
			else
				TriggerClientEvent("emotes",source,args[1])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Pagar Multas
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterCommand("pagarmultas202222",function(source,args,rawCmd)
--     local source = source
--     local user_id = vRP.getUserId(source)
--     local identity = vRP.userIdentity(user_id)
--     if identity then
--         if identity.fines > 0 then
--             local request = vRP.request(source,"Deseje pagar <b>$"..parseFormat(identity.fines).."</b> dólares de multa?")
--             if request then
--                 if vRP.paymentBank(user_id,parseInt(identity.fines)) then
--                     vRP.delFines(user_id,identity.fines)
--                 else
--                     TriggerClientEvent("Notify",source,"amarelo","Dinheiro insuficiente.")
--                 end
--             end
--         else
--             TriggerClientEvent("Notify",source,"amarelo","Você não tem multas pendentes.")
--         end
--     end
-- end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- E2
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("e2",function(source,args,rawCommand)
	if exports["chat"]:statusChat(source) then
		local user_id = vRP.getUserId(source)
		if user_id and vRP.getHealth(source) > 101 then
			local otherPlayer = vRPC.nearestPlayer(source)
			if otherPlayer then
				if vRP.hasGroup(user_id,"Paramedic") then
					TriggerClientEvent("emotes",otherPlayer,args[1])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("player:Doors")
AddEventHandler("player:Doors",function(number)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle,vehNet = vRPC.vehList(source,5)
		if vehicle then
			local activePlayers = vRPC.activePlayers(source)
			for _,v in ipairs(activePlayers) do
				async(function()
					TriggerClientEvent("player:syncDoors",v,vehNet,number)
				end)
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- RECEIVESALARY
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.receiveSalary()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then 

		-- PREMIUM

		if vRP.userPremium(user_id) then
			TriggerEvent("vRP:updateSalary",user_id,10000)
			TriggerClientEvent("Notify",source,"azul","Salário de Vip <b>$10.000</b> recebido.",5000)
		end

		-- MÉDICO

		if vRP.hasPermission(user_id,"HPDiretor") then
			TriggerEvent("vRP:updateSalary",user_id,15000)
			TriggerClientEvent("Notify",source,"azul","Salário de Diretor do Hospital <b>$15.000</b> recebido.",5000)
		end

		if vRP.hasPermission(user_id,"HPMedico") then
			TriggerEvent("vRP:updateSalary",user_id,12500)
			TriggerClientEvent("Notify",source,"azul","Salário de Médico do Hoapital <b>$12.500</b> recebido.",5000)
		end

		if vRP.hasPermission(user_id,"HPParamedic") then
			TriggerEvent("vRP:updateSalary",user_id,10000)
			TriggerClientEvent("Notify",source,"azul","Salário de Paramédico do Hospital <b>$10.000</b> recebido.",5000)
		end		

 		-- POLICE   

		if vRP.hasPermission(user_id,"PoliceComando") then
			TriggerEvent("vRP:updateSalary",user_id,15000)
			TriggerClientEvent("Notify",source,"azul","Salário de Comando Geral <b>$15.000</b> recebido.",5000)
		end

		if vRP.hasPermission(user_id,"PoliceSargento") then
			TriggerEvent("vRP:updateSalary",user_id,10000)
			TriggerClientEvent("Notify",source,"azul","Salário de Sargento <b>$10.000</b> recebido.",5000)
		end

		if vRP.hasPermission(user_id,"PoliceSoldado") then
			TriggerEvent("vRP:updateSalary",user_id,7500)
			TriggerClientEvent("Notify",source,"azul","Salário de Soldado <b>$7.500</b> recebido.",5000)
		end

		if vRP.hasPermission(user_id,"PoliceRecruta") then
			TriggerEvent("vRP:updateSalary",user_id,5000)
			TriggerClientEvent("Notify",source,"azul","Salário de Recruta <b>$5.000</b> recebido.",5000)
		end

		-- STREAMER

		-- if vRP.hasPermission(user_id,"streamer") then
		-- 	TriggerEvent("vRP:updateSalary",user_id,5000)
		-- 	TriggerClientEvent("Notify",source,"azul","Salário de Streamer <b>$5.000</b> recebido.",5000)
		-- end
		
        -- BURGERSHOT

		if vRP.hasPermission(user_id,"BurgershotLider") then
			TriggerEvent("vRP:updateSalary",user_id,5000)
			TriggerClientEvent("Notify",source,"azul","Salário de Burguershot Líder <b>$5.000</b> recebido.",5000)
		end

		if vRP.hasPermission(user_id,"BurgershotGerente") then--
			TriggerEvent("vRP:updateSalary",user_id,3500)
			TriggerClientEvent("Notify",source,"azul","Salário de Burguershot Gerente <b>$3.500</b> recebido.",5000)
		end

		if vRP.hasPermission(user_id,"BurgershotMembro") then
			TriggerEvent("vRP:updateSalary",user_id,2500)
			TriggerClientEvent("Notify",source,"azul","Salário de Burguershot Membro <b>$2.500</b> recebido.",5000)
		end		

        -- MECHANIC

		if vRP.hasPermission(user_id,"MechanicLider") then
			TriggerEvent("vRP:updateSalary",user_id,5000)
			TriggerClientEvent("Notify",source,"azul","Salário de Mecânico Líder <b>$5.000</b> recebido.",5000)
		end

		if vRP.hasPermission(user_id,"MechanicGerente") then
			TriggerEvent("vRP:updateSalary",user_id,3500)
			TriggerClientEvent("Notify",source,"azul","Salário de Mecânico Gerente <b>$3.500</b> recebido.",5000)
		end

		if vRP.hasPermission(user_id,"MechanicMembro") then
			TriggerEvent("vRP:updateSalary",user_id,2500)
			TriggerClientEvent("Notify",source,"azul","Salário de Mecânico Membro <b>$2.500</b> recebido.",5000)
		end

		-- -- MOTOCLUB

		-- if vRP.hasPermission(user_id,"MotoclubLider") then
		-- 	TriggerEvent("vRP:updateSalary",user_id,5000)
		-- 	TriggerClientEvent("Notify",source,"azul","Salário de Líder do Motoclub <b>$5.000</b> recebido.",5000)
		-- end

		-- if vRP.hasPermission(user_id,"MotoclubGerente") then
		-- 	TriggerEvent("vRP:updateSalary",user_id,3500)
		-- 	TriggerClientEvent("Notify",source,"azul","Salário de Gerente da Motoclub <b>$3.500</b> recebido.",5000)
		-- end

		-- if vRP.hasPermission(user_id,"MotoclubMembro") then
		-- 	TriggerEvent("vRP:updateSalary",user_id,2500)
		-- 	TriggerClientEvent("Notify",source,"azul","Salário de Membro da Motoclub <b>$2.500</b> recebido.",5000)
		-- end

		-- -- BUNKER

		-- if vRP.hasPermission(user_id,"BunkerLider") then
		-- 	TriggerEvent("vRP:updateSalary",user_id,5000)
		-- 	TriggerClientEvent("Notify",source,"azul","Salário de Líder do Bunker <b>$5.000</b> recebido.",5000)
		-- end

		-- if vRP.hasPermission(user_id,"BunkerGerente") then
		-- 	TriggerEvent("vRP:updateSalary",user_id,3500)
		-- 	TriggerClientEvent("Notify",source,"azul","Salário de Gerente da Bunker <b>$3.500</b> recebido.",5000)
		-- end

		-- if vRP.hasPermission(user_id,"BunkerMembro") then
		-- 	TriggerEvent("vRP:updateSalary",user_id,2500)
		-- 	TriggerClientEvent("Notify",source,"azul","Salário de Membro da Bunker <b>$2.500</b> recebido.",5000)
		-- end	
		
		-- -- YAKUZA

		-- if vRP.hasPermission(user_id,"YakuzaLider") then
		-- 	TriggerEvent("vRP:updateSalary",user_id,5000)
		-- 	TriggerClientEvent("Notify",source,"azul","Salário de Líder do Yakuza <b>$5.000</b> recebido.",5000)
		-- end

		-- if vRP.hasPermission(user_id,"YakuzaGerente") then
		-- 	TriggerEvent("vRP:updateSalary",user_id,3500)
		-- 	TriggerClientEvent("Notify",source,"azul","Salário de Gerente da Yakuza <b>$3.500</b> recebido.",5000)
		-- end

		-- if vRP.hasPermission(user_id,"YakuzaMembro") then
		-- 	TriggerEvent("vRP:updateSalary",user_id,2500)
		-- 	TriggerClientEvent("Notify",source,"azul","Salário de Membro da Yakuza <b>$2.500</b> recebido.",5000)
		-- end	

		-- -- MAFIA VINHEDO

		-- if vRP.hasPermission(user_id,"MafiavinhedoLider") then
		-- 	TriggerEvent("vRP:updateSalary",user_id,5000)
		-- 	TriggerClientEvent("Notify",source,"azul","Salário de Líder da Mafia <b>$5.000</b> recebido.",5000)
		-- end

		-- if vRP.hasPermission(user_id,"MafiavinhedoGerente") then
		-- 	TriggerEvent("vRP:updateSalary",user_id,3500)
		-- 	TriggerClientEvent("Notify",source,"azul","Salário de Gerente da Mafia <b>$3.500</b> recebido.",5000)
		-- end

		-- if vRP.hasPermission(user_id,"MafiavinhedoMembro") then
		-- 	TriggerEvent("vRP:updateSalary",user_id,2500)
		-- 	TriggerClientEvent("Notify",source,"azul","Salário de Membro da Mafia <b>$2.500</b> recebido.",5000)
		-- end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- 911
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("911",function(source,args,rawCommand)--
	if exports["chat"]:statusChat(source) then
		local user_id = vRP.getUserId(source)
		if user_id and args[1] and vRP.getHealth(source) > 101 then
			if vRP.hasGroup(user_id,"Police") then
				local department = "Police"

				if vRP.hasPermission(user_id,"PoliceComando") then
					department = "COMANDANTE GERAL"

				elseif vRP.hasPermission(user_id,"PoliceSargento") then
					department = "SARGENTO"

				elseif vRP.hasPermission(user_id,"PoliceSoldado") then
					department = "SOLDADO"

				elseif vRP.hasPermission(user_id,"PoliceRecruta") then
					department = "RECRUTA"
				end

				local identity = vRP.userIdentity(user_id)
				local policeResult = vRP.numPermission("Police")
				for k,v in pairs(policeResult) do
					async(function()
						TriggerClientEvent("chatME",v,"^2911^3"..department.."^9"..identity["name"].."^0"..rawCommand:sub(4))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 112
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("112",function(source,args,rawCommand)
	if exports["chat"]:statusChat(source) then
		local user_id = vRP.getUserId(source)
		if user_id and args[1] and vRP.getHealth(source) > 101 then
			if vRP.hasGroup(user_id,"Paramedic") then
				local identity = vRP.userIdentity(user_id)
				local paramedicResult = vRP.numPermission("Paramedic")
				for k,v in pairs(paramedicResult) do
					async(function()
						TriggerClientEvent("chatME",v,"^4112^9"..identity["name"].." "..identity["name2"].."^0"..rawCommand:sub(4))
					end)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOTSFIRED
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.shotsFired()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local ped = GetPlayerPed(source)
		local coords = GetEntityCoords(ped)
		local policeResult = vRP.numPermission("Police")

		for k,v in pairs(policeResult) do
			async(function()
				TriggerClientEvent("NotifyPush",v,{ code = 10, title = "Confronto em andamento", x = coords["x"], y = coords["y"], z = coords["z"], criminal = "Disparos de arma de fogo", blipColor = 6 })
			end)
		end
	end
end

function cRP.errCar()
	local source = source
	TriggerClientEvent("Notify",source,"amarelo","Você tem que estar dentro do carro.",3000)
	return true;
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:CARRYPLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
local playerCarry = {}
RegisterServerEvent("player:carryPlayer")
AddEventHandler("player:carryPlayer",function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRPC.inVehicle(source) then
			if playerCarry[user_id] then
				TriggerClientEvent("player:playerCarry",playerCarry[user_id],source)
				TriggerClientEvent("player:Commands",playerCarry[user_id],false)
				playerCarry[user_id] = nil
			else
				local otherPlayer = vRPC.nearestPlayer(source)
				if otherPlayer then
					playerCarry[user_id] = otherPlayer

					TriggerClientEvent("player:playerCarry",playerCarry[user_id],source)
					TriggerClientEvent("player:Commands",playerCarry[user_id],true)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERDISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("playerDisconnect",function(user_id)
	if playerCarry[user_id] then
		TriggerClientEvent("player:Commands",playerCarry[user_id],false)
		playerCarry[user_id] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:WINSFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:winsFunctions")
AddEventHandler("player:winsFunctions",function(mode)
	local source = source
	local vehicle,vehNet = vRPC.vehSitting(source)
	if vehicle then
		local activePlayers = vRPC.activePlayers(source)
		for _,v in ipairs(activePlayers) do
			async(function()
				TriggerClientEvent("player:syncWins",v,vehNet,mode)
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:CVFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:cvFunctions")
AddEventHandler("player:cvFunctions",function(mode)
	local source = source
	local distance = 1.1

	if mode == "rv" then
		distance = 10.0
	end

	local otherPlayer = vRPC.nearestPlayer(source,distance)
	if otherPlayer then
		local user_id = vRP.getUserId(source)
		local consultItem = vRP.getInventoryItemAmount(user_id,"rope")
		if vRP.hasGroup(user_id,"Emergency") or consultItem[1] >= 1 then
			local vehicle,vehNet = vRPC.vehList(source,5)
			if vehicle then
				local idNetwork = NetworkGetEntityFromNetworkId(vehNet)
				local doorStatus = GetVehicleDoorLockStatus(idNetwork)
			
				if parseInt(doorStatus) <= 1 then
					if mode == "rv" then
						vCLIENT.removeVehicle(otherPlayer)
					elseif mode == "cv" then
						vCLIENT.putVehicle(otherPlayer,vehNet)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
local preset = {
	["1"] = {
		["mp_m_freemode_01"] = {  
				["hat"] = { item = 28, texture = 0, defaultItem = -1, defaultTexture = 0 },      -- boina
				["pants"] = { item = 87, texture = 12, defaultItem = 0, defaultTexture = 0 },    -- calça
				["vest"] = { item = 25, texture = 0, defaultItem = 0, defaultTexture = 0 },      -- colete
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 169, texture = 13, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },     -- sapato
				["tshirt"] = { item = 16, texture = 1, defaultItem = 1, defaultTexture = 0 },    -- camisa
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 146, texture = 0, defaultItem = 0, defaultTexture = 0 },    -- jaqueta
				["accessory"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 25, texture = 4, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 136, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 11, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 169, texture = 13, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 24, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 32, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 281, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },     --- mãos
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		}
	},
	["2"] = {
		["mp_m_freemode_01"] = {
				["hat"] = { item = 48, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["pants"] = { item = 33, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 25, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 16, texture = 1, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 146, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 18, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = 48, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["pants"] = { item = 32, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 11, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 24, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 32, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 281, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		}
	},
	["3"] = {
		["mp_m_freemode_01"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 33, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 25, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 16, texture = 1, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 146, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 32, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 11, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 24, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 32, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 281, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		}
	},
	["4"] = {
		["mp_m_freemode_01"] = {
			["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 87, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 25, texture = 3, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 35, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 16, texture = 1, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 146, texture = 3, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 136, texture = 4, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 11, texture = 4, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 36, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 32, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 281, texture = 3, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		}
	},
	["5"] = {
		["mp_m_freemode_01"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 33, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 15, texture = 1, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 146, texture = 4, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 32, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 24, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 15, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 281, texture = 4, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		}
	},
	["6"] = {
		["mp_m_freemode_01"] = {
				["hat"] = { item = 150, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 92, texture = 4, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 25, texture = 4, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 169, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 129, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 139, texture = 5, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 112, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 18, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 25, texture = 4, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = 74, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 32, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 11, texture = 3, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 24, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 32, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 281, texture = 9, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		}
	},
	["7"] = {
		["mp_m_freemode_01"] = {
				["hat"] = { item = 93, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 26, texture = 6, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 169, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 15, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 16, texture = 1, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 146, texture = 6, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 125, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 125, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = 142, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 0, texture = 8, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 103, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 73, texture = 18, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 16, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 281, texture = 6, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 11, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		}
	},
	["22"] = {
		["mp_m_freemode_01"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 87, texture = 12, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 25, texture = 6, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 15, texture = 1, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 146, texture = 5, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 136, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 24, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 15, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 281, texture = 5, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["arms"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		}
	},
	["23"] = {
		["mp_m_freemode_01"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 87, texture = 12, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 25, texture = 5, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 15, texture = 1, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 146, texture = 7, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 136, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 24, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 15, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 281, texture = 7, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["arms"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		}
	},
	["8"] = {   ---- HP Estagiário
		["mp_m_freemode_01"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 42, texture = 2, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 15, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 79, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 84, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = -1, texture = 0 },
				["pants"] = { item = 97, texture = 2 },
				["vest"] = { item = 0, texture = 0 },
				["bracelet"] = { item = -1, texture = 0 },
				["backpack"] = { item = 0, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["mask"] = { item = 0, texture = 0 },
				["shoes"] = { item = 70, texture = 2 },
				["tshirt"] = { item = 15, texture = 0 },
				["torso"] = { item = 251, texture = 2 },
				["accessory"] = { item = 0, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["arms"] = { item = 88, texture = 0 },
				["glass"] = { item = 0, texture = 0 },
				["ear"] = { item = -1, texture = 0 }
		}
	},	
	["9"] = {   ---- HP Médico
		["mp_m_freemode_01"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 42, texture = 2, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 15, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 187, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 30, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 14, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 23, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 8, texture = 2, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 216, texture = 12, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 194, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 14, texture = 3, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 9, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		}
	},
	["10"] = {   ---- HP Diretor
		["mp_m_freemode_01"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 24, texture = 5, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 21, texture = 9, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 96, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 32, texture = 7, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 28, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 6, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 23, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 8, texture = 2, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 217, texture = 12, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 58, texture = 7, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 26, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 3, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		}
	},
	["16"] = {   ---- HP Atendimento
		["mp_m_freemode_01"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 26, texture = 6, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 42, texture = 2, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 15, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 146, texture = 8, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 85, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 0, texture = 10, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["backpack"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = 0, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["shoes"] = { item = 60, texture = 2, defaultItem = 1, defaultTexture = 0 },
				["tshirt"] = { item = 15, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso"] = { item = 281, texture = 8, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 97, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 109, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
		}
	},	
	["17"] = {   ---- HP Mergulho
		["mp_m_freemode_01"] = {
			   	["hat"] = { item = -1, texture = 0 },
				["pants"] = { item = 94, texture = 2 },
				["vest"] = { item = 0, texture = 0 },
				["bracelet"] = { item = -1, texture = 0 },
				["backpack"] = { item = 0, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["mask"] = { item = 0, texture = 0 },
				["shoes"] = { item = 67, texture = 2 },
				["tshirt"] = { item = 15, texture = 0 },
				["torso"] = { item = 243, texture = 2 },
				["accessory"] = { item = 0, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["arms"] = { item = 86, texture = 1 },
				["glass"] = { item = 0, texture = 0 },
				["ear"] = { item = -1, texture = 0 }
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = -1, texture = 0 },
				["pants"] = { item = 97, texture = 2 },
				["vest"] = { item = 0, texture = 0 },
				["bracelet"] = { item = -1, texture = 0 },
				["backpack"] = { item = 0, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["mask"] = { item = 0, texture = 0 },
				["shoes"] = { item = 70, texture = 2 },
				["tshirt"] = { item = 15, texture = 0 },
				["torso"] = { item = 251, texture = 2 },
				["accessory"] = { item = 0, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["arms"] = { item = 88, texture = 0 },
				["glass"] = { item = 0, texture = 0 },
				["ear"] = { item = -1, texture = 0 }
		}
	},			
	["11"] = {
		["mp_m_freemode_01"] = {
				["hat"] = { item = -1, texture = 0 }, --chapeu
				["pants"] = { item = 80, texture = 0 },  --calca
				["vest"] = { item = 15, texture = 0 }, --colete
				["bracelet"] = { item = -1, texture = 0 }, --pulseira
				["backpack"] = { item = 0, texture = 0 }, --mochila
				["decals"] = { item = 0, texture = 0 }, --adesivos
				["mask"] = { item = 0, texture = 0 }, --mascara
				["shoes"] = { item = 40, texture = 0 }, --sapatos
				["tshirt"] = { item = 15, texture = 0 }, --camisa
				["torso"] = { item = 307, texture = 0 }, --jaqueta
				["accessory"] = { item = 23, texture = 0 }, --acessorios
				["watch"] = { item = -1, texture = 0 }, --relogio 
				["arms"] = { item = 156, texture = 2 }, --maos
				["glass"] = { item = 0, texture = 0 }, --oculos
				["ear"] = { item = -1, texture = 0 } --brinco
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = 0, texture = 0 },
				["pants"] = { item = 126, texture = 0 },
				["vest"] = { item = 13, texture = 0 },
				["bracelet"] = { item = -1, texture = 0 },
				["backpack"] = { item = 0, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["mask"] = { item = 0, texture = 0 },
				["shoes"] = { item = 24, texture = 0 },
				["tshirt"] = { item = 14, texture = 0 },
				["torso"] = { item = 339, texture = 0 },
				["accessory"] = { item = 45, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["arms"] = { item = 117, texture = 9 },
				["glass"] = { item = 0, texture = 0 },
				["ear"] = { item = -1, texture = 0 }	
		}
	},
	["12"] = {
		["mp_m_freemode_01"] = {
				["hat"] = { item = -1, texture = 0 }, --chapeu
				["pants"] = { item = 180, texture = 0 },  --calca
				["vest"] = { item = 19, texture = 0 }, --colete
				["bracelet"] = { item = -1, texture = 0 }, --pulseira
				["backpack"] = { item = 0, texture = 0 }, --mochila
				["decals"] = { item = 0, texture = 0 }, --adesivos
				["mask"] = { item = 0, texture = 0 }, --mascara
				["shoes"] = { item = 40, texture = 0 }, --sapatos
				["tshirt"] = { item = 15, texture = 0 }, --camisa
				["torso"] = { item = 179, texture = 3 }, --jaqueta
				["accessory"] = { item = 23, texture = 0 }, --acessorios
				["watch"] = { item = -1, texture = 0 }, --relogio 
				["arms"] = { item = 156, texture = 2 }, --maos
				["glass"] = { item = 0, texture = 0 }, --oculos
				["ear"] = { item = -1, texture = 0 } --brinco
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = 0, texture = 0 },
				["pants"] = { item = 126, texture = 21 },
				["vest"] = { item = -1, texture = 0 },
				["bracelet"] = { item = -1, texture = 0 },
				["backpack"] = { item = 0, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["mask"] = { item = 0, texture = 0 },
				["shoes"] = { item = 24, texture = 0 },
				["tshirt"] = { item = 31, texture = 0 },
				["torso"] = { item = 26, texture = 3 },
				["accessory"] = { item = 45, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["arms"] = { item = 111, texture = 0 },
				["glass"] = { item = 0, texture = 0 },
				["ear"] = { item = -1, texture = 0 }	
		}
	},
	["13"] = {
		["mp_m_freemode_01"] = {
				["hat"] = { item = 19, texture = 0 }, --chapeu
				["pants"] = { item = 83, texture = 0 },  --calca
				["vest"] = { item = 0, texture = 0 }, --colete
				["bracelet"] = { item = -1, texture = 0 }, --pulseira
				["backpack"] = { item = 0, texture = 0 }, --mochila
				["decals"] = { item = 0, texture = 0 }, --adesivos
				["mask"] = { item = 0, texture = 0 }, --mascara
				["shoes"] = { item = 69, texture = 0 }, --sapatos
				["tshirt"] = { item = 131, texture = 0 }, --camisa
				["torso"] = { item = 195, texture = 1 }, --jaqueta
				["accessory"] = { item = 64, texture = 0 }, --acessorios
				["watch"] = { item = -1, texture = 0 }, --relogio 
				["arms"] = { item = 135, texture = 2 }, --maos
				["glass"] = { item = 0, texture = 0 }, --oculos
				["ear"] = { item = -1, texture = 0 } --brinco
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = 0, texture = 0 },
				["pants"] = { item = 87, texture = 0 },
				["vest"] = { item = -1, texture = 0 },
				["bracelet"] = { item = -1, texture = 0 },
				["backpack"] = { item = 0, texture = 0 },
				["decals"] = { item = 0, texture = 0 },
				["mask"] = { item = 0, texture = 0 },
				["shoes"] = { item = 24, texture = 0 },
				["tshirt"] = { item = 33, texture = 0 },
				["torso"] = { item = 208, texture = 1 },
				["accessory"] = { item = 45, texture = 0 },
				["watch"] = { item = -1, texture = 0 },
				["arms"] = { item = 111, texture = 0 },
				["glass"] = { item = 0, texture = 0 },
				["ear"] = { item = -1, texture = 0 }
		}
	},
	["14"] = {
		["mp_m_freemode_01"] = {
				["hat"] = { item = -1, texture = 0 }, --chapeu
				["pants"] = { item = 4, texture = 1 },  --calca
				["vest"] = { item = 33, texture = 0 }, --colete
				["bracelet"] = { item = -1, texture = 0 }, --pulseira
				["backpack"] = { item = 0, texture = 0 }, --mochila
				["decals"] = { item = 0, texture = 0 }, --adesivos
				["mask"] = { item = 0, texture = 0 }, --mascara
				["shoes"] = { item = 20, texture = 1 }, --sapatos
				["tshirt"] = { item = 18, texture = 0 }, --camisa
				["torso"] = { item = 0, texture = 13 }, --jaqueta
				["accessory"] = { item = 23, texture = 0 }, --acessorios
				["watch"] = { item = -1, texture = 0 }, --relogio 
				["arms"] = { item = 198, texture = 2 }, --maos
				["glass"] = { item = 0, texture = 0 }, --oculos
				["ear"] = { item = -1, texture = 0 } --brinco
		},
		["mp_f_freemode_01"] = {
				["hat"] = { item = -1, texture = 0 }, --chapeu
				["pants"] = { item = 73, texture = 5 },  --calca
				["vest"] = { item = 13, texture = 0 }, --colete
				["bracelet"] = { item = -1, texture = 0 }, --pulseira
				["backpack"] = { item = 0, texture = 0 }, --mochila
				["decals"] = { item = 0, texture = 0 }, --adesivos
				["mask"] = { item = 0, texture = 0 }, --mascara
				["shoes"] = { item = 24, texture = 0 }, --sapatos
				["tshirt"] = { item = 9, texture = 0 }, --camisa
				["torso"] = { item = 335, texture = 1 }, --jaqueta
				["accessory"] = { item = 45, texture = 0 }, --acessorios
				["watch"] = { item = -1, texture = 0 }, --relogio 
				["arms"] = { item = 198, texture = 2 }, --maos
				["glass"] = { item = 0, texture = 0 }, --oculos
				["ear"] = { item = -1, texture = 0 } --brinco				
		}
	},
	["15"] = {
	["mp_m_freemode_01"] = {
			["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
			["pants"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
			["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
			["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
			["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
			["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
			["shoes"] = { item = 7, texture = 0, defaultItem = 1, defaultTexture = 0 },
			["tshirt"] = { item = 96, texture = 1, defaultItem = 1, defaultTexture = 0 },
			["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
			["torso"] = { item = 32, texture = 7, defaultItem = 0, defaultTexture = 0 },
			["accessory"] = { item = 126, texture = 0, defaultItem = 0, defaultTexture = 0 },
			["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
			["arms"] = { item = 79, texture = 0, defaultItem = 0, defaultTexture = 0 },
			["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
			["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
	},
	["mp_f_freemode_01"] = {
			["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
			["pants"] = { item = 99, texture = 0, defaultItem = 0, defaultTexture = 0 },
			["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
			["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
			["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
			["mask"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
			["shoes"] = { item = 1, texture = 10, defaultItem = 1, defaultTexture = 0 },
			["tshirt"] = { item = 101, texture = 1, defaultItem = 1, defaultTexture = 0 },
			["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
			["torso"] = { item = 257, texture = 7, defaultItem = 0, defaultTexture = 0 },
			["accessory"] = { item = 10, texture = 4, defaultItem = 0, defaultTexture = 0 },
			["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
			["arms"] = { item = 101, texture = 0, defaultItem = 0, defaultTexture = 0 },
			["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
			["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
	}
    }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:PRESETFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:presetFunctions")
AddEventHandler("player:presetFunctions",function(number)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		-- if vRP.hasGroup(user_id,"Paramedic") or vRP.hasGroup(user_id,"Police")  then
		if vRP.hasGroup(user_id,"Emergency") then
		    local model = vRP.modelPlayer(source)

			if model == "mp_m_freemode_01" or "mp_f_freemode_01" then
				TriggerClientEvent("updateRoupas",source,preset[number][model])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:CHECKTRUNK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:checkTrunk")
AddEventHandler("player:checkTrunk",function()
	local source = source
	local otherPlayer = vRPC.nearestPlayer(source)
	if otherPlayer then
		TriggerClientEvent("player:checkTrunk",otherPlayer)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:CHECKTRASH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:checkTrash")
AddEventHandler("player:checkTrash",function()
	local source = source
	local otherPlayer = vRPC.nearestPlayer(source)
	if otherPlayer then
		TriggerClientEvent("player:checkTrash",otherPlayer)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OUTFIT - REMOVER
-----------------------------------------------------------------------------------------------------------------------------------------
local removeFit = {
	["homem"] = {
		["hat"] = { item = -1, texture = 0 },
		["pants"] = { item = 14, texture = 0 },
		["vest"] = { item = 0, texture = 0 },
		["backpack"] = { item = 0, texture = 0 },
		["bracelet"] = { item = -1, texture = 0 },
		["decals"] = { item = 0, texture = 0 },
		["mask"] = { item = 0, texture = 0 },
		["shoes"] = { item = 5, texture = 0 },
		["tshirt"] = { item = 15, texture = 0 },
		["torso"] = { item = 15, texture = 0 },
		["accessory"] = { item = 0, texture = 0 },
		["watch"] = { item = -1, texture = 0 },
		["arms"] = { item = 15, texture = 0 },
		["glass"] = { item = 0, texture = 0 },
		["ear"] = { item = -1, texture = 0 }
	},
	["mulher"] = {
		["hat"] = { item = -1, texture = 0 },
		["pants"] = { item = 14, texture = 0 },
		["vest"] = { item = 0, texture = 0 },
		["backpack"] = { item = 0, texture = 0 },
		["bracelet"] = { item = -1, texture = 0 },
		["decals"] = { item = 0, texture = 0 },
		["mask"] = { item = 0, texture = 0 },
		["shoes"] = { item = 5, texture = 0 },
		["tshirt"] = { item = 15, texture = 0 },
		["torso"] = { item = 15, texture = 0 },
		["accessory"] = { item = 0, texture = 0 },
		["watch"] = { item = -1, texture = 0 },
		["arms"] = { item = 15, texture = 0 },
		["glass"] = { item = 0, texture = 0 },
		["ear"] = { item = -1, texture = 0 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYER:PRESETFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("player:outfitFunctions")
AddEventHandler("player:outfitFunctions",function(mode)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id and not exports["hud"]:Repose(user_id) and not exports["hud"]:Wanted(user_id) then
		if mode == "aplicar" then
			local result = vRP.getSrvdata("saveClothes:"..user_id)
			if result["pants"] ~= nil then
				TriggerClientEvent("updateRoupas",source,result)
				TriggerClientEvent("Notify",source,"verde","Roupas aplicadas.",3000)
			else
				TriggerClientEvent("Notify",source,"amarelo","Roupas não encontradas.",3000)
			end
		elseif mode == "preaplicar" then
			if vRP.userPremium(user_id) then
				local result = vRP.getSrvdata("premClothes:"..user_id)
				if result["pants"] ~= nil then
					TriggerClientEvent("updateRoupas",source,result)
					TriggerClientEvent("Notify",source,"verde","Roupas aplicadas.",3000)
				else
					TriggerClientEvent("Notify",source,"amarelo","Roupas não encontradas.",3000)
				end
			end
		elseif mode == "salvar" then
			local checkBackpack = vSKINSHOP.checkBackpack(source)
			if not checkBackpack then
				local custom = vSKINSHOP.getCustomization(source)
				if custom then
					vRP.setSrvdata("saveClothes:"..user_id,custom)
					TriggerClientEvent("Notify",source,"verde","Roupas salvas.",3000)
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Remova do corpo o acessório item.",5000)
			end
		elseif mode == "presalvar" then
			if vRP.userPremium(user_id) then
				local checkBackpack = vSKINSHOP.checkBackpack(source)
				if not checkBackpack then
					local custom = vSKINSHOP.getCustomization(source)
					if custom then
						vRP.setSrvdata("premClothes:"..user_id,custom)
						TriggerClientEvent("Notify",source,"verde","Roupas salvas.",3000)
					end
				else
					TriggerClientEvent("Notify",source,"amarelo","Remova do corpo o acessório item.",5000)
				end
			end
		elseif mode == "remover" then
			local model = vRP.modelPlayer(source)
			if model == "mp_m_freemode_01" then
				TriggerClientEvent("updateRoupas",source,removeFit["homem"])
			elseif model == "mp_f_freemode_01" then
				TriggerClientEvent("updateRoupas",source,removeFit["mulher"])
			end
		else
			TriggerClientEvent("skinshop:set"..mode,source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("add",function(source,args,rawCommand)
	if exports["chat"]:statusChat(source) then
		local user_id = vRP.getUserId(source)
		if user_id and args[1] and parseInt(args[2]) > 0 then
			local Group = args[1]
			local nuser_id = parseInt(args[2])

			local identity = vRP.userIdentity(nuser_id)
			if identity then
				if vRP.hasPermission(user_id,"set"..Group) then
					vRP.cleanPermission(nuser_id)
					vRP.setPermission(nuser_id,Group)
					TriggerClientEvent("Notify",source,"verde","Passaporte <b>"..nuser_id.."</b> adicionado.",5000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("rem",function(source,args,rawCommand)
	if exports["chat"]:statusChat(source) then
		local user_id = vRP.getUserId(source)
		if user_id and args[1] and parseInt(args[2]) > 0 then
			local Group = args[1]
			local nuser_id = parseInt(args[2])

			local identity = vRP.userIdentity(nuser_id)
			if identity then
				if vRP.hasPermission(user_id,"set"..Group) then
					vRP.cleanPermission(nuser_id)
					TriggerClientEvent("Notify",source,"amarelo","Passaporte <b>"..nuser_id.."</b> removido.",5000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEATHLOGS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("player:deathLogs")
AddEventHandler("player:deathLogs",function(nSource)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id and source ~= nSource then
		local nuser_id = vRP.getUserId(nSource)
		if nuser_id then
			TriggerEvent("discordLogs","Deaths","**Matou:** "..user_id.."\n**Morreu:** "..nuser_id.."\n**Horário:** "..os.date("%H:%M:%S"),3092790)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORDLINKS
-----------------------------------------------------------------------------------------------------------------------------------------
local discordLinks = {
	["Disconnect"] = "https://discord.com/api/webhooks/1120807543929839678/kKabhaorrIOKiIRNt16cQmWHAZOCaT2i_yNAdE99SzXHM8wAScb5gY9v_X2iWVTTNmiW",
	["Police"] = "https://discord.com/api/webhooks/1118163584879444078/4xUqPyVE07DLZXLmhhyTD7BhT5WYsL_66WqYy1yIqhG_0cTjsZsvY2wp3NxCQCXFq9fW",
	["PoliceComando"] = "https://discord.com/api/webhooks/1118165217201881159/xxlQ6mb-_guFKQNYg5gSWDiJ_53lb-NyeiY1zYhrvGJ0uw0jmtQLfy2KRinvNI7v5MKK",
	["Sargento"] = "",
	["Soldado"] = "",
	["Recruta"] = "",
	["Sheriff"] = "",
	["Paramedic"] = "",
	["Mechanic"] = "https://discord.com/api/webhooks/1034177234254176316/9Q3pUgRYd3RIa8E9-D9j89I21QNkYt0_xQWT9dudLJopl0XJFVzO2NWcfTODmge3u8PX",
	["Hackers"] = "https://discord.com/api/webhooks/1120808289618370690/FFL7J3wcXt-LbZ1iP5riS41aYhKecbqLRGdP-S8apIGx4BcVGOxk7PvLsPZmCMl4ZFe2",
	["Gemstones"] = "https://discord.com/api/webhooks/1113618865746878537/nfORANaF6Km41rgCHuLMHJ3F_eigEHwu7zfMKWiKEikhEu65N0zCRmfMOOO_1e6tM3sZ",	
	
	

	["BurgershotLider"] = "",
	["BurgershotGerente"] = "",
	["BurgershotMembro"] = "",
	["MechanicLider"] = "",
	["MechanicGerente"] = "",
	["MechanicMembro"] = "",
	["MotoclubLider"] = "",
	["MotoclubGerente"] = "",
	["MotoclubMembro"] = "",
	["VagosLider"] = "",
	["VagosGerente"] = "",
	["VagosMembro"] = "",
	["BunkerLider"] = "",
	["BunkerGerente"] = "",
	["BunkerMembro"] = "",
	["ObeyLider"] = "",
	["ObeyGerente"] = "",
	["ObeyMembro"] = "",
	["BallasLider"] = "",
	["BallasGerente"] = "",
	["BallasMembro"] = "",
	["YakuzaLider"] = "",
	["YakuzaGerente"] = "",
	["YakuzaMembro"] = "",
	["MafiavinhedoLider"] = "",
	["MafiavinhedoGerente"] = "",
	["MafiavinhedoMembro"] = "",
	["HPDiretor"] = "",
	["HPMedico"] = "",
	["HPParamedic"] = ""
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCORDLOGS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("discordLogs")
AddEventHandler("discordLogs",function(webhook,message,color)
	PerformHttpRequest(discordLinks[webhook],function(err,text,headers) end,"POST",json.encode({
		username = "Brabus Roleplay",
		embeds = { { color = color, description = message } }
	}),{ ["Content-Type"] = "application/json" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BIKESBACKPACK
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.bikesBackpack()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local amountWeight = 10
		local myWeight = vRP.getWeight(user_id)

		if parseInt(myWeight) < 45 then
			amountWeight = 15
		elseif parseInt(myWeight) >= 45 and parseInt(myWeight) <= 79 then
			amountWeight = 10
		elseif parseInt(myWeight) >= 80 and parseInt(myWeight) <= 95 then
			amountWeight = 5
		elseif parseInt(myWeight) >= 100 and parseInt(myWeight) <= 148 then
			amountWeight = 2
		elseif parseInt(myWeight) >= 150 then
			amountWeight = 1
		end

		vRP.setWeight(user_id,amountWeight)
	end
end