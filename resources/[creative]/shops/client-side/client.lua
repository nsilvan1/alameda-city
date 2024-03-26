-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("shops",cRP)
vSERVER = Tunnel.getInterface("shops")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(data)
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "hideNUI" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestShop",function(data,cb)
	local inventoryShop,inventoryUser,invPeso,invMaxpeso,shopSlots = vSERVER.requestShop(data["shop"])
	if inventoryShop then
		cb({ inventoryShop = inventoryShop, inventoryUser = inventoryUser, invPeso = invPeso, invMaxpeso = invMaxpeso, shopSlots = shopSlots })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTBUY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionShops",function(data)
	if MumbleIsConnected() then
		vSERVER.functionShops(data["shop"],data["item"],data["amount"],data["slot"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("populateSlot",function(data)
	if MumbleIsConnected() then
		TriggerServerEvent("shops:populateSlot",data["item"],data["slot"],data["target"],data["amount"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSlot",function(data)
	if MumbleIsConnected() then
		TriggerServerEvent("shops:updateSlot",data["item"],data["slot"],data["target"],data["amount"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRUNKCHEST:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.updateShops(action)
	SendNUIMessage({ action = action })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local shopList = {

	{ 1116.51,221.75,-49.44,"casinoFichasBuy",false },
	{ 1116.52,218.22,-49.44,"casinoFichasSell",false },
	{ -551.1,-191.07,38.22,"identityStore",false },
	{ -553.3,-192.34,38.22,"identityStore",false },
	{ 1351.6,-223.16,136.6,"fidentityStore",false },
	{ 226.79,-909.24,30.73,"departamentStore",true },     -- Praça
	{ 1334.33,-1650.43,52.25,"departamentStore",true },   -- Vagos
	{ 24.9,-1346.8,29.49,"departamentStore",true },
	{ 2556.74,381.24,108.61,"departamentStore",true },
	{ 1164.82,-323.65,69.2,"departamentStore",true },
	{ -706.15,-914.53,19.21,"departamentStore",true },
	{ -47.38,-1758.68,29.42,"departamentStore",true },
	{ 373.1,326.81,103.56,"departamentStore",true },
	{ -3242.75,1000.46,12.82,"departamentStore",true },
	{ 1728.47,6415.46,35.03,"departamentStore",true },
	{ 1960.2,3740.68,32.33,"departamentStore",true },
	{ 2677.8,3280.04,55.23,"departamentStore",true },
	{ 1697.31,4923.49,42.06,"departamentStore",true },
	{ -1819.52,793.48,138.08,"departamentStore",true },
	{ 1391.69,3605.97,34.98,"departamentStore",true },
	{ -2966.41,391.55,15.05,"departamentStore",true },
	{ -3039.54,584.79,7.9,"departamentStore",true },
	{ 1134.33,-983.11,46.4,"departamentStore",true },
	{ 1165.28,2710.77,38.15,"departamentStore",true },
	{ -1486.72,-377.55,40.15,"departamentStore",true },
	{ -1221.45,-907.92,12.32,"departamentStore",true },
	{ -160.62,6320.93,31.58,"departamentStore",true },
	{ 548.7,2670.73,42.16,"departamentStore",true },
	{ 161.19,6642.24,31.69,"departamentStore",true },    -- Loja De Departamentos 21
	{ 291.99,-1272.61,29.52,"departamentStore",true },   -- Loja De Departamentos 22
	{ 1695.26,3760.94,34.69,"ammunationStore",false },   -- Loja De Armas 1
	{ 250.12,-51.56,69.94,"ammunationStore",false },     -- Loja De Armas 2
	{ 840.19,-1032.14,28.19,"ammunationStore",false },   -- Loja De Armas 3
	{ -327.81,6084.3,31.46,"ammunationStore",false },    -- Loja De Armas 4
	{ -660.05,-936.71,21.82,"ammunationStore",false },   -- Loja De Armas 5
	{ -1307.72,-396.02,36.7,"ammunationStore",false },   -- Loja De Armas 6 
	{ -1115.16,2698.94,18.55,"ammunationStore",false },  -- Loja De Armas 7
	{ 2565.72,295.73,108.73,"ammunationStore",false },   -- Loja De Armas 8
	{ -3169.76,1089.16,20.84,"ammunationStore",false },  -- Loja De Armas 9
	{ 22.54,-1105.54,29.79,"ammunationStore",false },    -- Loja De Armas 10
	{ 810.26,-2159.02,29.62,"ammunationStore",false },   -- Loja De Armas 11
	{ -1082.25,-247.52,37.76,"premiumStore",false },
	{ 1524.77,3783.84,34.49,"fishingSell",false },
	{ -908.83,-222.34,40.02,"imoveisShop",false },
	-- { -675.33,5829.79,17.32,"huntingSell",false },
	{ -679.13,5839.52,17.32,"huntingStore",false },
	{ 91.84,-230.29,54.88,"pharmacyStore",false },
	{ -177.25,6384.08,32.47,"pharmacyStore",false },
	{ 1690.07,3581.68,35.62,"pharmacyStore",false },
	{ 326.5,-1074.43,29.47,"pharmacyStore",false },
	{ -254.64,6326.95,32.82,"pharmacyParamedic",false },
	{ -805.35,-1212.8,7.33,"pharmacyParamedic",false },
	{ 46.15,-1749.28,29.64,"mercadoCentral",false },
	{ 2749.06,3482.96,55.67,"mercadoCentral",false },
	{ -428.57,-1728.35,19.78,"recyclingSell",false },
	{ -840.25,5399.24,34.61,"woodsell",false },
	{ 405.5,6526.34,27.68,"vestsell",false },
	{ 2301.1,5064.08,45.8,"wheatsell",false },
	{ 482.63,-995.2,30.68,"arsenallspd",false }, 
	{ 1777.85,2542.16,45.8,"arsenallspd",false }, 
	{ 480.9,-995.23,30.68,"arsenallspd2",false }, 
	{ 1777.31,2544.35,45.8,"arsenallspd2",false }, 
	{ 459.92,-984.81,30.68,"portelspd",false }, 
	{ 1421.97,-258.69,177.46,"attachStore",false },	
	{ -628.41,-238.36,38.05,"minerShop",false },
	{ 1050.81,-1958.67,31.02,"minerioShop",false },
	{ -652.93,-266.84,35.99,"minerioShop2",false },
	{ 696.77,-1011.05,22.8,"pneuilegal",false },       -- Venda De Pneu
	{ 1391.91,-202.61,157.01,"ilegalshop2",false },    -- Compra de Ilegais
	{ -2165.81,5197.6,16.88,"ilegalshop3",false },     -- Compra de Ilegais
	{ 1433.97,-285.86,177.46,"ilegalCriminal",false }, -- Venda de Ilegal
	{ 1295.35,-256.7,96.26,"ilegalHouse",false },      -- Venda de Objetos
	{ 1216.29,-106.04,59.99,"ilegalCosmetics",false }, -- Venda de Cosméticos
	{ 1203.06,-177.0,64.25,"ilegalToys",false },       -- Venda de Brinquedos
	{ -277.22,2208.63,129.76,"ilegalSniper",false },   -- Venda de Sniper	
	{ 3829.2,4441.03,2.8,"trofeuSell",false },         -- Venda de Trofeu
	{ 1234.01,-236.1,77.85,"armamentoBuy",false },     -- Venda de Armamento
	{ 1232.66,-236.29,77.85,"coleteBuy",false },       -- Venda de Colete e Acessório
	{ 1231.34,-199.83,75.57,"drogasBuy",false },       -- Venda de Drogas
	{ 1225.32,-199.35,75.6,"mesadrogasBuy",false },    -- Venda de Mesa de Drogas
	{ 871.19,-2116.12,30.46,"mechanicTools",false },
	{ -349.67,-148.78,39.01,"mechanicTools2",false },
	{ 883.1,-2100.48,30.46,"mechanicBuy",false },
	{ -1835.18,-1187.23,14.31,"pier",false },
	{ -142.54,-259.06,43.64,"chicken",false },
	{ 2487.34,3760.36,42.24,"cogumeloStore",false },
	{ -1172.14,-1571.84,4.67,"cogumeloStore",false },
	{ 2461.71,4744.49,34.31,"fazendeiroStore",false },
	{ 1523.69,3782.48,34.51,"fishdepartamentStore",true },
	{ 563.19,2752.92,42.87,"animalStore",false },
	{ 967.26,-2187.63,30.04,"animalShop",false },
	{ 1400.56,-162.11,162.87,"ropeStore",false },	
	{ 336.12,-906.03,29.25,"cyberbar2",true },
	{ 1112.21,211.57,-49.44,"cyberbar",true },      
	{ 335.97,-916.65,29.25,"cyberbar",true },
	{ -1587.07,-993.21,13.08,"cyberbar",true },
	{ 2513.73,4097.53,38.59,"cyberbar",true },
	{ -3207.09,786.73,8.93,"cyberbar",true },          -- Mansão1
	{ -482.45,-218.67,36.87,"Chihuahua",true },
	{ -1185.27,-893.22,13.88,"burgershot",true },
	{ -1189.18,-887.34,13.88,"burgershot",true },
	{ -1186.37,-885.44,13.88,"burgershot",true },
	{ -1182.52,-891.28,13.88,"burgershot",true },
	{ -1194.15,-896.2,13.88,"burgerStore",true },
	{ 335.85,-902.61,29.25,"coinsSell",false }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPINFOS
-----------------------------------------------------------------------------------------------------------------------------------------
local shopInfos = {
	["1"] = {
		{
			event = "shops:openSystem",
			label = "Abrir",
			tunnel = "shop"
		},{
			event = "crafting:ammunationStore",
			label = "Criar",
			tunnel = "shop"
		}
	},
	["2"] = {
		{
			event = "shops:openSystem",
			label = "Abrir",
			tunnel = "shop"
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- INFORMATIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function Informations(shopName)
	if shopName == "ammunationStoreStore" then
		return shopInfos["1"]
	end

	return shopInfos["2"]
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTARGET
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)

	for k,v in pairs(shopList) do
		exports["target"]:AddCircleZone("Shops:"..k,vector3(v[1],v[2],v[3]),0.75,{
			name = "Shops:"..k,
			heading = 3374176
		},{
			shop = k,
			distance = 1.75,
			options = Informations(v[4])
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:OPENSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:openSystem",function(shopId)
	if vSERVER.requestPerm(shopList[shopId][4]) and MumbleIsConnected() then
		SetNuiFocus(true,true)
		SendNUIMessage({ action = "showNUI", name = shopList[shopId][4], type = vSERVER.getShopType(shopList[shopId][4]) })

		if shopList[shopId][5] then
			TriggerEvent("sounds:source","shop",0.5)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:COFFEEMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:coffeeMachine",function()
	if MumbleIsConnected() then
		SendNUIMessage({ action = "showNUI", name = "coffeeMachine", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:SODAMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:sodaMachine",function()
	if MumbleIsConnected() then
		SendNUIMessage({ action = "showNUI", name = "sodaMachine", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:CYBER-BAR
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:cyberbar",function()
	if MumbleIsConnected() then
		SendNUIMessage({ action = "showNUI", name = "cyberbar", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:CYBER-BAR2
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:cyberbar2",function()
	if MumbleIsConnected() then
		SendNUIMessage({ action = "showNUI", name = "cyberbar2", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:DONUTMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:donutMachine",function()
	if MumbleIsConnected() then
		SendNUIMessage({ action = "showNUI", name = "donutMachine", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:BURGERMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:burgerMachine",function()
	if MumbleIsConnected() then
		SendNUIMessage({ action = "showNUI", name = "burgerMachine", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HOTDOGMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:hotdogMachine",function()
	if MumbleIsConnected() then
		SendNUIMessage({ action = "showNUI", name = "hotdogMachine", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:BURGERSHOT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:burgershot",function()
	if MumbleIsConnected() then
		SendNUIMessage({ action = "showNUI", name = "burgershot", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:CHIHUAHUA
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Chihuahua",function()
	if MumbleIsConnected() then
		SendNUIMessage({ action = "showNUI", name = "Chihuahua", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:WATERMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:waterMachine",function()
	if MumbleIsConnected() then
		SendNUIMessage({ action = "showNUI", name = "waterMachine", type = "Buy" })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:MEDICBAG
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:medicBag",function()
	if vSERVER.requestPerm("pharmacyParamedic") and MumbleIsConnected() then
		SetNuiFocus(true,true)
		SendNUIMessage({ action = "showNUI", name = "pharmacyParamedic", type = "Buy" })
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:Fichas Cassino
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:casinoFichasBuy",function()
	if vSERVER.requestPerm("casinoFichasBuy") and MumbleIsConnected() then
		SetNuiFocus(true,true)
		SendNUIMessage({ action = "showNUI", name = "casinoFichasBuy", type = "Buy" })
	end
end)

AddEventHandler("shops:casinoFichasSell",function()
	if vSERVER.requestPerm("casinoFichasSell") and MumbleIsConnected() then
		SetNuiFocus(true,true)
		SendNUIMessage({ action = "showNUI", name = "casinoFichasSell", type = "Sell" })
	end
end)