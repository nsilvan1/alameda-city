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
Tunnel.bindInterface("trucker",cRP)
vGARAGE = Tunnel.getInterface("trucker")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local deliveryPackage = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKEXIST
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkExist()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if deliveryPackage[user_id] then
			if vRP.userPremium(user_id) then
				if deliveryPackage[user_id] >= 999 then
					TriggerClientEvent("Notify",source,"amarelo","Atingiu o limite diário.",5000)
					return true
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Atingiu o limite diário.",5000)
				return true
			end
		end

		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTMETHOD
-----------------------------------------------------------------------------------------------------------------------------------------
--function cRP.paymentMethod()
--	local source = source
--	local user_id = vRP.getUserId(source)
--	if user_id then
--		if deliveryPackage[user_id] == nil then
--			deliveryPackage[user_id] = 0
--		end

--		vRP.generateItem(user_id,"plasticbottle",math.random(8,12),true)
--		vRP.generateItem(user_id,"glassbottle",math.random(8,12),true)
--		vRP.generateItem(user_id,"elastic",math.random(8,12),true)
--		vRP.generateItem(user_id,"metalcan",math.random(8,12),true)
--		vRP.generateItem(user_id,"battery",math.random(8,12),true)
--		vRP.generateItem(user_id,"fabric",math.random(4,6),true)

--		deliveryPackage[user_id] = deliveryPackage[user_id] + 1
--	end
--end

-- function cRP.paymentMethod()
--     local src = source
--     local user_id = vRP.getUserId(src)
--     local value = math.random(2300,4000)
--     if user_id then
--         vRP.giveInventoryItem(user_id,"dollars",value,true)
-- 		TriggerClientEvent("vrp_sound:source",source,'coins',0.3)
--     end
-- end

function cRP.paymentMethod()
	local src = source
	local user_id = vRP.getUserId(src)
	local value = math.random(10000,12000)
	local value2 = math.random(50,80) -- a cada '16 a 18' min faz '1' caminhão
	if user_id then
		vRP.upgradeStress(user_id,2)
		vRP.giveInventoryItem(user_id,"dollars",value,true)
		vRP.giveInventoryItem(user_id,"coins",value2,true)
		--TriggerClientEvent("vrp_sound:source",source,'coins',0.3)
		TriggerClientEvent("sounds:source",source,"coin",0.5)

		if vRP.userPremium(user_id) then
			vRP.generateItem(user_id,"dollars",value * 0.05,true) --exemplo
		end
	end
end

local timer = {}


function cRP.sdka(timer2)
    local src = source
    local user_id = vRP.getUserId(src)
    timer[user_id] = timer2
end