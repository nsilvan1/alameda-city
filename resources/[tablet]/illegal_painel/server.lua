local Proxy = module("vrp", "lib/Proxy")
local vRP = Proxy.getInterface("vRP")

vRP._prepare("rs_groups/create", "INSERT INTO rs_groups (grupo, saldo) VALUES (@grupo, @saldo)")

vRP._prepare("rs_groups/deletemembro", "DELETE FROM rs_groups_membros WHERE membro = @membro")
vRP._prepare(
    "rs_groups/addmembro",
    "INSERT INTO rs_groups_membros (nome, grupo, membro, cargo) VALUES (@nome, @grupo, @membro, @cargo)"
)
vRP._prepare("rs_groups/selectmembro", "SELECT * FROM rs_groups_membros WHERE membro = @membro")
vRP._prepare("rs_groups/getmembros", "SELECT * FROM rs_groups_membros WHERE grupo = @grupo")
vRP._prepare("rs_groups/getbau", "SELECT * FROM rs_groups_bau WHERE grupo = @grupo AND data_transacao > DATE_SUB(NOW(), INTERVAL 1 DAY) ORDER BY data_transacao DESC")
vRP._prepare("rs_groups/getbanco", "SELECT * FROM rs_groups_banco WHERE grupo = @grupo AND data_transacao > DATE_SUB(NOW(), INTERVAL 30 DAY) ORDER BY data_transacao DESC")
vRP._prepare(
    "rs_groups/addBauLog",
    "INSERT INTO rs_groups_bau (`membro_id`,`membro_nome`,`colocou`,`item`,`quantidade`,`grupo`) VALUES (@membro_id,@membro_nome,@colocou,@item,@quantidade,@grupo)"
)
vRP._prepare(
    "rs_groups/addTransacao",
    "INSERT INTO rs_groups_banco (`membro_id`,`membro`,`deposito`,`valor`,`grupo`) VALUES (@id,@nome,@deposito,@valor,@grupo)"
)

vRP._prepare(
    "rs_groups/updateSaldo",
    "UPDATE rs_groups SET saldo = @saldo WHERE grupo = @grupo"
)

vRP._prepare(
    "rs_groups/getSaldo",
    "SELECT * FROM rs_groups WHERE grupo = @grupo"
)

vRP._prepare(
    "rs_groups/getMembro",
    "SELECT * FROM rs_groups_users WHERE id = @id"
)


vRP._prepare(
    "rs_painel/membros_grupo",
    "SELECT * FROM vrp_permissions WHERE ORGS = @grupo"
)

vRP._prepare(
    "rs_groups/addMembro",
    "INSERT INTO rs_groups_users (`id`, `nome`, `cargo`, `status`) VALUES (@id,@nome,@cargo,@status)"
)


vRP._prepare("rs_groups/updateMembroStatus",
"UPDATE rs_groups_users SET status = @status WHERE id = @id")


function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end


 function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end  
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
      end

RegisterNetEvent(
    "painel1",
    function()       
        local source = source
        local user_id = vRP.getUserId(source)
        for key, value in pairs(Config.grupos) do
            if vRP.hasPermission(user_id, value.grupos["Líder"].grupo) then
                TriggerClientEvent("abrir", source, user_id, value.config.foto, key, "lider")
                return
            else
                for k, v in ipairs(value.grupos["Membros"]) do
                    if vRP.hasPermission(user_id, v.grupo) then
                        TriggerClientEvent("abrir", source, user_id, value.config.foto, key, "membro")
                        return
                    end
                end
            end
        end
    end
)

