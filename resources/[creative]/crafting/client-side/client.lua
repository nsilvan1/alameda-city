-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("crafting")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("invClose",function()
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "hideNUI" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestCrafting",function(data,cb)
	local inventoryCraft,inventoryUser,invPeso,invMaxpeso = vSERVER.requestCrafting(data["craft"])
	if inventoryCraft then
		cb({ inventoryCraft = inventoryCraft, inventario = inventoryUser, invPeso = invPeso, invMaxpeso = invMaxpeso })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONCRAFT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionCraft",function(data)
	if MumbleIsConnected() then
		vSERVER.functionCrafting(data["index"],data["craft"],data["amount"],data["slot"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONDESTROY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionDestroy",function(data)
	if MumbleIsConnected() then
		vSERVER.functionDestroy(data["index"],data["craft"],data["amount"],data["slot"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("populateSlot",function(data)
	if MumbleIsConnected() then
		TriggerServerEvent("crafting:populateSlot",data["item"],data["slot"],data["target"],data["amount"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSlot",function(data)
	if MumbleIsConnected() then
		TriggerServerEvent("crafting:updateSlot",data["item"],data["slot"],data["target"],data["amount"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:Update")
AddEventHandler("crafting:Update",function(action)
	SendNUIMessage({ action = action })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local craftList = {
	{ -347.09,-1576.81,25.22,"lixeiroShop" },
	{ 1109.62,-2008.11,31.05,"minerShop" },
	{ 244.49,374.31,105.73,"ropeShop" },            ---- Corda
	{ 1228.9,-74.13,61.08,"PenShop" },              ---- Pendrive de Ouro
	{ 83.87,-1551.67,29.59, "itensShop" }, 
	{ 1231.6,-214.04,75.59, "lockShop" }, 	
	{ 914.15,-2127.23,30.46,"mechanicShop" },
	{ -695.56,5802.12,17.32,"huntingShop" },
	{ 707.32,-967.0,30.41,"Ilegalfree" },
	{ 2450.64,4764.27,34.31,"fazendeiroShop" },

	{ 1196.21,-147.57,61.38,"LavagemNPC" },	        ---- Lavagem Dinehiro
	{ 2407.73,4796.0,35.23,"FertilizanteShop" },	---- Fertilizante
	
	{ -1194.97,-897.7,13.88,"Burgershot" },
	{ -1196.25,-897.33,13.88,"Burgershot2" },
	{ 1328.19,-1650.97,44.25,"Vagos" },            ---- Cocaina - Mesa de Cocaina
	{ 1322.34,-1652.46,44.25,"Vagos2" },           ---- Algema - Capuz - Colete	
	{ 2433.72,4969.19,42.34,"Ballas" },            ---- Maconha - Mesa de Maconha
	{ 2432.0,4967.64,42.34,"Ballas2" },            ---- Algema - Capuz - Colete
	{ -1870.49,2060.71,135.44,"Mafiavinhedo" },    ---- Fabricação de Arma
	{ -1870.56,2062.65,135.44,"Mafiavinhedo2" },   ---- Fabricação de Corpo e Gailho de Arma
	{ 923.27,-3200.65,-17.3,"Bunker" },            ---- Fabricação de Munição
	{ 925.35,-3200.33,-17.3,"Bunker2" },           ---- Fabricação de Capsula e Projetil de munição
	{ 1188.85,2641.1,38.4,"Motoclub" },            ---- Desmanche - Lockpick - Lockpick2 - Block Sinal
	{ -875.72,-1458.3,7.53,"Yakuza" }              ---- Lavagem
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTARGET
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)

	for k,v in pairs(craftList) do
		exports["target"]:AddCircleZone("Crafting:"..k,vector3(v[1],v[2],v[3]),1.0,{
			name = "Crafting:"..k,
			heading = 3374176
		},{
			shop = k,
			distance = 1.0,
			options = {
				{
					event = "crafting:openSystem",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:OPENSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:openSystem",function(shopId)
	if vSERVER.requestPerm(craftList[shopId][4]) then
		SetNuiFocus(true,true)
		SendNUIMessage({ action = "showNUI", name = craftList[shopId][4] })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:FUELSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("crafting:fuelShop",function()
	SetNuiFocus(true,true)
	SendNUIMessage({ action = "showNUI", name = "fuelShop" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:OPENSOURCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:openSource")
AddEventHandler("crafting:openSource",function()
	SetNuiFocus(true,true)
	SendNUIMessage({ action = "showNUI", name = "craftShop" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTING:AMMUNATION
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:Ammunation")
AddEventHandler("crafting:Ammunation",function()
	SetNuiFocus(true,true)
	SendNUIMessage({ action = "showNUI", name = "ammuShop" })
end)