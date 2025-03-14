-----------------------------------------------------------------------------------------------------------------------------------------
-- TYREBURST
-----------------------------------------------------------------------------------------------------------------------------------------
local oldSpeed = 0
local Aiming = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- BIKESMODEL
-----------------------------------------------------------------------------------------------------------------------------------------
local bikesModel = {
	[1131912276] = true,
	[448402357] = true,
	[-836512833] = true,
	[-186537451] = true,
	[1127861609] = true,
	[-1233807380] = true,
	[-400295096] = true
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			timeDistance = 1

			DisableControlAction(0,345,true)

			if GetPedConfigFlag(ped,78,true) then
				if not Aiming then
					Aiming = GetFollowVehicleCamViewMode()
				end

				SetFollowVehicleCamViewMode(4)
			else
				if Aiming then
					SetFollowVehicleCamViewMode(Aiming)
					Aiming = false
				end
			end

			local vehicle = GetVehiclePedIsUsing(ped)
			if GetPedInVehicleSeat(vehicle,-1) == ped then
				local speed = GetEntitySpeed(vehicle) * 2.236936
				if speed ~= oldSpeed then
					if (oldSpeed - speed) >= 60 then
						TriggerServerEvent("upgradeStress",10)

						if GetVehicleClass(vehicle) ~= 8 then
							SetVehicleEngineOn(vehicle,false,true,true)

							local vehModel = GetEntityModel(vehicle)
							if bikesModel[vehModel] == nil then
								vehicleTyreBurst(vehicle)
							end
						end
					end

					oldSpeed = speed
				end
			end
		else
			if oldSpeed ~= 0 then
				oldSpeed = 0
			end

			if Aiming then
				Aiming = false
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADDRIFT
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsIn(ped)
			if GetPedInVehicleSeat(vehicle,-1) == ped then
				local vehClass = GetVehicleClass(vehicle)
				if (vehClass >= 0 and vehClass <= 7) or vehClass == 9 then
					if IsControlPressed(1,21) then
						local speed = GetEntitySpeed(vehicle) * 2.236936
						if speed <= 75.0 then
							SetVehicleReduceGrip(vehicle,true)

							if not GetDriftTyresEnabled(vehicle) then
								SetDriftTyresEnabled(vehicle,true)
								SetReduceDriftVehicleSuspension(vehicle,true)
							end
						end
					else
						SetVehicleReduceGrip(vehicle,false)

						if GetDriftTyresEnabled(vehicle) then
							SetDriftTyresEnabled(vehicle,false)
							SetReduceDriftVehicleSuspension(vehicle,false)
						end
					end
				end
			end
		end

		Citizen.Wait(100)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLETYREBURST
-----------------------------------------------------------------------------------------------------------------------------------------
function vehicleTyreBurst(Vehicle)
	local Tyre = math.random(4)

	if Tyre == 1 then
		if GetTyreHealth(Vehicle,0) == 1000.0 then
			SetVehicleTyreBurst(Vehicle,0,true,1000.0)
		end
	elseif Tyre == 2 then
		if GetTyreHealth(Vehicle,1) == 1000.0 then
			SetVehicleTyreBurst(Vehicle,1,true,1000.0)
		end
	elseif Tyre == 3 then
		if GetTyreHealth(Vehicle,4) == 1000.0 then
			SetVehicleTyreBurst(Vehicle,4,true,1000.0)
		end
	elseif Tyre == 4 then
		if GetTyreHealth(Vehicle,5) == 1000.0 then
			SetVehicleTyreBurst(Vehicle,5,true,1000.0)
		end
	end

	if math.random(100) < 30 then
		Citizen.Wait(500)
		vehicleTyreBurst(Vehicle)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {
	{ -24.75,-147.34,56.92,357,5,"GARAGEM DE BIKE",0.6 },
	{ -1188.13,-1574.47,4.35,357,5,"GARAGEM DE BIKE",0.6 },
	{ 143.91,6653.49,31.53,357,5,"GARAGEM DE BIKE",0.6 },
	{ 958.53,3618.86,32.67,357,5,"GARAGEM DE BIKE",0.6 },
	{ 1032.52,2656.05,39.55,357,5,"GARAGEM DE BIKE",0.6 },
	{ -247.42,6331.39,32.42,80,38,"HOSPITAL",0.5 },
	{ -822.34,-1223.61,7.33,80,38,"HOSPITAL",0.5 },
	{ 1839.33,3672.95,34.27,80,38,"HOSPITAL",0.5 },
	{ 55.43,-876.19,30.66,357,0,"GARAGEM",0.6 },
	{ 598.04,2741.27,42.07,357,0,"GARAGEM",0.6 },
	{ -136.36,6357.03,31.49,357,0,"GARAGEM",0.6 },
	{ 275.23,-345.54,45.17,357,0,"GARAGEM",0.6 },
	{ 596.40,90.65,93.12,357,0,"GARAGEM",0.6 },
	{ -340.76,265.97,85.67,357,0,"GARAGEM",0.6 },
	{ -2030.01,-465.97,11.60,357,0,"GARAGEM",0.6 },
	{ -1184.92,-1510.00,4.64,357,0,"GARAGEM",0.6 },
	{ 214.02,-808.44,31.01,357,0,"GARAGEM",0.6 },
	{ -348.88,-874.02,31.31,357,0,"GARAGEM",0.6 },
	{ 67.74,12.27,69.21,357,0,"GARAGEM",0.6 },
	{ 361.90,297.81,103.88,357,0,"GARAGEM",0.6 },
	{ 1035.89,-763.89,57.99,357,0,"GARAGEM",0.6 },
	{ -796.63,-2022.77,9.16,357,0,"GARAGEM",0.6 },
	{ 453.27,-1146.76,29.52,357,0,"GARAGEM",0.6 },
	{ 528.66,-146.3,58.38,357,0,"GARAGEM",0.6 },
	{ -1159.48,-739.32,19.89,357,0,"GARAGEM",0.6 },
	{ 101.22,-1073.68,29.38,357,0,"GARAGEM",0.6 },
	{ 1725.21,4711.77,42.11,357,0,"GARAGEM",0.6 },
	{ 1624.05,3566.14,35.15,357,0,"GARAGEM",0.6 },
	{ -73.35,-2004.6,18.27,357,0,"GARAGEM",0.6 },
	{ -1039.49,-2679.75,13.83,357,0,"GARAGEM",0.6 },
	{ 441.63,-1001.14,30.72,60,18,"LSPD",0.6 },
	{ -906.5,-234.29,39.82,524,17,"OBEY",0.6 },
	
	-- { 823.85,-1027.87,25.61,361,59,"Posto de Gasolina",0.5 },
	-- { 1208.6,-1402.37,35.59,361,59,"Posto de Gasolina",0.5 },
	-- { 2577.61,361.17,110.16,361,59,"Posto de Gasolina",0.5 },
	-- { 616.09,263.0,106.07,361,59,"Posto de Gasolina",0.5 },
	-- { -1435.49,-277.6,48.12,361,59,"Posto de Gasolina",0.5 },
	-- { -2100.72,-316.24,14.86,361,59,"Posto de Gasolina",0.5 },
	-- { 260.76,-1260.06,30.77,361,59,"Posto de Gasolina",0.5 },
	-- { 176.91,-1561.93,29.98,361,59,"Posto de Gasolina",0.5 },
	-- { -320.34,-1472.32,31.68,361,59,"Posto de Gasolina",0.5 },
	-- { -527.84,-1210.72,18.74,361,59,"Posto de Gasolina",0.5 },
	-- { -68.18,-2528.72,7.51,361,59,"Posto de Gasolina",0.5 },
	-- { -1800.64,802.77,140.09,361,59,"Posto de Gasolina",0.5 },
	-- { -2555.92,2330.38,34.98,361,59,"Posto de Gasolina",0.5 },
	-- { 175.03,6601.59,34.73,361,59,"Posto de Gasolina",0.5 },
	-- { 1702.87,6417.46,34.68,361,59,"Posto de Gasolina",0.5 },
	-- { 2002.25,3771.46,33.3,361,59,"Posto de Gasolina",0.5 },
	-- { 1787.68,3330.76,44.2,361,59,"Posto de Gasolina",0.5 },
	-- { 2678.77,3265.82,55.23,361,59,"Posto de Gasolina",0.5 },
	-- { 2540.73,2594.08,39.66,361,59,"Posto de Gasolina",0.5 },
	
	{ 25.68,-1346.6,29.5,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ 2556.47,382.05,108.63,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ 1163.55,-323.02,69.21,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ -707.31,-913.75,19.22,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ -47.72,-1757.23,29.43,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ 373.89,326.86,103.57,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ -3242.95,1001.28,12.84,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ 1729.3,6415.48,35.04,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ 548.0,2670.35,42.16,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ 1960.69,3741.34,32.35,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ 2677.92,3280.85,55.25,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ 1698.5,4924.09,42.07,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ -1820.82,793.21,138.12,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ 1393.21,3605.26,34.99,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ -2967.78,390.92,15.05,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ -3040.14,585.44,7.91,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ 1135.56,-982.24,46.42,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ 1166.0,2709.45,38.16,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ -1487.21,-378.99,40.17,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ -1222.76,-907.21,12.33,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ 161.19,6642.24,31.69,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ 291.99,-1272.61,29.52,52,36,"LOJA DE DEPARTAMENTO",0.5 },
	{ 225.96,-903.92,30.73,52,36,"LOJA DE DEPARTAMENTO",0.5 },                    ---- Praça
	{ 1692.62,3759.50,34.70,76,6,"LOJA DE ARMAS",0.4 },
	{ 252.89,-49.25,69.94,76,6,"LOJA DE ARMAS",0.4 },
	{ 843.28,-1034.02,28.19,76,6,"LOJA DE ARMAS",0.4 },
	{ -331.35,6083.45,31.45,76,6,"LOJA DE ARMAS",0.4 },
	{ -663.15,-934.92,21.82,76,6,"LOJA DE ARMAS",0.4 },
	{ -1305.18,-393.48,36.69,76,6,"LOJA DE ARMAS",0.4 },
	{ -1118.80,2698.22,18.55,76,6,"LOJA DE ARMAS",0.4 },
	{ 2568.83,293.89,108.73,76,6,"LOJA DE ARMAS",0.4 },
	{ -3172.68,1087.10,20.83,76,6,"LOJA DE ARMAS",0.4 },
	{ 21.32,-1106.44,29.79,76,6,"LOJA DE ARMAS",0.4 },
	{ 811.19,-2157.67,29.61,76,6,"LOJA DE ARMAS",0.4 },
	{ 226.46,212.21,105.55,272,2,"BANCO CENTRAL",0.8 },--
	{ 315.86,-274.03,53.92,272,2,"BANCO",0.8 },--
	{ 151.23,-1036.77,29.34,272,2,"BANCO",0.8 },--
	{ -349.87,-45.42,49.03,272,2,"BANCO",0.8 },--
	{ -1215.03,-326.71,37.66,272,2,"BANCO",0.8 },--
	{ -2965.97,483.45,15.69,272,2,"BANCO",0.8 },
	{ 1176.1,2705.93,38.1,272,2,"BANCO",0.8 },
	{ -108.76,6465.79,31.63,272,2,"BANCO",0.8 },
	{ -632.18,-238.36,38.08,617,62,"JOALHERIA",0.5 },
	{ -815.12,-184.15,37.57,71,62,"BARBEARIA",0.5 },
	{ 138.13,-1706.46,29.3,71,62,"BARBEARIA",0.5 },
	{ -1280.92,-1117.07,7.0,71,62,"BARBEARIA",0.5 },
	{ 1930.54,3732.06,32.85,71,62,"BARBEARIA",0.5 },
	{ 1214.2,-473.18,66.21,71,62,"BARBEARIA",0.5 },
	{ -33.61,-154.52,57.08,71,62,"BARBEARIA",0.5 },
	{ -276.65,6226.76,31.7,71,62,"BARBEARIA",0.5 },
	{ 75.35,-1392.92,29.38,366,62,"LOJA DE ROUPAS",0.5 },
	{ -710.15,-152.36,37.42,366,62,"LOJA DE ROUPAS",0.5 },
	{ -163.73,-303.62,39.74,366,62,"LOJA DE ROUPAS",0.5 },
	{ -822.38,-1073.52,11.33,366,62,"LOJA DE ROUPAS",0.5 },
	{ -1193.13,-767.93,17.32,366,62,"LOJA DE ROUPAS",0.5 },
	{ -1449.83,-237.01,49.82,366,62,"LOJA DE ROUPAS",0.5 },
	{ 4.83,6512.44,31.88,366,62,"LOJA DE ROUPAS",0.5 },
	{ 1693.95,4822.78,42.07,366,62,"LOJA DE ROUPAS",0.5 },
	{ 125.82,-223.82,54.56,366,62,"LOJA DE ROUPAS",0.5 },
	{ 614.2,2762.83,42.09,366,62,"LOJA DE ROUPAS",0.5 },
	{ 1196.72,2710.26,38.23,366,62,"LOJA DE ROUPAS",0.5 },
	{ -3170.53,1043.68,20.87,366,62,"LOJA DE ROUPAS",0.5 },
	{ -1101.42,2710.63,19.11,366,62,"LOJA DE ROUPAS",0.5 },
	{ -803.24,-597.69,30.26,366,62,"LOJA DE ROUPAS",0.5 },
	{ 425.6,-806.25,29.5,366,62,"LOJA DE ROUPAS",0.5 },
	{ 1945.39,3773.5,32.27,366,62,"LOJA DE ROUPAS",0.5 },
	{ -1082.22,-247.54,37.77,605,0,"LOJA PREMIUM",0.6 },
	{ 132.6,-1305.06,29.2,93,62,"VANILLA UNICORN",0.5 },
	{ -565.14,271.56,83.02,93,0,"TEQUILA-LA-LA",0.5 },
	{ -172.21,6385.85,31.49,403,5,"FARMÁCIA",0.7 },
	{ 1690.07,3581.68,35.62,403,5,"FARMÁCIA",0.7 },
	{ 315.12,-1068.58,29.39,403,5,"FARMÁCIA",0.7 },
	{ 92.23,-229.72,54.66,403,5,"FARMÁCIA",0.7 },
	{ 46.66,-1749.79,29.64,78,11,"MERCADO CENTRAL",0.5 },
	{ 2747.28,3473.04,55.67,78,11,"MERCADO CENTRAL",0.5 },
	{ 894.39,-2111.32,30.46,402,26,"MECÂNICA",0.8 },
	{ -376.21,-130.73,38.69,402,26,"MECÂNICA",0.8 },
	{ -428.56,-1728.33,19.79,467,11,"RECICLAGEM",0.6 },
	{ -741.56,5594.94,41.66,36,62,"TELEFÉRICO",0.6 },
	{ 454.46,5571.95,781.19,36,62,"TELEFÉRICO",0.6 },
	{ 1322.93,-1652.29,52.27,75,13,"LOJA DE TATUAGEM",0.5 },
	{ -1154.42,-1425.9,4.95,75,13,"LOJA DE TATUAGEM",0.5 },
	{ 322.84,180.16,103.58,75,13,"LOJA DE TATUAGEM",0.5 },
	{ -3169.62,1075.8,20.83,75,13,"LOJA DE TATUAGEM",0.5 },
	{ 1864.07,3747.9,33.03,75,13,"LOJA DE TATUAGEM",0.5 },
	{ -293.57,6199.85,31.48,75,13,"LOJA DE TATUAGEM",0.5 },
	{ -1178.2,-880.6,13.92,536,62,"BURGERSHOT",0.5 },
	{ -70.49,-1104.59,26.12,225,3,"CONCESSIONÁRIA",0.6 },
	{ -1264.86,-360.5,36.9,225,3,"CONCESSIONÁRIA",0.6 },
	{ -604.39,-933.23,23.86,184,62,"WEAZEL NEWS",0.6 },
	{ -772.69,312.77,85.7,475,11,"HOTEL",0.5 },
	{ 1142.33,2663.9,38.16,475,11,"HOTEL",0.5 },
	{ -1566.25,203.66,60.14,475,62,"ESCOLA",0.5 },
	{ 562.36,2741.56,42.87,273,11,"ANIMAL PARK",0.5 },
	{ -1826.29,-1194.73,19.44,93,62,"PEARLS SEAFOOD",0.6 },
	{ -141.28,-258.93,43.64,537,62,"CHICKEN",0.5 },
	{ -535.04,-221.34,37.64,267,5,"PREFEITURA",0.5 },
	{ 302.02,-904.1,29.28,647,18,"CYBER-BAR",0.6 },
	{ -1688.45,-215.14,57.54,305,62,"CEMITÉRIO",0.6 },
	{ 210.62,-945.38,30.68,567,18,"PAINTBALL",0.6 },
	{ -492.89,-220.68,36.51,197,60,"YOGA",0.6 },
	{ -157.04,-2140.43,15.84,646,3,"KART",0.6 },
	{ -1607.94,-991.67,13.08,93,36,"BAR E BILHAR",0.6 },
	{ 967.26,-2187.63,30.04,463,45,"AÇOUGUE",0.8 },

    -- EMPREGOS LEGAIS
	{ 409.69,-1637.61,29.28,357,3,"👨🏻‍🔧 REBOQUE E APREENSÃO",0.6 },
	{ 1724.84,3715.31,34.22,357,3,"👨🏻‍🔧 REBOQUE E APREENSÃO",0.6 },
	{ -273.96,6121.63,31.41,357,3,"👨🏻‍🔧 REBOQUE E APREENSÃO",0.6 },
	{ 1525.07,3784.92,34.49,68,62,"👨🏻‍🔧 MERGULHADOR E PESCA",0.6 },
	{ 2442.28,4763.19,34.31,685,62,"👨🏻‍🔧 LEITEIRO",0.6 },
	{ 1050.77,-1958.67,31.02,527,62,"👨🏻‍🔧 MINERADOR",0.6 },
    { 161.5,-2946.51,6.0,616,62,"👨🏻‍🔧 ENTREGADOR",0.6 },
	{ -350.43,-1558.91,25.22,318,62,"👨🏻‍🔧 LIXEIRO",0.6 },
	{ 452.99,-607.74,28.59,513,62,"👨🏻‍🔧 MOTORISTA",0.5 },
	{ 356.42,274.61,103.14,67,62,"👨🏻‍🔧 TRANSPORTADOR",0.5 },
	{ -840.21,5399.25,34.61,285,62,"👨🏻‍🔧 LENHADOR",0.5 },
	{ 405.92,6526.12,27.73,89,62,"👨🏻‍🔧 COLHEITA",0.4 },
	{ 2301.09,5064.78,45.81,76,62,"👨🏻‍🔧 AGRICULTOR",0.4 },
	{ 919.38,-182.83,74.02,198,62,"👨🏻‍🔧 TAXISTA",0.5 },
	{ 1696.19,4785.25,42.02,198,62,"👨🏻‍🔧 TAXISTA",0.5 },
	{ -680.9,5832.41,17.32,141,62,"👨🏻‍🔧 CAÇADOR",0.7 },
	{ 1240.58,-3257.32,6.91,477,62,"👨🏻‍🔧 CAMINHONEIRO",0.6 },
	{ -1349.16,142.16,56.26,280,62,"👨🏻‍🔧 JARDINEIRO",0.7 },
	{ -1121.2,-2843.47,14.46,43,62,"👨🏻‍🔧 TÁXI-AÉREO",0.7 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for _,v in pairs(blips) do
		local blip = AddBlipForCoord(v[1],v[2],v[3])
		SetBlipSprite(blip,v[4])
		SetBlipAsShortRange(blip,true)
		SetBlipColour(blip,v[5])
		SetBlipScale(blip,v[7])
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v[6])
		EndTextCommandSetBlipName(blip)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ALPHAS
-----------------------------------------------------------------------------------------------------------------------------------------
--[[local alphas = {
	{ 156.44,-1065.79,30.04,10,66 },
	{ -1188.13,-1574.47,4.35,10,66 },
	{ -777.44,5593.64,33.63,10,66 },
	{ 435.06,-647.39,28.73,10,66 },
	{ -896.38,-779.06,15.91,10,66 },
	{ -1668.56,-998.63,7.38,10,66 },
	{ 102.53,-1957.14,20.74,10,66 },
	{ -161.23,-1623.57,33.65,10,66 },
	{ 337.84,-2036.2,21.37,10,66 },
	{ 524.05,-1829.38,28.43,10,66 },
	{ 232.37,-1756.87,29.0,10,66 },
	{ 143.91,6653.49,31.53,10,66 },
	{ 1703.32,4820.19,41.97,10,66 },
	{ 958.53,3618.86,32.67,10,66 },
	{ 1032.52,2656.05,39.55,10,66 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADALPHA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for _,v in pairs(alphas) do
		local blip = AddBlipForRadius(v[1],v[2],v[3],v[4] + 0.0)
		SetBlipAlpha(blip,255)
		SetBlipColour(blip,v[5])
	end
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISPATCH
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for i = 1,25 do
		EnableDispatchService(i,false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		InvalidateIdleCam()
		InvalidateVehicleIdleCam()

		SetCreateRandomCops(false)
		CancelCurrentPoliceReport()
		SetCreateRandomCopsOnScenarios(false)
		SetCreateRandomCopsNotOnScenarios(false)

		SetVehicleModelIsSuppressed(GetHashKey("jet"),true)
		SetVehicleModelIsSuppressed(GetHashKey("besra"),true)
		SetVehicleModelIsSuppressed(GetHashKey("luxor"),true)
		SetVehicleModelIsSuppressed(GetHashKey("blimp"),true)
		SetVehicleModelIsSuppressed(GetHashKey("polmav"),true)
		SetVehicleModelIsSuppressed(GetHashKey("buzzard2"),true)
		SetVehicleModelIsSuppressed(GetHashKey("mammatus"),true)
		SetPedModelIsSuppressed(GetHashKey("s_m_y_prismuscl_01"),true)
		SetPedModelIsSuppressed(GetHashKey("u_m_y_prisoner_01"),true)
		SetPedModelIsSuppressed(GetHashKey("s_m_y_prisoner_01"),true)

		Citizen.Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		SetWeaponDamageModifierThisFrame("WEAPON_BAT",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_HAMMER",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_WRENCH",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_UNARMED",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_HATCHET",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_CROWBAR",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_MACHETE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_POOLCUE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_KNUCKLE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_GOLFCLUB",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_BATTLEAXE",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_FLASHLIGHT",0.25)
		SetWeaponDamageModifierThisFrame("WEAPON_NIGHTSTICK",0.35)
		SetWeaponDamageModifierThisFrame("WEAPON_STONE_HATCHET",0.25)

		RemoveAllPickupsOfType("PICKUP_WEAPON_KNIFE")
		RemoveAllPickupsOfType("PICKUP_WEAPON_PISTOL")
		RemoveAllPickupsOfType("PICKUP_WEAPON_MINISMG")
		RemoveAllPickupsOfType("PICKUP_WEAPON_MICROSMG")
		RemoveAllPickupsOfType("PICKUP_WEAPON_PUMPSHOTGUN")
		RemoveAllPickupsOfType("PICKUP_WEAPON_CARBINERIFLE")
		RemoveAllPickupsOfType("PICKUP_WEAPON_SAWNOFFSHOTGUN")

		DisablePlayerVehicleRewards(PlayerId())

		HideHudComponentThisFrame(1)
		HideHudComponentThisFrame(3)
		HideHudComponentThisFrame(4)
		HideHudComponentThisFrame(5)
		HideHudComponentThisFrame(6)
		HideHudComponentThisFrame(7)
		HideHudComponentThisFrame(8)
		HideHudComponentThisFrame(9)
		HideHudComponentThisFrame(10)
		HideHudComponentThisFrame(11)
		HideHudComponentThisFrame(12)
		HideHudComponentThisFrame(13)
		HideHudComponentThisFrame(15)
		HideHudComponentThisFrame(17)
		HideHudComponentThisFrame(18)
		HideHudComponentThisFrame(21)
		HideHudComponentThisFrame(22)

		DisableControlAction(1,37,true)
		DisableControlAction(1,204,true)
		DisableControlAction(1,211,true)
		DisableControlAction(1,349,true)
		DisableControlAction(1,192,true)
		DisableControlAction(1,157,true)
		DisableControlAction(1,158,true)
		DisableControlAction(1,159,true)
		DisableControlAction(1,160,true)
		DisableControlAction(1,161,true)
		DisableControlAction(1,162,true)
		DisableControlAction(1,163,true)
		DisableControlAction(1,164,true)
		DisableControlAction(1,165,true)

		SetRandomVehicleDensityMultiplierThisFrame(0.5)
		SetVehicleDensityMultiplierThisFrame(0.5)
		SetGarbageTrucks(false)
		SetRandomBoats(false)

		if IsPedArmed(PlayerPedId(),6) then
			DisableControlAction(1,140,true)
			DisableControlAction(1,141,true)
			DisableControlAction(1,142,true)
		end

		Citizen.Wait(1)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- IPLOADER
-----------------------------------------------------------------------------------------------------------------------------------------
local ipList = {
	{
		props = {
			"swap_clean_apt",
			"layer_debra_pic",
			"layer_whiskey",
			"swap_sofa_A"
		},
		coords = { -1150.70,-1520.70,10.60 }
	},{
		props = {
			"csr_beforeMission",
			"csr_inMission"
		},
		coords = { -47.10,-1115.30,26.50 }
	},{
		props = {
			"V_Michael_bed_tidy",
			"V_Michael_M_items",
			"V_Michael_D_items",
			"V_Michael_S_items",
			"V_Michael_L_Items"
		},
		coords = { -802.30,175.00,72.80 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADIPLOADER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for _k,_v in pairs(ipList) do
		local interiorCoords = GetInteriorAtCoords(_v["coords"][1],_v["coords"][2],_v["coords"][3])
		LoadInterior(interiorCoords)

		if _v["props"] ~= nil then
			for k,v in pairs(_v["props"]) do
				EnableInteriorProp(interiorCoords,v)
				Citizen.Wait(1)
			end
		end

		RefreshInterior(interiorCoords)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
local teleport = {
	{ -70.85,-801.07,44.23,-67.38,-821.8,321.29 },
	{ -67.38,-821.8,321.29,-70.85,-801.07,44.23 },

	{ -66.98,-802.56,44.23,-67.38,-821.8,321.29 },
	{ -67.38,-821.8,321.29,-66.98,-802.56,44.23},

	{ -741.07,5593.13,41.66,446.19,5568.79,781.19 },
	{ 446.19,5568.79,781.19,-741.07,5593.13,41.66 },

	{ -801.37,-1251.58,7.33,-773.92,-1207.13,51.14 },
	{ -773.92,-1207.13,51.14,-801.37,-1251.58,7.33 },

	{ 935.83,46.84,81.1,1089.74,206.35,-49.0 },
	{ 1089.74,206.35,-49.0,935.83,46.84,81.1 },

	{ -740.78,5597.04,41.66,446.37,5575.02,781.19 },
	{ 446.37,5575.02,781.19,-740.78,5597.04,41.66 }
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- MARKERMECHANIC_CUF1
-----------------------------------------------------------------------------------------------------------------------------------------

location1 = {x= -801.15, y=-1251.5 ,z = 7.33-0.97}
 
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
 
    local pedCoords = GetEntityCoords(PlayerPedId())
    local distance = GetDistanceBetweenCoords(pedCoords.x,pedCoords.y,pedCoords.z,location1.x,location1.y,location1.z)
 
 
    if(distance < 25)then
      DrawMarker(27, location1.x, location1.y, location1.z, 0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0,150,50,100,0,0,0,0)
    end
  end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- MARKERMECHANIC_CUF2
-----------------------------------------------------------------------------------------------------------------------------------------

location2 = {x= -773.76, y=-1207.29 ,z = 51.14-0.97}
 
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
 
    local pedCoords = GetEntityCoords(PlayerPedId())
    local distance = GetDistanceBetweenCoords(pedCoords.x,pedCoords.y,pedCoords.z,location2.x,location2.y,location2.z)
 
 
    if(distance < 25)then
      DrawMarker(27, location2.x, location2.y, location2.z, 0.0,0.0,0.0,0.0,0.0,1.0,1.0,1.0,0.0,0,150,50,100,0,0,0,0)
    end
  end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHOVERFY
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	local innerTable = {}

	for k,v in pairs(teleport) do
		table.insert(innerTable,{ v[1],v[2],v[3],1,"E","Porta de Acesso","Pressione para acessar" })
	end

	TriggerEvent("hoverfy:insertTable",innerTable)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			for _,v in pairs(teleport) do
				local distance = #(coords - vector3(v[1],v[2],v[3]))
				if distance <= 1 then
					timeDistance = 1

					if IsControlJustPressed(1,38) then
						SetEntityCoords(ped,v[4],v[5],v[6],1,0,0,0)
					end
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)

			local distance = #(coords - vector3(254.01,225.21,101.87))
			if distance <= 3.0 then
				timeDistance = 1

				if IsControlJustPressed(1,38) then
					local handle,object = FindFirstObject()
					local finished = false

					repeat
						local heading = GetEntityHeading(object)
						local coordsObj = GetEntityCoords(object)
						local distanceObjs = #(coordsObj - coords)

						if distanceObjs < 3.0 and GetEntityModel(object) == 961976194 then
							if heading > 150.0 then
								SetEntityHeading(object,0.0)
							else
								SetEntityHeading(object,160.0)
							end

							FreezeEntityPosition(object,true)
							finished = true
						end

						finished,object = FindNextObject(handle)
					until not finished

					EndFindObject(handle)
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHOVERFY
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	TriggerEvent("hoverfy:insertTable",{{ 254.01,225.21,101.87,1.5,"E","Porta do Cofre","Pressione para abrir/fechar" }})
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUNNYHOP
-----------------------------------------------------------------------------------------------------------------------------------------
local bunnyHope = GetGameTimer()
Citizen.CreateThread(function()
	while true do
		local timeDistance = 999
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			if GetGameTimer() <= bunnyHope then
				timeDistance = 1
				DisableControlAction(1,22,true)
			else
				if IsPedJumping(ped) then
					bunnyHope = GetGameTimer() + 5000
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHCAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
local fov_max = 80.0
local fov_min = 10.0
local speed_ud = 3.0
local zoomspeed = 2.0
local vehCamera = false
local fov = (fov_max + fov_min) * 0.5
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADCAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local waitPacket = 500
		local ped = PlayerPedId()
		if IsPedInAnyHeli(ped) then
			waitPacket = 4

			local veh = GetVehiclePedIsUsing(ped)
			SetVehicleRadioEnabled(veh,false)

			if IsControlJustPressed(1,51) then
				TriggerEvent("hud:Active",false)
				vehCamera = true
			end

			if IsControlJustPressed(1,154) then
				if GetPedInVehicleSeat(veh,1) == ped or GetPedInVehicleSeat(veh,2) == ped then
					TaskRappelFromHeli(ped,1)
				end
			end

			if vehCamera then
				SetTimecycleModifierStrength(0.3)
				SetTimecycleModifier("heliGunCam")

				local scaleform = RequestScaleformMovie("HELI_CAM")
				while not HasScaleformMovieLoaded(scaleform) do
					Citizen.Wait(1)
				end

				local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA",true)
				AttachCamToEntity(cam,veh,0.0,0.0,-1.5,true)
				SetCamRot(cam,0.0,0.0,GetEntityHeading(veh))
				SetCamFov(cam,fov)
				RenderScriptCams(true,false,0,1,0)
				PushScaleformMovieFunction(scaleform,"SET_CAM_LOGO")
				PushScaleformMovieFunctionParameterInt(0)
				PopScaleformMovieFunctionVoid()

				while vehCamera do
					if IsControlJustPressed(1,51) then
						TriggerEvent("hud:Active",true)
						vehCamera = false
					end

					local zoomvalue = (1.0 / (fov_max - fov_min)) * (fov - fov_min)
					CheckInputRotation(cam,zoomvalue)
					HandleZoom(cam)
					HideHudAndRadarThisFrame()
					HideHudComponentThisFrame(19)
					PushScaleformMovieFunction(scaleform,"SET_ALT_FOV_HEADING")
					PushScaleformMovieFunctionParameterFloat(GetEntityCoords(veh).z)
					PushScaleformMovieFunctionParameterFloat(zoomvalue)
					PushScaleformMovieFunctionParameterFloat(GetCamRot(cam,2).z)
					PopScaleformMovieFunctionVoid()
					DrawScaleformMovieFullscreen(scaleform,255,255,255,255)

					Citizen.Wait(1)
				end

				ClearTimecycleModifier()
				fov = (fov_max + fov_min) * 0.5
				RenderScriptCams(false,false,0,1,0)
				SetScaleformMovieAsNoLongerNeeded(scaleform)
				DestroyCam(cam,false)
				SetNightvision(false)
				SetSeethrough(false)
			end
		end

		Citizen.Wait(waitPacket)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKINPUTROTATION
-----------------------------------------------------------------------------------------------------------------------------------------
function CheckInputRotation(cam,zoomvalue)
	local rightAxisX = GetDisabledControlNormal(0,220)
	local rightAxisY = GetDisabledControlNormal(0,221)
	local rotation = GetCamRot(cam,2)
	if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
		new_z = rotation.z + rightAxisX * -1.0 * (speed_ud) * (zoomvalue + 0.1)
		new_x = math.max(math.min(20.0,rotation.x + rightAxisY * -1.0 * (3.0) * (zoomvalue + 0.1)),-89.5)
		SetCamRot(cam,new_x,0.0,new_z,2)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HANDLEZOOM
-----------------------------------------------------------------------------------------------------------------------------------------
function HandleZoom(cam)
	if IsControlJustPressed(1,241) then
		fov = math.max(fov - zoomspeed,fov_min)
	end

	if IsControlJustPressed(1,242) then
		fov = math.min(fov + zoomspeed,fov_max)
	end

	local current_fov = GetCamFov(cam)
	if math.abs(fov - current_fov) < 0.1 then
		fov = current_fov
	end

	SetCamFov(cam,current_fov + (fov - current_fov) * 0.05)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INVISIBLABLES
-----------------------------------------------------------------------------------------------------------------------------------------
LocalPlayer["state"]["Invisible"] = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHACKER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		if LocalPlayer["state"]["Active"] then
			local ped = PlayerPedId()

			if not IsEntityVisible(ped) and not LocalPlayer["state"]["Invisible"] then
				TriggerServerEvent("admin:Hacker","está invisível")
			end

			if ForceSocialClubUpdate == nil then
				TriggerServerEvent("admin:Hacker","forçou a social club.")
			end

			if ShutdownAndLaunchSinglePlayerGame == nil then
				TriggerServerEvent("admin:Hacker","entrou no modo single player.")
			end

			if ActivateRockstarEditor == nil then
				TriggerServerEvent("admin:Hacker","ativou o rockstar editor.")
			end
		end

		Citizen.Wait(10000)
	end
end)