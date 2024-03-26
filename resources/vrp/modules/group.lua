-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local permList = {}
local selfReturn = {}
permList["Taxi"] = {}
permList["Emergency"] = {}

permList["Paramedic"] = {}
permList["HPDiretor"] = {}
permList["HPMedico"] = {}
permList["HPParamedic"] = {}

permList["Police"] = {}
permList["PoliceComando"] = {}
permList["PoliceSargento"] = {}
permList["PoliceSoldado"] = {}
permList["PoliceRecruta"] = {}

permList["Mechanic"] = {}
permList["MechanicLider"] = {}
permList["MechanicGerente"] = {}
permList["MechanicMembro"] = {}

permList["Burgershot"] = {}
permList["BurgershotLider"] = {}
permList["BurgershotGerente"] = {}
permList["BurgershotMembro"] = {}

permList["Ballas"] = {}
permList["Bunker"] = {}
permList["Vagos"] = {}
permList["Yakuza"] = {}
permList["Motoclub"] = {}
permList["Mafiavinhedo"] = {}
permList["Yakuza"] = {}
permList["Obey"] = {}

-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSIONS
-----------------------------------------------------------------------------------------------------------------------------------------
local permissions = {

    --||ADMIN    =================================================	

	["AdminCeo"] = {
		["AdminCeo"] = true
	},
	["Admin"] = {
		["Admin"] = true,
		["AdminCeo"] = true
	},
	["Suporte"] = {
		["Admin"] = true,
		["Suporte"] = true
	},
	["Moderator"] = {
		["Admin"] = true,
		["Moderator"] = true
	},

    --||POLICE    =================================================	

	["Police"] = {
		["PoliceComando"] = true,
		["PoliceSargento"] = true,
		["PoliceSoldado"] = true,
		["PoliceRecruta"] = true,
		["Sheriff"] = true,
	},
	["PoliceComando"] = {
		["PoliceComando"] = true
	},
	["PoliceSargento"] = {
		["PoliceSargento"] = true
	},
	["PoliceSoldado"] = {
		["PoliceSoldado"] = true
	},
	["PoliceRecruta"] = {
		["PoliceRecruta"] = true
	},
	["Sheriff"] = {
		["Sheriff"] = true
	},

    --||HOSPITAL  ==========================================

	["Paramedic"] = {
		["HPDiretor"] = true,
		["HPMedico"] = true,
		["HPParamedic"] = true,
	},
	["HPDiretor"] = {
		["HPDiretor"] = true
	},
	["HPMedico"] = {
		["HPMedico"] = true
	},
	["HPParamedic"] = {
		["HPParamedic"] = true
	},

	--||EMERGENCIA  ==========================================

	["Emergency"] = {
		["PoliceComando"] = true,
		["PoliceSargento"] = true,
		["PoliceSoldado"] = true,
		["PoliceRecruta"] = true,
		["Sheriff"] = true,
		["HPDiretor"] = true,
		["HPMedico"] = true,
		["HPParamedic"] = true,
	},

	--||MECANICO  ==========================================	

	["Mechanic"] = {
		["MechanicLider"] = true,
		["MechanicGerente"] = true,
		["MechanicMembro"] = true,
	},
	["MechanicLider"] = {
		["MechanicLider"] = true
	},
	["MechanicGerente"] = {
		["MechanicGerente"] = true
	},
	["MechanicMembro"] = {
		["MechanicMembro"] = true
	},

    --||BURGERSHOT    =================================================

	["Burgershot"] = {
		["BurgershotLider"] = true,
		["BurgershotGerente"] = true,
		["BurgershotMembro"] = true,
	},
	["BurgershotLider"] = {
		["BurgershotLider"] = true
	},
	["BurgershotGerente"] = {
		["BurgershotGerente"] = true
	},
	["BurgershotMembro"] = {
		["BurgershotMembro"] = true
	},

	--||MOTOCLUB  ==========================================

	["Motoclub"] = {
		["MotoclubLider"] = true,
		["MotoclubGerente"] = true,
		["MotoclubMembro"] = true
	},
	["MotoclubLider"] = {
		["MotoclubLider"] = true
	},
	["MotoclubGerente"] = {
		["MotoclubGerente"] = true
	},
	["MotoclubMembro"] = {
		["MotoclubMembro"] = true
	},

	--||YAKUZA    ==========================================

	["Yakuza"] = {
		["YakuzaLider"] = true,
		["YakuzaGerente"] = true,
		["YakuzaMembro"] = true
	},
	["YakuzaLider"] = {
		["YakuzaLider"] = true
	},
	["YakuzaGerente"] = {
		["YakuzaGerente"] = true
	},
	["YakuzaMembro"] = {
		["YakuzaMembro"] = true
	},

	--||CRIPS    ==========================================

	["Crips"] = {
		["CripsLider"] = true,
		["CripsGerente"] = true,		
		["CripsMembro"] = true
	},
	["CripsLider"] = {
		["CripsLider"] = true
	},
	["CripsGerente"] = {
		["CripsGerente"] = true
	},
	["CripsMembro"] = {
		["CripsMembro"] = true
	},

    --||CHICKEN    ==========================================

	["Chicken"] = {
		["ChickenLider"] = true,
		["ChickenGerente"] = true,
		["ChickenMembro"] = true
	},
	["ChickenLider"] = {
		["ChickenLider"] = true
	},
	["ChickenGerente"] = {
		["ChickenGerente"] = true
	},
	["ChickenMembro"] = {
		["ChickenMembro"] = true
	},

    --||VAGOS    ==========================================

	["Vagos"] = {
		["VagosLider"] = true,
		["VagosGerente"] = true,
		["VagosMembro"] = true
	},
	["VagosLider"] = {
		["VagosLider"] = true
	},
	["VagosGerente"] = {
		["VagosGerente"] = true
	},
	["VagosMembro"] = {
		["VagosMembro"] = true
	},

    --||BUNKER    ==========================================

	["Bunker"] = {
		["BunkerLider"] = true,
		["BunkerGerente"] = true,
		["BunkerMembro"] = true
	},
	["BunkerLider"] = {
		["BunkerLider"] = true
	},
	["BunkerGerente"] = {
		["BunkerGerente"] = true
	},
	["BunkerMembro"] = {
		["BunkerMembro"] = true
	},

    --||MAFIA VINHEDO    ==========================================

	["Mafiavinhedo"] = {
		["MafiavinhedoLider"] = true,
		["MafiavinhedoGerente"] = true,
		["MafiavinhedoMembro"] = true
	},
	["MafiavinhedoLider"] = {
		["MafiavinhedoLider"] = true
	},
	["MafiavinhedoGerente"] = {
		["MafiavinhedoGerente"] = true
	},
	["MafiavinhedoMembro"] = {
		["MafiavinhedoMembro"] = true
	},

    --||BALLAS    =================================================

	["Ballas"] = {
		["BallasLider"] = true,
		["BallasGerente"] = true,
		["BalasMembro"] = true
	},
	["BallasLider"] = {
		["BallasLider"] = true
	},
	["BallasGerente"] = {
		["BallasGerente"] = true
	},
	["BalasMembro"] = {
		["BalasMembro"] = true
	},	

    --||OBEY    =================================================

	["Obey"] = {
		["ObeyLider"] = true,
		["ObeyGerente"] = true,
		["ObeyMembro"] = true
	},
	["ObeyLider"] = {
		["ObeyLider"] = true
	},
	["ObeyGerente"] = {
		["ObeyGerente"] = true
	},
	["ObeyMembro"] = {
		["ObeyMembro"] = true
	},

    --||Mansão    =================================================

	["Mansao1"] = {
		["Mansao1"] = true
	},		

    --||OUTROS    =================================================

	["verificado"] = {
		["verificado"] = true
	},
	["Playboy"] = {
		["Playboy"] = true
	},	
	["Streamer"] = {
		["Streamer"] = true
	},	
	["Foods"] = {
		["PopsDiner"] = true,
		["BurgerShot"] = true,
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.hasPermission(user_id,perm)
	local perm = tostring(perm)
	local dataTable = vRP.getDatatable(user_id)

	if dataTable then
		if dataTable["perm"] then
			if dataTable["perm"][perm] then
				return true
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.setPermission(user_id,perm)
	local perm = tostring(perm)
	local dataTable = vRP.getDatatable(user_id)

	if dataTable then
		if dataTable["perm"] == nil then
			dataTable["perm"] = {}
		end

		if dataTable["perm"][perm] == nil then
			dataTable["perm"][perm] = true
		end
	else
		local userTables = vRP.userData(user_id,"Datatable")

		if userTables["inventory"] then
			if userTables["perm"] == nil then
				userTables["perm"] = {}
			end

			if userTables["perm"][perm] == nil then
				userTables["perm"][perm] = true
			end

			vRP.execute("playerdata/setUserdata",{ user_id = user_id, key = "Datatable", value = json.encode(userTables) })
		end
	end
end

function vRP.getPermission(user_id)
     return	vRP.execute("playerdata/getGroup",{ user_id = user_id, key = "Datatable", value = json.encode(userTables) })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEANPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.cleanPermission(user_id)
	local dataTable = vRP.getDatatable(user_id)

	if dataTable then
		if dataTable["perm"] then
			dataTable["perm"] = {}
		end
	else
		local userTables = vRP.userData(user_id,"Datatable")

		if userTables["inventory"] then
			if userTables["perm"] then
				userTables["perm"] = {}
				vRP.execute("playerdata/setUserdata",{ user_id = user_id, key = "Datatable", value = json.encode(userTables) })
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.remPermission(user_id,perm)
	local perm = tostring(perm)
	local dataTable = vRP.getDatatable(user_id)

	if dataTable then
		if dataTable["perm"] then
			if dataTable["perm"][perm] then
				dataTable["perm"][perm] = nil
			end
		end
	else
		local userTables = vRP.userData(user_id,"Datatable")

		if userTables["inventory"] then
			if userTables["perm"] then
				if userTables["perm"][perm] then
					userTables["perm"][perm] = nil
					vRP.execute("playerdata/setUserdata",{ user_id = user_id, key = "Datatable", value = json.encode(userTables) })
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.updatePermission(user_id,perm,new)
	local new = tostring(new)
	local perm = tostring(perm)
	local dataTable = vRP.getDatatable(user_id)

	if dataTable then
		if dataTable["perm"] == nil then
			dataTable["perm"] = {}
		end

		if dataTable["perm"][perm] then
			dataTable["perm"][perm] = nil
		end

		dataTable["perm"][new] = true
	else
		local userTables = vRP.userData(user_id,"Datatable")
		if userTables["inventory"] then
			if userTables["perm"] == nil then
				userTables["perm"] = {}
			end

			if userTables["perm"][perm] then
				userTables["perm"][perm] = nil
			end

			userTables["perm"][new] = true

			vRP.execute("playerdata/setUserdata",{ user_id = user_id, key = "Datatable", value = json.encode(userTables) })
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.hasGroup(user_id,perm)
	local perm = tostring(perm)
	local dataTable = vRP.getDatatable(user_id)

	selfReturn[user_id] = false

	if dataTable then
		if dataTable["perm"] then
			for k,v in pairs(dataTable["perm"]) do
				if permissions[perm][k] then
					selfReturn[user_id] = true
					break
				end
			end
		end
	end

	return selfReturn[user_id]
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NUMPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.numPermission(perm)
	local tableList = {}

	for k,v in pairs(permList[perm]) do
		table.insert(tableList,v)
	end

	return tableList
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INSERTPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.insertPermission(source,user_id,perm)
	if permList[perm] then
		permList[perm][user_id] = source
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.removePermission(user_id,perm)
	if permList[perm][user_id] then
		permList[perm][user_id] = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERDISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("playerDisconnect",function(user_id,source)

	if permList["Police"][user_id] then
		permList["Police"][user_id] = nil
	end

	if permList["Paramedic"][user_id] then
		permList["Paramedic"][user_id] = nil
	end

	if permList["Taxi"][user_id] then
		permList["Taxi"][user_id] = nil
	end

	if permList["Mechanic"][user_id] then
		permList["Mechanic"][user_id] = nil
	end

	if permList["Burgershot"][user_id] then
		permList["Burgershot"][user_id] = nil
	end

	if permList["Ballas"][user_id] then
		permList["Ballas"][user_id] = nil
	end

	if permList["Bunker"][user_id] then
		permList["Bunker"][user_id] = nil
	end

	if permList["Vagos"][user_id] then
		permList["Vagos"][user_id] = nil
	end

	if permList["Yakuza"][user_id] then
		permList["Yakuza"][user_id] = nil
	end

	if permList["Motoclub"][user_id] then
		permList["Motoclub"][user_id] = nil
	end

	if permList["Mafiavinhedo"][user_id] then
		permList["Mafiavinhedo"][user_id] = nil
	end

	if permList["Obey"][user_id] then
		permList["Obey"][user_id] = nil
	end

	if selfReturn[user_id] then
		selfReturn[user_id] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("playerConnect",function(user_id,source)

	if vRP.hasPermission(user_id,"PoliceComando") then
		permList["Police"][user_id] = source
		TriggerClientEvent("vRP:PoliceService",source,true)
		TriggerEvent("blipsystem:serviceEnter",source,"POLICE: PoliceComando",1)
		TriggerClientEvent("service:Label",source,"PoliceComando","Sair de Serviço",5000)
	end

	if vRP.hasPermission(user_id,"PoliceSargento") then
		permList["Police"][user_id] = source
		TriggerClientEvent("vRP:PoliceService",source,true)
		TriggerEvent("blipsystem:serviceEnter",source,"POLICE: PoliceSargento",2)
		TriggerClientEvent("service:Label",source,"PoliceSargento","Sair de Serviço",5000)
	end

	if vRP.hasPermission(user_id,"PoliceSoldado") then
		permList["Police"][user_id] = source
		TriggerClientEvent("vRP:PoliceService",source,true)
		TriggerEvent("blipsystem:serviceEnter",source,"POLICE: PoliceSoldado",3)
		TriggerClientEvent("service:Label",source,"PoliceSoldado","Sair de Serviço",5000)

	end

	if vRP.hasPermission(user_id,"PoliceRecruta") then
		permList["Police"][user_id] = source
		TriggerClientEvent("vRP:PoliceService",source,true)
		TriggerEvent("blipsystem:serviceEnter",source,"POLICE: PoliceRecruta",4)
		TriggerClientEvent("service:Label",source,"PoliceRecruta","Sair de Serviço",5000)
	end

	if vRP.hasPermission(user_id,"HPDiretor") then
		permList["Paramedic"][user_id] = source
		TriggerClientEvent("vRP:ParamedicService",source,true)
		TriggerEvent("blipsystem:serviceEnter",source,"HPDiretor",5)
		TriggerClientEvent("service:Label",source,"HPDiretor","Sair de Serviço",5000)
	end

	if vRP.hasPermission(user_id,"HPMedico") then
		permList["Paramedic"][user_id] = source
		TriggerClientEvent("vRP:ParamedicService",source,true)
		TriggerEvent("blipsystem:serviceEnter",source,"HPMedico",5)
		TriggerClientEvent("service:Label",source,"HPMedico","Sair de Serviço",5000)
	end	

	if vRP.hasPermission(user_id,"HPParamedic") then
		permList["Paramedic"][user_id] = source
		TriggerClientEvent("vRP:ParamedicService",source,true)
		TriggerEvent("blipsystem:serviceEnter",source,"HPParamedic",5)
		TriggerClientEvent("service:Label",source,"HPParamedic","Sair de Serviço",5000)
	end

	if vRP.hasPermission(user_id,"Mechanic") then
		permList["Mechanic"][user_id] = source
		TriggerClientEvent("vRP:MechanicService",source,true)
		TriggerEvent("blipsystem:serviceEnter",source,"Mechanic",6)
		TriggerClientEvent("service:Label",source,"MechanicLider","Sair de Serviço",5000)
		TriggerClientEvent("service:Label",source,"MechanicGerente","Sair de Serviço",5000)
		TriggerClientEvent("service:Label",source,"MechanicMembro","Sair de Serviço",5000)
	end

	if vRP.hasPermission(user_id,"Burgershot") then
		permList["Burgershot"][user_id] = source
		TriggerClientEvent("vRP:BurgershotService",source,true)
		TriggerEvent("blipsystem:serviceEnter",source,"Burgershot",7)
		TriggerClientEvent("service:Label",source,"BurgershotLider","Sair de Serviço",5000)
		TriggerClientEvent("service:Label",source,"BurgershotGerente","Sair de Serviço",5000)
		TriggerClientEvent("service:Label",source,"BurgershotMembro","Sair de Serviço",5000)
	end

	if vRP.hasGroup(user_id,"Ballas") then
		TriggerClientEvent("player:Relationship",source,"Ballas")
	end

	if vRP.hasGroup(user_id,"Bunker") then
		TriggerClientEvent("player:Relationship",source,"Bunker")
	end

	if vRP.hasGroup(user_id,"Vagos") then
		TriggerClientEvent("player:Relationship",source,"Vagos")
	end

	if vRP.hasGroup(user_id,"Motoclub") then
		TriggerClientEvent("player:Relationship",source,"Motoclub")
	end

	if vRP.hasGroup(user_id,"Mafiavinhedo") then
		TriggerClientEvent("player:Relationship",source,"Mafiavinhedo")
	end

	if vRP.hasGroup(user_id,"Yakuza") then
		TriggerClientEvent("player:Relationship",source,"Yakuza")
	end

	if vRP.hasGroup(user_id,"Obey") then
		TriggerClientEvent("player:Relationship",source,"Obey")
	end

end)

function vRP.getUsersByPermission(perm)
    local tableList = {}

    for user_id,source in pairs(vRP.userList()) do
        if vRP.hasGroup(user_id, perm) then
            table.insert(tableList, user_id)
        end
    end

    return tableList
end