RegisterNetEvent(
    "rs_painel:demitir-membro",
    function(user_id, cargo)
        local source = source
        local lider_id = vRP.getUserId(source)
        local lider_identity = vRP.query("characters/getUsers",{ id = lider_id})
        local user_id = parseInt(user_id)
        local user_identity = vRP.query("characters/getUsers",{ id = user_id})
        for key, value in pairs(Config.grupos) do
         if vRP.hasPermission(lider_id, value.grupos["Líder"].grupo) then
            if  cargo == 'Lider' then
                return TriggerClientEvent(Config.notify, source, Config.notify_erro, "Você não pode demitir um líder", 10000)
            else
            local grupo = key
          
            if user_id and grupo then
               local nsource = vRP.getUserSource(user_id)
               local tem_grupo = false
            
                if nsource then
                    if  cargo then
                        tem_grupo = true
                    end
                   if tem_grupo == true then
                        for k6, v6 in pairs(value.grupos["Membros"]) do
                            local groupUser = value.grupos["Líder"].org .. cargo
                            print(groupUser)
                            if v6.grupo == groupUser  then 
                                vRP.remPermission(user_id,v6.grupo)
                                -- vRP.execute("vRP/del_group",{ user_id = parseInt(user_id), permiss = tostring(v6.grupo) })
                                local userName = (user_identity[1].name or "") .. " " .. (user_identity[1].name2 or "")
                                TriggerClientEvent(Config.notify,source,Config.notify_sucesso,"Você <b>demitiu</b> o membro ".. userName .." do grupo <b>".. key .."</b> !",5000)
                                TriggerClientEvent("close-demitir", source)
                                local userName_lider = (lider_identity[1].name or "") .. " " .. (lider_identity[1].name2 or "")
                                SendWebhookMessage(Config.webhooks.demitir,"```prolog\n[ID]: "..tostring(userName_lider).." "..tostring(lider_id).."\n[DEMITIU]: "..tostring(userName).." "..tostring(user_id).." \n[GRUPO]: "..tostring(key).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                TriggerEvent("membros-page-2", source)
                                return
                            end
                        end
                         
                    end
                else
                    TriggerClientEvent(
                        Config.notify,
                        source,
                        Config.notify_erro,
                        "O passaporte <b>" .. user_id .. "</b> não está <b>Ativo</b> .", 10000
                    )
                end
            end
         end
      end
    end
end)


RegisterNetEvent(
    "rs_painel:promover-membro",
    function(user_id, cargo)
        local source = source
        local lider_id = vRP.getUserId(source)
        local lider_identity = vRP.query("characters/getUsers",{ id = lider_id})
        local user_id = parseInt(user_id)
        local user_identity =  vRP.query("characters/getUsers",{ id = user_id})
        for key, value in pairs(Config.grupos) do
            if vRP.hasPermission(lider_id, value.grupos["Líder"].grupo) then
                if  cargo == 'Lider' then
                    return TriggerClientEvent(Config.notify, source, Config.notify_erro, "Você não pode promover um líder", 10000)
                else
                    local grupo = key
                    if user_id and grupo then
                    local nsource = vRP.getUserSource(user_id)
                    local tem_grupo = false
                    
                        if nsource then
                                if  cargo then
                                    tem_grupo = true
                                end
                                if tem_grupo == true then
                                    if cargo == 'Sargento' then 
                                        return TriggerClientEvent(Config.notify, source, Config.notify_erro, "Não é permitido promover para Comandante", 10000)
                                    else 
                                        if cargo == 'Lider' or cargo == 'Lider'   then 
                                            return TriggerClientEvent(Config.notify, source, Config.notify_erro, "Membro já está no maior cargo", 10000)
                                        else 
                                            local request = vRP.request(source,"Você tem certeza que deseja promover <b>"..user_identity[1].name.."?",30)
                                            if request then
                                                for k6, v6 in pairs(value.grupos["Membros"]) do
                                                    local new_grupo_index = k6 + 1
                                                    local new_grupo = ''
                                                    local new_title = ''
                                                    if (cargo == 'Gerente' or cargo == 'Medico' ) then 
                                                        new_grupo = value.grupos["Líder"].grupo 
                                                    else 
                                                        -- somente para a POLICIA 
                                                        if cargo == 'Recruta' then 
                                                            new_grupo ='PoliceSoldado'
                                                            new_title = 'Soldado'
                                                        elseif  cargo == 'Soldado'  then
                                                            new_grupo ='PoliceSargento'
                                                            new_title = 'Sargento'
                                                        else     
                                                         new_grupo = v6.grupo
                                                         new_title = v6.titulo
                                                        end 
                                                    end 
                                                    if new_grupo_index >= 0 then
                                                        local grupo = value.grupos["Líder"].org .. cargo
                                                        if new_grupo then
                                                            vRP.remPermission(user_id, grupo)
                                                            vRP.setPermission(user_id,  new_grupo )
                                                            local userName = (user_identity[1].name or "") .. " " .. (user_identity[1].name2 or "")
                                                            local userName_lider = (lider_identity[1].name or "") .. " " .. (lider_identity[1].name2 or "")
                                                            TriggerClientEvent("Notify",source,Config.notify_sucesso,"Você <b>promoveu</b> o membro ".. userName .." para o cargo <b>".. new_title .."</b> !",5000)
                                                            SendWebhookMessage(Config.webhooks.promover,"```prolog\n[ID]: "..tostring(userName_lider).." "..tostring(lider_id).."\n[PROMOVEU]: "..tostring(userName).." "..tostring(user_id).." \n[GRUPO]: "..tostring(key).." \n[CARGO ANTERIOR]: "..tostring(v6.titulo).." \n[NOVO CARGO]: "..tostring(new_grupo.titulo).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                                            TriggerEvent("membros-page-2", source)
                                                            return
                                                        elseif new_grupo == nil then
                                                            TriggerClientEvent(Config.notify, source, Config.notify_erro, "Membro já está no maior cargo", 10000)
                                                            return
                                                        end
                                                    else
                                                        return
                                                    end                                
                                                end                        
                                            end
                                        end 
                                    end
                            else
                                TriggerClientEvent(
                                    Config.notify,
                                    source,
                                    Config.notify_erro,
                                    "O passaporte <b>" .. user_id .. "</b> não <b>pertence</b> ao grupo <b>" .. key .. "</b>.", 10000
                                )
                            end
                        else
                            TriggerClientEvent(
                                Config.notify,
                                source,
                                Config.notify_erro,
                                "O passaporte <b>" .. user_id .. "</b> não <b>está</b> ativo na <b>cidade</b>.",10000
                            )
                        end
                    end   
                end
            end
        end
    end
)


RegisterNetEvent(
    "home-page",
    function(key)
        local source = source -- pega a source de quem esta usando o painel

        local user_id = vRP.getUserId(source) -- id do usuario que esta usando o painel
        local identidade = vRP.query("characters/getUsers",{ id = user_id}) -- identidade do usuario que esta usando o painel
        local liderPermissoes = getUsersByGroup(Config.grupos[key].grupos["Líder"].org) -- {}
        local membros_ativos = 0

        local construtor = {}
        local instancia = {}
        local tabela = {}

        local counter = 0
        local total_membros = 0
        
        for k, v in ipairs(liderPermissoes) do
            total_membros = total_membros + 1
            local identity =  vRP.query("characters/getUsers",{ id = v.id})
            local userName = (identity[1].name or "") .. " " .. (identity[1].name2 or "")
            construtor[v.id] = v.id .. " " .. userName
            counter = counter + 1
            local membro = vRP.query("rs_groups/getMembro",{id = v.id})
            local cadastrado = false
            local logado = ""
            local nsource = vRP.getUserSource( v.id)
            local status = "offline"
            if nsource then 
                status = "online"
                membros_ativos = membros_ativos + 1 
            end
            for k, v2 in pairs(membro) do
                cadastrado = true
                tabela[counter] = {
                    cargo = v.permiss,
                    id = v.id,
                    nome = userName,
                    logado = v.logado,
                    status = status
                }
            end
            if cadastrado == false then
                local a = "a"
                vRP.query(
                    "rs_groups/addMembro",
                    {
                        cargo = v.permiss,
                        id = v.id,
                        nome = userName,
                        status = "online"
                    })
                    tabela[counter] = {
                        cargo = v.permiss,
                        id = v.id,
                        nome = userName,
                        logado = v.logado,
                        status = "online"
                    }
            end
        end
       
        for k, v in pairs(construtor) do
            table.insert(instancia, v)
        end

        local nome2 = (identidade[1].name or "") .. " " .. (identidade[1].name2 or "")

        TriggerClientEvent("home-page", source, membros_ativos, total_membros, nome2, tabela)
    end
)

RegisterNetEvent(
    "rs_painel:add-membro",
    function(user_id)
        local source = source
        local lider_id = vRP.getUserId(source)
        
        local lider_identity = vRP.query("characters/getUsers",{ id = lider_id })
        local user_id = parseInt(user_id)
        local user_identity = vRP.query("characters/getUsers",{ id = user_id})
        local user_source = vRP.getUserSource(user_id)
        for key, value in pairs(Config.grupos) do
            if vRP.hasPermission(lider_id, value.grupos["Líder"].grupo) then
                if vRP.hasPermission(user_id, value.grupos["Líder"].grupo) then
                    return TriggerClientEvent(Config.notify, source, Config.notify_erro, "Você não pode promover um líder", 10000)
                else
                    local grupo = key
                    if user_id and grupo then
                        local nsource = vRP.getUserSource(user_id)
                        local tem_grupo = false
                        if nsource then
                            if vRP.hasPermission(user_id, value.grupos["Líder"].grupo) then
                                tem_grupo = true
                            end
                            for k6, v6 in pairs(value.grupos["Membros"]) do
                                if vRP.hasPermission(user_id, v6.grupo) then
                                    tem_grupo = true
                                end
                            end
                            for k10, v10 in pairs(Config.grupos) do
                                for k11, v11 in pairs(v10.grupos["Membros"]) do
                                    if vRP.hasPermission(user_id, v11.grupo) then
                                        tem_grupo = true
                                    end
                                end
                                if vRP.hasPermission(user_id, v10.grupos["Líder"].grupo) then
                                    tem_grupo = true
                                end
                            end
                            for k10, v10 in pairs(Config.blocklist) do
                                if vRP.hasPermission(user_id, v10) then
                                    tem_grupo = true
                                end
                            end
                            if tem_grupo == false then
                                local userName_lider = (lider_identity[1].name or "") .. " " .. (lider_identity[1].name2 or "")
                                local request =
                                    vRP.request(
                                    user_source,
                                    "O(a)" .. userName_lider .. " te convidou para se juntar ao grupo <b>" .. key .. "",
                                    30
                                )
                                if request then
                                    local new_grupo = value.grupos["Membros"][1]
                                    if new_grupo then
                                        if key == "BOPE" or key == "PRF" or key == "POLICIA CIVIL" or key == "Polícia Penal" or key  == "POLICIA MÍLITAR" then
                                            -- vRP.insertPermission(user_id, tostring("police"))
                                            vRP.setPermission(user_id, new_grupo.grupo)
                                            -- vRP.execute(
                                            --     "vRP/add_group",
                                            --     {user_id = parseInt(user_id), permiss = tostring("police")}
                                            -- )
                                        end
                                        vRP.setPermission(user_id, new_grupo.grupo)
                                        -- vRP.execute(
                                        --     "vRP/add_group",
                                        --     {user_id = parseInt(user_id), permiss = tostring(new_grupo.grupo)}
                                        -- )
                                        local userName =
                                            (user_identity[1].name or "") .. " " .. (user_identity[1].name2 or "")
                                        TriggerClientEvent(
                                            Config.notify,
                                            source,
                                            Config.notify_sucesso,
                                            "Você <b>adicionou</b> o membro " ..
                                                userName .. " ao cargo <b>" .. new_grupo.titulo .. "</b> !",
                                            5000
                                        )
                                        TriggerEvent("membros-page-2", source)
                                        SendWebhookMessage(Config.webhooks.promover,"```prolog\n[ID]: "..tostring(userName_lider).." "..tostring(lider_id).."\n[CONTRATOU]: "..tostring(userName).." "..tostring(user_id).." \n[PARA O GRUPO]: "..tostring(key).."\n[NO CARGO]: "..tostring(new_grupo.titulo).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    end
                                end
                            else
                                TriggerClientEvent(
                                    Config.notify,
                                    source,
                                    Config.notify_erro,
                                    "O passaporte <b>" .. user_id .. "</b> já <b>pertence</b> ao um grupo",
                                    10000
                                )
                            end
                        else
                            TriggerClientEvent(
                                Config.notify,
                                source,
                                Config.notify_erro,
                                "O passaporte <b>" .. user_id .. "</b> <b>não está</b> ativo na cidade",
                                10000
                            )
                        end
                    end
                end
            end
        end
    end
)



RegisterNetEvent(
    "membros-page",
    function(key)
        local source = source -- pega a source de quem esta usando o painel

        local user_id = vRP.getUserId(source) -- id do usuario que esta usando o painel

        local identidade = vRP.query("characters/getUsers",{ id = user_id}) -- identidade do usuario que esta usando o painel
        local construtor = {}
        local instancia = {}
        local tabela = {}

        local counter = 0

        for key, value in pairs(Config.grupos) do
            if vRP.hasPermission(user_id, value.grupos["Líder"].grupo) then
                local liderPermissoes = getUsersByGroup(Config.grupos[key].grupos["Líder"].org)
                for k, v in ipairs(liderPermissoes) do
                    local identity = vRP.query("characters/getUsers",{ id = v.id})                    
                    local userName = (identity[1].name or "") .. " " .. (identity[1].name2 or "")
                    construtor[v.id] = v.id .. " " .. userName
                    counter = counter + 1
                    local nsource = vRP.getUserSource( v.id)
                    local status = "offline"
                    if nsource then 
                        status = "online"
                    end
                    tabela[counter] = {
                        cargo = v.permiss,
                        id = v.id,
                        nome = userName,
                        status = status,
                        phone = identity[1].phone
                    }
                end
            end
        end

        TriggerClientEvent("membros-page", source, tabela)
    end
)

RegisterNetEvent(
    "membros-page-2",
    function(src)
        local source = src -- pega a source de quem esta usando o painel

        local user_id = vRP.getUserId(source) -- id do usuario que esta usando o painel

        local identidade = vRP.query("characters/getUsers",{ id = user_id}) -- identidade do usuario que esta usando o painel

        local construtor = {}
        local instancia = {}
        local tabela = {}

        local counter = 0

        for key, value in pairs(Config.grupos) do
            if vRP.hasPermission(user_id, value.grupos["Líder"].grupo) then
                local liderPermissoes = getUsersByGroup(Config.grupos[key].grupos["Líder"].org)
                for k, v in ipairs(liderPermissoes) do
                    local identity = vRP.query("characters/getUsers",{ id = v.id})
                    local userName = (identity[1].name or "") .. " " .. (identity[1].name2 or "")
                    construtor[v.id] = v.id .. " " .. userName
                    counter = counter + 1
                    tabela[counter] = {
                        cargo = v.permiss,
                        id = v.id,
                        nome = userName
                    }
                end
                -- for k, v2 in ipairs(Config.grupos[key].grupos["Membros"]) do
                --     local groupUsers = getUsersByGroup(v2.grupo)
                --     for k, v in ipairs(groupUsers) do
                --         if not vRP.hasPermission(v, Config.grupos[key].grupos["Líder"].grupo) then
                --         counter = counter + 1
                --         local identity = vRP.query("characters/getUsers",{ id = v})
                --         local userName = (identity[1].name or "") .. " " .. (identity[1].name2 or "")
                --         construtor[v] = v .. " " .. userName
                --         tabela[counter] = {cargo = v2.titulo, id = v, nome = userName}
                --         end
                --     end
                -- end
            end
        end

        TriggerClientEvent("membros-page", source, tabela)
    end
)


RegisterNetEvent(
    "bau-page",
    function()
        local source = source -- pega a source de quem esta usando o painel

        local user_id = vRP.getUserId(source) -- id do usuario que esta usando o painel
        local pesoTotalBau = 0 
        local identidade2 = vRP.query("characters/getUsers",{ id = user_id})-- identidade do usuario que esta usando o painel
        local bau_logs = {}
       
        for k, v in pairs(Config.grupos) do
            local consultChest = vRP.query("chests/getChests",{ name = v.grupos["Líder"].org })
            if consultChest[1] then
                pesoTotalBau = consultChest[1]["weight"]
            end
            if vRP.hasPermission(user_id, v.grupos["Líder"].grupo)  then
                local result = vRP.getSrvdata("stackChest:".. v.grupos["Líder"].org)
                for k,v in pairs(result) do
                    table.insert(bau_logs,
                                { amount = parseInt(v["amount"]),
                                  name = itemName(v["item"]),
                                  index = itemIndex(v["item"]),
                                  type = itemType(v["item"]), 
                                  peso = itemWeight(v["item"]),
                                  pesoBau = pesoTotalBau
                                })
                end
                TriggerClientEvent("bau-page", source, bau_logs)
            else 
                for k20, v10 in pairs(v.grupos["Membros"]) do
                    if vRP.hasPermission(user_id, v10.grupo) then
                        local result = vRP.getSrvdata("stackChest:".. v.grupos["Líder"].org)
                        for k,v in pairs(result) do
                            table.insert(bau_logs,
                                        { amount = parseInt(v["amount"]),
                                        name = itemName(v["item"]),
                                        index = itemIndex(v["item"]),
                                        type = itemType(v["item"]), 
                                        peso = itemWeight(v["item"]),
                                        pesoBau = pesoTotalBau
                                        })
                        end
                    end
                end
                TriggerClientEvent("bau-page", source, bau_logs)
            end
        end
    end
)

RegisterNetEvent(
    "banco-page",
    function()
        local source = source -- pega a source de quem esta usando o painel

        local user_id = vRP.getUserId(source) -- id do usuario que esta usando o painel

        local identidade2 = vRP.query("characters/getUsers",{ id = user_id}) -- identidade do usuario que esta usando o painel

        for key, value in pairs(Config.grupos) do
            if vRP.hasPermission(user_id, value.grupos["Líder"].grupo) then
                local lider = true
                local logs_bau = vRP.query("rs_groups/getbanco", {grupo = tostring(key)})
                local dados = logs_bau
                local saldo = vRP.query("rs_groups/getSaldo", {grupo = tostring(key)})
                local saldo2 = 0
                for k10, v10 in pairs(saldo) do
                    if v10.saldo then
                        saldo2 = v10.saldo
                    else
                        saldo2 = 0
                    end
                end
                TriggerClientEvent("banco-page", source, dados, tostring(saldo2), lider)
            else
                for k20, v10 in pairs(value.grupos["Membros"]) do
                    if vRP.hasPermission(user_id, v10.grupo) then
                        local lider = false
                        local logs_bau = vRP.query("rs_groups/getbanco", {grupo = tostring(key)})
                        local saldo = vRP.query("rs_groups/getSaldo", {grupo = tostring(key)})
                        local saldo2 = 0
                        for k10, v10 in pairs(saldo) do
                            if v10.saldo then
                                saldo2 = v10.saldo
                            else
                                saldo2 = 0
                            end
                        end
                        local dados = logs_bau
                        TriggerClientEvent("banco-page", source, dados, tostring(saldo2),lider)
                    end
                end
            end
        end
    end
)

RegisterNetEvent(
    "banco-page-2",
    function(src)
        local source = src -- pega a source de quem esta usando o painel

        local user_id = vRP.getUserId(source) -- id do usuario que esta usando o painel

        local identidade2 = vRP.query("characters/getUsers",{ id = user_id}) -- identidade do usuario que esta usando o painel

        for key, value in pairs(Config.grupos) do
            if vRP.hasPermission(user_id, value.grupos["Líder"].grupo) then
                local lider = true
                local logs_bau = vRP.query("rs_groups/getbanco", {grupo = tostring(key)})
                local dados = logs_bau
                local saldo = vRP.query("rs_groups/getSaldo", {grupo = tostring(key)})
                local saldo2 = 0
                for k10, v10 in pairs(saldo) do
                    if v10.saldo then
                        saldo2 = v10.saldo
                    else
                        saldo2 = 0
                    end
                end
                TriggerClientEvent("banco-page", source, dados, tostring(saldo2),lider)
            else
                for k20, v10 in pairs(value.grupos["Membros"]) do
                    if vRP.hasPermission(user_id, v10.grupo) then
                        local lider = false
                        local logs_bau = vRP.query("rs_groups/getbanco", {grupo = tostring(key)})
                        local saldo = vRP.query("rs_groups/getSaldo", {grupo = tostring(key)})
                        local saldo2 = 0
                        for k10, v10 in pairs(saldo) do
                            if v10.saldo then
                                saldo2 = v10.saldo
                            else
                                saldo2 = 0
                            end
                        end
                        local dados = logs_bau
                        TriggerClientEvent("banco-page", source, dados, tostring(saldo2),lider)
                    end
                end
            end
        end
    end
)

RegisterNetEvent(
    "rs_painel:addlogbau",
    function(user_id, acao, item, quantidade, grupo)
        if Config.printbau then
           print(grupo)
        end
        local user_id = user_id
        local horario = os.time(os.date("!*t"))
        local identity = vRP.query("characters/getUsers",{ id = user_id})
        local nome = (identity[1].name or "") .. " " .. (identity[1].name2 or "")
        for k, v in pairs(Config.grupos) do
            if v.config.bau == grupo then
                vRP._execute(
                    "rs_groups/addBauLog",
                    {
                        membro_id = user_id,
                        membro_nome = nome,
                        colocou = acao,
                        item = item,
                        quantidade = quantidade,
                        grupo = k
                    }
                )
                if acao == true then
                    SendWebhookMessage(Config.webhooks.bau,"```prolog\n[ID]: "..tostring(nome).." "..tostring(user_id).."\n[COLOCOU NO BAU]: "..tostring(item).." \n[QUANTIDADE]: "..tostring(quantidade).."\n[GRUPO]: "..tostring(k).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                else
                    SendWebhookMessage(Config.webhooks.bau,"```prolog\n[ID]: "..tostring(nome).." "..tostring(user_id).."\n[RETIROU DO BAU]: "..tostring(item).." \n[QUANTIDADE]: "..tostring(quantidade).."\n[GRUPO]: "..tostring(k).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                end

            end
        end
    end
)

RegisterNetEvent(
    "rs_painel:depositar",
    function()
        local source = source -- pega a source de quem esta usando o painel

        local user_id = vRP.getUserId(source) -- id do usuario que esta usando o painel

        local valor = vRP.prompt(source, "Valor","")
      
            if tonumber(valor) then
                local acao = false
                    for key, value in pairs(Config.grupos) do
                        if vRP.hasPermission(user_id, value.grupos["Líder"].grupo) then
                            local identidade = vRP.query("characters/getUsers",{ id = user_id})
                            local userName = (identidade[1].name or "") .. " " .. (identidade[1].name2 or "")
                            local horario = os.time(os.date("!*t"))
                            local saldo = vRP.query("rs_groups/getSaldo", {grupo = tostring(key)})
                            local existe = false 
                            for k10, v10 in pairs(saldo) do
                               existe = true
                        
                               local money_a = 0;
                               if v10.saldo then
                                if v10.saldo > 0 then
                                    money_a = v10.saldo + tonumber(valor)
                                   else
                                     money_a = tonumber(valor)
                                   end
                                else
                                    money_a = tonumber(valor)
                                end
                            
                                if money_a > 0 then
                                    if vRP.getBank(user_id) >= tonumber(valor) then
                                        vRP.delBank(user_id, tonumber(valor))
                                        vRP._execute("rs_groups/updateSaldo",{
                                            grupo = key, saldo = money_a
                                            })
                                            TriggerClientEvent(Config.notify,source,Config.notify_debito,"Você <b>depositou</b> com sucesso <b>R$".. valor .."</b> no banco do grupo "..key.."!",5000)
                                            local logs_bau = vRP.query("rs_groups/getbanco", {grupo = tostring(key)})
                                            TriggerEvent("banco-page-2", source)
                                        vRP._execute("rs_groups/addTransacao", {
                                            id = user_id,
                                            grupo = key,
                                            deposito = "true",
                                            nome = userName,
                                            valor = tonumber(valor)
                                        })
                                        local logs_bau = vRP.query("rs_groups/getbanco", {grupo = tostring(key)})
                                        TriggerEvent("banco-page-2", source)
                                        SendWebhookMessage(Config.webhooks.banco,"```prolog\n[ID]: "..tostring(userName).." "..tostring(user_id).."\n[DEPOSITOU]: R$"..tostring(valor).." \n[GRUPO]: "..tostring(key)..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    else
                                        TriggerClientEvent(Config.notify,source,Config.notify_erro,"Valor <b>insuficiente<b/>!",5000)
                                    end
                                    
                                end
                      
                            end
                            if existe == false then
                                    vRP._execute("rs_groups/create",{
                                    grupo = key,
                                    saldo = tonumber(valor)
                                })
                                   vRP._execute("rs_groups/addTransacao", {
                                        id = user_id,
                                        grupo = key,
                                        deposito = "true",
                                        nome = userName,
                                        valor = tonumber(valor)
                                    })
                                    TriggerClientEvent(Config.notify,source,Config.notify_debito,"Você <b>depositou</b> com sucesso <b>R$".. valor .."</b> no banco do grupo "..key.."!",5000)
                                    local logs_bau = vRP.query("rs_groups/getbanco", {grupo = tostring(key)})
                                    TriggerEvent("banco-page-2", source)
                                    SendWebhookMessage(Config.webhooks.banco,"```prolog\n[ID]: "..tostring(userName).." "..tostring(user_id).."\n[DEPOSITOU]: R$"..tostring(valor).." \n[GRUPO]: "..tostring(key)..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                            end
                            
                        else
                            for k, v in ipairs(value.grupos["Membros"]) do
                                if vRP.hasPermission(user_id, v.grupo) then
                                    local identidade = vRP.query("characters/getUsers",{ id = user_id})
                                    local userName = (identidade[1].name or "") .. " " .. (identidade[1].name2 or "")
                                    local horario = os.time(os.date("!*t"))
                                    local existe = false 
                                    local saldo = vRP.query("rs_groups/getSaldo", {grupo = tostring(key)})
                            for k10, v10 in pairs(saldo) do
                               existe = true
                        
                               local money_a = 0;
                               if v10.saldo then
                                if v10.saldo > 0 then
                                    money_a = v10.saldo + tonumber(valor)
                                   else
                                     money_a = tonumber(valor)
                                   end
                                else
                                    money_a = tonumber(valor)
                                end
                            
                                if money_a > 0 then
                                    if vRP.getBank(user_id) >= tonumber(valor) then
                                        vRP.delBank(user_id, tonumber(valor))
                                        vRP._execute("rs_groups/updateSaldo",{
                                            grupo = key, saldo = money_a
                                            })
                                            TriggerClientEvent(Config.notify,source,Config.notify_debito,"Você <b>depositou</b> com sucesso <b>R$".. valor .."</b> no banco do grupo "..key.."!",5000)
                                            local logs_bau = vRP.query("rs_groups/getbanco", {grupo = tostring(key)})
                                            TriggerEvent("banco-page-2", source)
                                        vRP._execute("rs_groups/addTransacao", {
                                            id = user_id,
                                            grupo = key,
                                            deposito = "true",
                                            nome = userName,
                                            valor = tonumber(valor)
                                        })
                                        SendWebhookMessage(Config.webhooks.banco,"```prolog\n[ID]: "..tostring(userName).." "..tostring(user_id).."\n[DEPOSITOU]: R$"..tostring(valor).." \n[GRUPO]: "..tostring(key)..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                    else
                                        TriggerClientEvent(Config.notify,source,Config.notify_erro,"Valor <b>insuficiente<b/>!",5000)
                                    end
                                end
                      
                            end
                            if existe == false then
                                    vRP._execute("rs_groups/create",{
                                    grupo = key,
                                    valor = tonumber(valor)
                                })
                                   vRP._execute("rs_groups/addTransacao", {
                                        id = user_id,
                                        grupo = key,
                                        deposito = "true",
                                        nome = userName,
                                        valor = tonumber(valor)
                                    })
                            end
                        end
                            end
                        end
                    end
            else
                TriggerClientEvent(Config.notify,
                source,
                Config.notify_erro,
                "Valor <b>inválido</b>",5000)
            end
   
    end
)

RegisterNetEvent(
    "rs_painel:sacar",
    function()
        local source = source -- pega a source de quem esta usando o painel

        local user_id = vRP.getUserId(source) -- id do usuario que esta usando o painel
        
        local valor = vRP.prompt(source, "Valor que você deseja sacar","")
      
            if tonumber(valor) then

                local request = vRP.request(source,"Você tem certeza que deseja sacar este valor?",30)

                if request then
                    for key, value in pairs(Config.grupos) do
                        local lider = false
                        if vRP.hasPermission(user_id, value.grupos["Líder"].grupo) then
                            lider = true
                            local identidade = vRP.query("characters/getUsers",{ id = user_id})
                            local userName = (identidade[1].name or "") .. " " .. (identidade[1].name2 or "")
                            local horario = os.time(os.date("!*t"))
                            local saldo = vRP.query("rs_groups/getSaldo", {grupo = tostring(key)})
                            for k10, v10 in pairs(saldo) do
                               existe = true
                        
                               local money_a = 0;
                               if v10.saldo then
                                if v10.saldo > 0 then
                                    money_a = v10.saldo - tonumber(valor)
                                   else
                                     money_a = tonumber(valor)
                                   end
                                else
                                    money_a = tonumber(valor)
                                end
                            
                                if money_a >= 0 then
                                    local saldo2 = vRP.query("rs_groups/getSaldo", {grupo = tostring(key)})
                                    for k20, v20 in pairs(saldo) do
                                        if v20.saldo > 0 then
                                            vRP._execute("rs_groups/updateSaldo",{
                                                grupo = key, saldo = money_a
                                                })
                                                local data_atual = os.time(os.date("!*t"))
                                                vRP._execute("rs_groups/addTransacao", {
                                                    id = user_id,
                                                    grupo = key,
                                                    deposito = "false",
                                                    nome = userName,
                                                    valor = tonumber(valor),
                                                    data_transacao = data_atual
                                                })
                                                TriggerClientEvent("Notify",source, Config.notify_sucesso,"Você <b>sacou</b> com sucesso <b>R$".. valor .."</b> no banco do grupo "..key.."!",5000)
                                                local logs_bau = vRP.query("rs_groups/getbanco", {grupo = tostring(key)})
                                                TriggerEvent("banco-page-2", source)
                                                vRP.giveBankMoney(user_id,tonumber(valor))
                                                SendWebhookMessage(Config.webhooks.banco,"```prolog\n[ID]: "..tostring(userName).." "..tostring(user_id).."\n[SACOU]: R$"..tostring(valor).." \n[GRUPO]: "..tostring(key)..""..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")  
                                        else
                                            TriggerClientEvent("Notify",source,Config.notify_erro,"Valor <b>insuficiente<b/>!",5000)
                                        end
                                    end
                                else
                                    TriggerClientEvent("Notify",source,Config.notify_erro,"Valor <b>insuficiente<b/>!",5000)
                                end 
                            end
                            if existe == false then
                                    vRP._execute("rs_groups/create",{
                                    grupo = key
                                })
                                local data_atual = os.time(os.date("!*t"))
                                vRP._execute("rs_groups/addTransacao", {
                                    id = user_id,
                                    grupo = key,
                                    deposito = "false",
                                    nome = userName,
                                    valor = tonumber(valor),
                                    data_transacao = data_atual
                                })
                            end
                        end
                    end
                end
            else
                TriggerClientEvent("Notify",
                source,
                Config.notify_erro,
                "Valor <b>inválido</b>",5000)
            end
   
    end
)

function getUsersOfflineByGroup(group)
    local instancia = {}
    local membros = vRP.query("rs_painel/membros_grupo", {grupo = group})
    for k10, v10 in pairs(membros) do
        table.insert(instancia, v10.id)
    end
    return instancia
end


function getUsersByGroup(group)
    local instancia = {} 
    -- local user =  vRP.getUsers()
    local user = vRP.query("rs_painel/membros_grupo", {grupo = group})
    for user_id, source in pairs(user) do -- Verificar se tem a função
        table.insert(instancia, {id = source.id, permiss = source.permiss, logado = source.logado })
    end
    return instancia
end
end)


AddEventHandler('playerDropped', function (reason)
    local v = vRP.getUserId(source) -- id do usuario que esta usando o painel
    local membro = vRP.query("rs_groups/getMembro",{id = v})
    for k, v2 in pairs(membro) do
        cadastrado = true
            vRP.query(
                "rs_groups/updateMembroStatus",
                {
                    id = v,
                    status = "offline"
                })
    end
end)
