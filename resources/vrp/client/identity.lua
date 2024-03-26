-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP:IDENTITY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vRP:Identity")
AddEventHandler("vRP:Identity",function(info)
	-- local permission  = vRP.query("playerdata/getGroup",{ user_id = user_id })
	-- print(permission[1]["ORGS"])
	if info == nil then
		SendNUIMessage({ identity = false })
	else
	   SendNUIMessage({ identity = true, mode = info["mode"], nome = info["nome"], nacionalidade = info["nacionalidade"], propriedades = info["propriedades"], veiculos = info["veiculos"], gemas = info["gemas"], passaporte = info["passaporte"], premium = info["premium"], sangue = info["sangue"], permissao = info["profissao"], cargo = info["cargo"] })
	end
end)