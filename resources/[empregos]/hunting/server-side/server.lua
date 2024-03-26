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
Tunnel.bindInterface("hunting",cRP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANIMALPAYMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.animalPayment()
	local source = source
	local user_id = vRP.getUserId(source)
    local value = math.random(1,3)
	local value2 = math.random(2,6)
	local value3 = math.random(1,3)
	if user_id then
		if vRP.inventoryWeight(user_id) +1 >= vRP.getWeight(user_id) then
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
			Wait(1)
		else
            vRP.giveInventoryItem(user_id,"animalpelt",value,true)
            vRP.giveInventoryItem(user_id,"meat",value2,true)
            vRP.giveInventoryItem(user_id,"animalfat",value3,true)
			TriggerClientEvent("sounds:source",source,"ziper",0.5)
			vRP.upgradeStress(user_id,1)
			return true
		end
		return false
	end
end