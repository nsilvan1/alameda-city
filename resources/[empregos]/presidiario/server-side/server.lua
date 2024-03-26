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
Tunnel.bindInterface("corrections",cRP)
vCLIENT = Tunnel.getInterface("corrections")

vRP._prepare(
    "rs_prisioneiro/addTime",
    "INSERT INTO summerz_user_jobs (user_id, prisioneiro) VALUES (@user_id, now())"
)

vRP._prepare(
    "rs_prisioneiro/RemoveTime",
    "DELETE FROM summerz_user_jobs WHERE user_id = @user_id"
)

vRP._prepare(
    "rs_prisioneiro/validTime",
    "select * FROM summerz_user_jobs WHERE curdate() = prisioneiro and user_id  = @user_id"
)

-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	local perm = "Police"
	if user_id then
		return vRP.hasGroup(user_id,perm)
		-- return vRP.hasPermission(user_id,perm)
	else
        TriggerClientEvent("Notify",source,"vermelho","Apenas policiais podem realizar o TRANSPORTE DE PRESIDIÁRIO.",5000)
	end
end

function cRP.paymentService()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.upgradeStress(user_id,1)
		local value = math.random(50000,60000)
		local value2 = math.random(800,850)
		vRP.generateItem(user_id,"dollars",value,true)
		vRP.giveInventoryItem(user_id,"coins",value2,true)
		TriggerClientEvent("sounds:source",source,"coin",0.5)

		if vRP.userPremium(user_id) then
			vRP.generateItem(user_id,"dollars",value * 0.10,true)
		end
	end
end


function cRP.insertDatePrision()
	local source = source
	local user_id = vRP.getUserId(source)
	vRP.query(
		"rs_prisioneiro/addTime",
		{
			user_id = user_id
		})
end

function cRP.validateDatePrision()
	local source = source
	local user_id = vRP.getUserId(source)
	local membros = vRP.query("rs_prisioneiro/validTime", {user_id = user_id})
	for k10, v10 in pairs(membros) do
		return false
	end
	vRP.query(
		"rs_prisioneiro/RemoveTime",
		{
			user_id = user_id
		})
	return true

end