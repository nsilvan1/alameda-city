local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface('vRP')
vRPclient = Tunnel.getInterface("vRP")

Dz = {}
Tunnel.bindInterface("t1ger_truckrobbery", Dz)

local jobCooldown = {} 

RegisterServerEvent('t1ger_truckrobbery:jobCooldown')
AddEventHandler('t1ger_truckrobbery:jobCooldown',function(source)
	local user_id = vRP.getUserId(source)
	table.insert(jobCooldown,{cooldown = user_id, time = (Config.TruckRobbery.cooldown * 60000)}) 
end)

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(1000)
		for k,v in pairs(jobCooldown) do
			if v.time <= 0 then
				RemoveCooldownTimer(v.cooldown)
			else
				v.time = v.time - 1000
			end
		end
	end
end)

 
function Dz.checkPoliceCount()
    local source = source
    local user_id = vRP.getUserId(source)
    local cops = vRP.getUsersByPermission('Police')
	return #cops or 0
end

function Dz.GetCooldownTimer()
	local source = source
	local user_id = vRP.getUserId(source)
	if not CheckCooldownTimer(user_id) then
		return nil
	else
		return GetCooldownTimer(user_id)
	end
end


function Dz.getJobFees()
	local source = source
	local user_id = vRP.getUserId(source)
	local money = 0
	if Config.TruckRobbery.computer.fees.bankMoney then 
		money = vRP.getBankMoney(user_id)
	else
		money = vRP.getMoney(user_id)
	end
	if money >= Config.TruckRobbery.computer.fees.amount then
        return true
    else
        return false
    end
end

function Dz.notiFyPerson(notfy)
	local source = source
	TriggerClientEvent("Notify",source,"amarelo",notfy,5000)
end

function Dz.notiFyError(notfy)
	local source = source
	TriggerClientEvent("Notify",source,"vermelho",notfy,5000)
end

function Dz.verifyItens(type, dropItem)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local consultItem = vRP.getInventoryItemAmount(user_id,type)
		if consultItem[1] > 0  then
			if dropItem then 
			   vRP.removeInventoryItem(user_id,consultItem[2],1,true)
			   vRP.generateItem(user_id,"c4",1,false)
			   return true
			else 
				local consultItemC4 = vRP.getInventoryItemAmount(user_id,'c4')
				if consultItemC4[1] > 0  then
					vRP.removeInventoryItem(user_id,consultItem[2],1,true)
					return true
				end 
			end 
			
		end
	end
	TriggerClientEvent("Notify",source,"amarelo","Necessário possuir:<br>1x<b> Pendrive de Ouro</b><br>1x <b>C4</b>" ,5000)
	return false
end

function Dz.verifyItensExplose(type)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local consultItem = vRP.getInventoryItemAmount(user_id,type)
		if consultItem[1] > 0  then
			vRP.removeInventoryItem(user_id,consultItem[2],1,true)
			return true
		end
	end
	TriggerClientEvent("Notify",source,"amarelo","Necessário possuir <b>1x C4</b>." ,5000)
	return false
	
end

RegisterServerEvent('policeAlert')
AddEventHandler('policeAlert', function(coords)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local policia = vRP.getUsersByPermission('Police')
        if #policia > 0 then
            for k,v in pairs(policia) do
                local nsource = vRP.getUserSource(parseInt(v))
                if nsource then
                    async(function()
                        async(function()
                            vRPclient._playSound(nsource,"CONFIRM_BEEP","HUD_MINI_GAME_SOUNDSET")
                            TriggerClientEvent("AdicionarCDS:truck",nsource,coords.x,coords.y,coords.z)
						end)
                    end)
                end
            end
        end
    end
end)

RegisterServerEvent('t1ger_truckrobbery:startJobSV')
AddEventHandler('t1ger_truckrobbery:startJobSV', function()
	local source = source
	local user_id = vRP.getUserId(source)
	vRP.upgradeStress(user_id,10)
	TriggerEvent('t1ger_truckrobbery:jobCooldown', source)
	if Config.TruckRobbery.computer.fees.bankMoney then  
		vRP.tryFullPayment(user_id,Config.TruckRobbery.computer.fees.amount)
	else
		vRP.tryPayment(user_id,Config.TruckRobbery.computer.fees.amount)
	end
	TriggerClientEvent('t1ger_truckrobbery:startJobCL', source)
end)


RegisterServerEvent('t1ger_truckrobbery:jobReward')
AddEventHandler('t1ger_truckrobbery:jobReward',function()
	local source = source
	local cfg = Config.TruckRobbery.reward
	local user_id = vRP.getUserId(source)
	local reward = math.random(cfg.money.min, cfg.money.max)
	
	if cfg.money.dirty then 
		vRP.giveInventoryItem(vRP.getUserId(source),'dollars2', tonumber(reward))
	else
		vRP.giveMoney(user_id,reward)
	end
	TriggerClientEvent("Notify",source,"verde",(Lang['reward_notify']:format(reward)),5000)
	
	if cfg.items.enable then
		for k,v in pairs(cfg.items.list) do
			if math.random(0,100) <= v.chance then 
				local amount = math.random(v.min, v.max)
				local name = tostring(v.item)
				vRP.giveInventoryItem(vRP.getUserId(source),v.item, tonumber(amount))
				TriggerClientEvent("Notify",source,"verde",(Lang['you_received_item']:format(amount,name)),5000)
			end
		end
	end
end)


RegisterServerEvent('t1ger_truckrobbery:PoliceNotifySV')
AddEventHandler('t1ger_truckrobbery:PoliceNotifySV', function(targetCoords, streetName)
	local source = source
	local ped = GetPlayerPed(source)
	local coords = GetEntityCoords(ped)
	local textNotify = ""

	if not sellDrugs then
		textNotify = "Assalto ao Carro Forte."
	end

	local policeResult = vRP.numPermission("Police")
	for k,v in pairs(policeResult) do
		async(function()
			TriggerClientEvent("NotifyPush",v,{ code = "QTH", title = textNotify, x = coords["x"], y = coords["y"], z = coords["z"], time = "Recebido às "..os.date("%H:%M"), blipColor = 5 })
		end)
	end
end)


RegisterServerEvent('t1ger_truckrobbery:SyncDataSV')
AddEventHandler('t1ger_truckrobbery:SyncDataSV',function(data)
    TriggerClientEvent('t1ger_truckrobbery:SyncDataCL', -1, data)
end)


function RemoveCooldownTimer(source)
    for k,v in pairs(jobCooldown) do
        if v.cooldown == source then
            table.remove(jobCooldown,k)
        end
    end
end
function GetCooldownTimer(source)
    for k,v in pairs(jobCooldown) do
        if v.cooldown == source then
            return math.ceil(v.time/60000)
        end
    end
end
function CheckCooldownTimer(source)
    for k,v in pairs(jobCooldown) do
        if v.cooldown == source then
            return true
        end
    end
    return false
end