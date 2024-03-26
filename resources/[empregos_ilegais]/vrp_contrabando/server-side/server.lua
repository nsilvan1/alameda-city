-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_contrabando",cRP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local maxPackage = 3
local boxVehicles = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP_STOPOP:ADDPACKAGE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.addPackage(vehPlate)
	if boxVehicles[vehPlate] == nil then
		boxVehicles[vehPlate] = 1
	else
		if boxVehicles[vehPlate] < maxPackage then
			boxVehicles[vehPlate] = boxVehicles[vehPlate] + 1
		else
			return false
		end
	end

	TriggerClientEvent("vrp_contrabando:updatePackage",-1,boxVehicles)
	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTMETHOD
-----------------------------------------------------------------------------------------------------------------------------------------
-- function cRP.paymentMethod()
--     local src = source
--     local user_id = vRP.getUserId(src)
--     local value = math.random(2300,4000)
--     if user_id then
--         vRP.giveInventoryItem(user_id,"dollars",value,true)
--     end
-- end
function cRP.paymentMethod()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local value = math.random(4000,5000)
		local value2 = math.random(35,50)
		vRP.giveInventoryItem(user_id,"dollars2",value,true)
		vRP.giveInventoryItem(user_id,"coins",value2,true)
		TriggerClientEvent("sounds:source",source,"coin",0.8)
		--TriggerClientEvent("Notify",source,"verde","Você recebeu: <b>$ "..value.."</b> e <b>"..value2.."</b> coins",5000)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP_STOPOP:REMPACKAGE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("vrp_contrabando:remPackage")
AddEventHandler("vrp_contrabando:remPackage",function(vehPlate)
	if boxVehicles[vehPlate] then
		boxVehicles[vehPlate] = boxVehicles[vehPlate] - 1

		if boxVehicles[vehPlate] <= 0 then
			boxVehicles[vehPlate] = nil
		end

		TriggerClientEvent("vrp_contrabando:updatePackage",-1,boxVehicles)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source)
	TriggerClientEvent("vrp_contrabando:updatePackage",source,boxVehicles)
end)