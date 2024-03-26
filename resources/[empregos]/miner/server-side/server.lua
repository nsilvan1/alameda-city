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
Tunnel.bindInterface("miner",cRP)
vCLIENT = Tunnel.getInterface("miner")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local collect = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- COLLECTITENS
-----------------------------------------------------------------------------------------------------------------------------------------
local collectItens = {
	[1] = "bauxita",
	[2] = "carvao",
	[3] = "min_chumbo",
	[4] = "min_cobre",
	[5] = "min_ferro",
	[6] = "nitrato",
	-- [7] = "ruby"
	-- [8] = "sulfur",
	-- [9] = "coal",
	-- [10] = "metalfragments",
	-- [11] = "gunpowder",
	-- [12] = "aluminum",
	-- [13] = "copper",
	-- [14] = "titanium"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- COLLECTMETHOD
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.collectMethod()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.inventoryWeight(user_id) +1 >= vRP.getWeight(user_id) then
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
			Wait(1)
		else
			vRP.giveInventoryItem(user_id,collectItens[math.random(#collectItens)],math.random(4,8),true)
			--TriggerClientEvent("vrp_sound:source",source,'coins',0.3)
			TriggerClientEvent("sounds:source",source,"coin",0.5)
			vRP.upgradeStress(user_id,0.5)
			collect[source] = nil
			return true
		end
		return false
	end
end