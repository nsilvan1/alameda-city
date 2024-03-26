-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICELIST
-----------------------------------------------------------------------------------------------------------------------------------------
local serviceList = {

    ----- HP

	{ -815.69,-1236.15,7.33,"HPDiretor",1.8,6 },
	{ -815.69,-1236.15,7.33,"HPMedico",1.8,6 },
	{ -815.69,-1236.15,7.33,"HPParamedic",1.8,6 },

    ----- POLICE

	{ 462.08,-986.36,30.72,"PoliceComando",1.8,25 },
	{ 442.42,-979.87,30.68,"PoliceSargento",1.8,25 },
	{ 441.93,-982.10,30.11,"PoliceSoldado",1.8,25 },
	{ 442.49,-984.18,30.68,"PoliceRecruta",1.8,25 },

    ----- BURGERSHOT

	{ -1197.78,-899.53,13.83,"BurgershotLider",1.8,6 },
	{ -1194.05,-900.55,13.83,"BurgershotGerente",1.8,6 },
	{ -1200.88,-894.87,13.83,"BurgershotMembro",1.8,6 },

    ----- MECHANIC	

	{ 887.49,-2100.92,34.88,"MechanicLider",1.8,6 },
	{ 876.35,-2100.96,31.46,"MechanicGerente",1.8,6 },
	{ 894.00,-2133.10,30.46,"MechanicMembro",1.8,6 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTARGET
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for k,v in pairs(serviceList) do
		exports["target"]:AddCircleZone("service:"..v[4],vector3(v[1],v[2],v[3]),0.25,{
			name = "service:"..v[4],
			heading = 3374176
		},{
			shop = k,
			distance = v[5],
			options = {
				{
					label = "Entrar em Serviço",
					event = "service:Toggle",
					tunnel = "shop"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE:TOGGLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("service:Toggle")
AddEventHandler("service:Toggle",function(Service)
	TriggerServerEvent("service:Toggle",serviceList[Service][4],serviceList[Service][6])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE:LABEL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("service:Label")
AddEventHandler("service:Label",function(Service,Text)
	if Service == "Sheriff" then
		exports["target"]:LabelText("service:Sheriff-1",Text)
		exports["target"]:LabelText("service:Sheriff-2",Text)
	elseif Service == "Paramedic" then
		exports["target"]:LabelText("service:HPDiretor",Text)
		exports["target"]:LabelText("service:HPMedico",Text)
		exports["target"]:LabelText("service:HPParamedic",Text)
	elseif Service == "Mechanic" then
		exports["target"]:LabelText("service:MechanicLider",Text)
		exports["target"]:LabelText("service:MechanicGerente",Text)
		exports["target"]:LabelText("service:MechanicMembro",Text)
	elseif Service == "Burgershot" then
		exports["target"]:LabelText("service:BurgershotLider",Text)
		exports["target"]:LabelText("service:BurgershotGerente",Text)
		exports["target"]:LabelText("service:BurgershotMembro",Text)
	else
		exports["target"]:LabelText("service:"..Service,Text)
	end
end)