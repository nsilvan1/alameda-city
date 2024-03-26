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
Tunnel.bindInterface("airforce",cRP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTSERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.paymentService()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.upgradeStress(user_id,2)
		local value = math.random(2000,2250)
		local value2 = math.random(15,25) -- entrega de 7 a 9 em 30min
		vRP.generateItem(user_id,"dollars",value,true)
		vRP.giveInventoryItem(user_id,"coins",value2,true)
		--TriggerClientEvent("vrp_sound:source",source,'coin',0.5)
		TriggerClientEvent("sounds:source",source,"coin",0.5)

		if vRP.userPremium(user_id) then
			vRP.generateItem(user_id,"dollars",value * 0.10,true)
		end
	end
end