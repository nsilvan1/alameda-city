local oRP = {}
Tunnel.bindInterface("RKG_Store:Desmanche", oRP)
local vCLIENT = Tunnel.getInterface("RKG_Store:Desmanche")

local vehicle_dismantle = {}

function oRP.CheckPerm(org_name)
	local source = source
	local user_id = vRP.getUserId(source)
	local org_perm = Config_Desmanche[org_name].Permission
	if user_id then
		if vRP.hasGroup(user_id,org_perm) then
			return true
		end
		return false
	end
end

function oRP.checkVehIsDismantled(veh_plate,veh_name)
    local consult = vRP.userPlate(veh_plate)
    if consult.user_id then
        return true
    end
    return false
end

function oRP.setVehicleDismantle(data)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vehicle_dismantle[user_id] then
			vehicle_dismantle[user_id] = { veh = data.veh, veh_plate = data.veh_plate }
		end
	end
end

function oRP.dismantleVehicle(vehicle,veh_plate,veh_name)
	local source = source
    local user_id = vRP.getUserId(source)
    local consult = vRP.userPlate(veh_plate)
    if consult.user_id then
		if vehicle_dismantle[user_id].veh == vehicle and vehicle_dismantle[user_id].veh_plate == veh_plate then
			local identity = vRP.userIdentity(user_id)
			local n_identity = vRP.userIdentity(consult.user_id)

			local price_veh = vehiclePrice(veh_name) / 10 -- Preço que o cara vai receber em dinheiro sujo.
			local price_fines = vehiclePrice(veh_name) / 35 -- Preço da multa que o dono do carro vai receber.

			vRP.giveInventoryItem(user_id,"dollars2",parseInt(price_veh),true)

			TriggerClientEvent("garages:Delete",source)

			if vehicle_dismantle[user_id] then
				vehicle_dismantle[user_id] = nil
			end

			if n_identity then
				vRP.addFines(parseInt(consult.user_id),parseInt(price_fines))
			end
			return true;
		else
			TriggerClientEvent("Notify",source,"vermelho","Veiculo incorreto!",5000)
			return false;
		end
    end
end

function tD(n)
	n = math.ceil(n * 100) / 100
	return n
end