---------------------------------------------
-- Nosso Discord
-- https://discord.gg/UajwX4a
---------------------------------------------

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
gaR = {}
Tunnel.bindInterface("puzzle_garden",gaR)

-----------------------------------------------------------------------------------------------------------------------------------------
-- PAGAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------
function gaR.PayJob()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.upgradeStress(user_id,1)
		local value = math.random(550,750)
		local value2 = math.random(5,10) -- a cada 10 min faz '8 a 10' plantas
		vRP.giveInventoryItem(user_id,"dollars",parseInt(value),true)
		vRP.giveInventoryItem(user_id,"coins",value2,true)
		TriggerClientEvent("vrp_sound:source",source,'coins',0.5)
		--TriggerClientEvent("Notify",source,"verde","Você recebeu: <b>$ "..value.."</b>",5000)
	end
end