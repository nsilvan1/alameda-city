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
Tunnel.bindInterface("lumberman",cRP)
vCLIENT = Tunnel.getInterface("lumberman")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local collect = {}
local collectMin = 2
local collectMax = 4

local amount = {}
local amountMin = 3
local amountMax = 6

local paymentMin = 180
local paymentMax = 250
local consumeItem = "woodlog"
-----------------------------------------------------------------------------------------------------------------------------------------
-- AMOUNTCOLLECT
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.amountCollect()
	local source = source
	if collect[source] == nil then
		collect[source] = math.random(collectMin,collectMax)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- AMOUNTSERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.amountService()
	local source = source
	if amount[source] == nil then
		amount[source] = math.random(amountMin,amountMax)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- COLLECTMETHOD
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.collectMethod()
	cRP.amountCollect()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.inventoryWeight(user_id) + (itemWeight(tostring(consumeItem))) * parseInt(collect[source]) >= vRP.getWeight(user_id) then
		vRPclient.stopActived(source)
			TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
			--TriggerClientEvent("vrp_sound:source",source,'priocrime',0.8)
			TriggerClientEvent("sounds:source",source,"error",0.3)
			Wait(1)
		else
			vRP.giveInventoryItem(user_id,tostring(consumeItem),parseInt(collect[source]),true)
			vRP.upgradeStress(user_id,1)
			collect[source] = nil
			return true
		end
		return false
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTMETHOD
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.paymentMethod()
	cRP.amountService()
	local source = source
	local user_id = vRP.getUserId(source)
	-- local value2 = math.random(20,22) -- a cada 10 min entrega '5 a 7' madeira
	local value2 = math.random(30,35) -- a cada 10 min entrega '5 a 7' madeira
	if user_id then
		if vRP.tryGetInventoryItem(user_id,tostring(consumeItem),parseInt(amount[source])) then
			vRP.upgradeStress(user_id,1)
			local value = math.random(paymentMin,paymentMax) * amount[source]
			vRP.giveInventoryItem(user_id,"dollars",parseInt(value),true)
			vRP.giveInventoryItem(user_id,"coins",value2,true)
			TriggerClientEvent("sounds:source",source,"cash",0.5)
			amount[source] = nil
			return true
		else
			TriggerClientEvent("Notify",source,"amarelo","Você precisa de <b>"..vRP.format(parseInt(amount[source])).."x "..vRP.itemNameList(consumeItem).."</b>.",5000)
		end
		return false
	end
end