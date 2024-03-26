local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

RegisterNetEvent('abrir', function(user_id, foto, grupo, permissao)
    onNui = not onNui
    vRP.removeObjects()
    if onNui then
        TriggerServerEvent("home-page",grupo)
        SetNuiFocus(true, true)
        vRP.removeObjects()
        vRP.createObjects("amb@code_human_in_bus_passenger_idles@female@tablet@base","base","prop_cs_tablet",50,28422)
        SendNUIMessage({
            action = "abrir",
            data = {
                id = user_id, 
                foto = foto,
                grupo = grupo,
                permissao = permissao
            }
        })
    else
        SetNuiFocus(false)
        SendNUIMessage({
            action = "fechar"
        })
     
    end
end)

RegisterNetEvent('home-page', function(ativos, total, nome, data)
    SendNUIMessage({
        action = "home-page",
        online = ativos,
        total = total,
        nome = nome,
        dados = data
    })
end)

RegisterNetEvent('membros-page', function(data)
    SendNUIMessage({
        action = "membros-page",
        dados = data
    })
end)

RegisterNetEvent('close-demitir', function(ativos, total, nome, data)
    SendNUIMessage({
        action = "close-demitir"
    })
end)

RegisterNetEvent('bau-page', function(data)
    SendNUIMessage({
        action = "bau-page",
        dados = data
    })
end)

RegisterNetEvent('banco-page', function(data,saldo,permissao,lider)
    SendNUIMessage({
        action = "banco-page",
        dados = data,
        saldo = saldo,
        lider = lider,
        permissao = permissao
    })
end)


RegisterNUICallback('bau-page', function()
    TriggerServerEvent('bau-page')
end)

RegisterNUICallback('adicionar-saldo', function()
    TriggerServerEvent('rs_painel:depositar')
end)

RegisterNUICallback('remover-saldo', function()
    TriggerServerEvent('rs_painel:sacar')
end)

RegisterNUICallback('promover-membro', function(data)
    if tonumber(data.id) then
        TriggerServerEvent('rs_painel:promover-membro', data.id, data.cargo); 
    end
end)


RegisterNUICallback('banco-page', function()
    TriggerServerEvent('banco-page')
end)

RegisterNUICallback('depositar', function()
    TriggerServerEvent('rspainel:depositar')
end)

RegisterNUICallback('membros-page', function()
    TriggerServerEvent('membros-page')
end)

RegisterNUICallback("demitir-membro", function(data)
    if tonumber(data.id) then 
        TriggerServerEvent("rs_painel:demitir-membro", data.id, data.cargo)
    end
end)

RegisterNUICallback("fechar", function()
    onNui = not onNui
    vRP.removeObjects()
    SetNuiFocus(false)
    SendNUIMessage({
        action = "fechar"
    })
end)

RegisterNUICallback("criargrupo", function(data)
    if tonumber(data.lider) then 
        TriggerServerEvent("rs_painel:criargrupo", data.nome, data.lider)
    end
end)

RegisterNUICallback("pagar", function(data)
    TriggerServerEvent('jose:pagamento', data.dinheiro)
end)

RegisterNUICallback("add-membro", function(data)
    if tonumber(data.id) then 
        TriggerServerEvent("rs_painel:add-membro", data.id)
    end
end)

RegisterNetEvent('membros-page', function(data)
    SendNUIMessage({
        action = "membros-page",
        dados = data
    })
end)

RegisterNetEvent("tablet:openSystem")
AddEventHandler("tablet:openSystem",function()
    TriggerServerEvent('painel1')
end)