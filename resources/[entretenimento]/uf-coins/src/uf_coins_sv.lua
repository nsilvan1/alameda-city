local Tunnel            = module("vrp","lib/Tunnel")
local Proxy             = module("vrp","lib/Proxy")
vRP                     = Proxy.getInterface("vRP")
vRPc                    = Tunnel.getInterface("vRP")
vRPclient                    = Tunnel.getInterface("vRP")

local lServer           = {}
local resName           = GetCurrentResourceName()
local evalToUser        = {}
cachedCoins       = {}
lClient                 = Tunnel.getInterface(resName)
Tunnel.bindInterface(resName,lServer)

cfg = module(GetCurrentResourceName(), "config/config")

vRP._prepare('uf/insertTemporaryData','INSERT INTO uf_appointaments(user_id,product,expirate) VALUES (@user_id,@product,@expirate)')
vRP._prepare('uf/getAppointaments',   'SELECT * FROM uf_appointaments WHERE DATEDIFF(NOW(),expirate) <= 0')
vRP._prepare('uf/deleteAppointament', 'DELETE FROM uf_appointaments WHERE id = @id')
vRP._prepare('uf/getCoins',           'SELECT '..cfg.columnName..' FROM summerz_characters WHERE id = @user_id')
vRP._prepare('uf/updateCoins',        'UPDATE summerz_characters SET '..cfg.columnName..' = @coins WHERE id = @user_id')
vRP._prepare('uf/giveCoins',          'UPDATE summerz_characters SET coins = coins + @coins WHERE id = @user_id')
vRP._prepare('uf/removeCoins',        'UPDATE summerz_characters SET '..cfg.columnName..' = '..cfg.columnName..' - @coins WHERE id = @user_id')
vRP._prepare('uf/addMoedasToTable',   'ALTER TABLE summerz_characters  ADD COLUMN IF NOT EXISTS '..cfg.columnName..' INT UNSIGNED NULL DEFAULT 0')

vRP._prepare('uf/createTable',[[
  CREATE TABLE IF NOT EXISTS `uf_appointaments` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`user_id` INT(11) NOT NULL,
	`product` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`expirate` TIMESTAMP NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB;
]])

sendToDiscord = function(wh,msg)
  if not wh or wh == 'discord webhook' then return end
  local embed = {
    {
        ["color"] = 0x0099ff,
        ["title"] = cfg.webhooks.info.title,
        ["description"] = msg,
        ["footer"] = {
          ["text"] = cfg.webhooks.info.footer.." ("..os.date("%d/%m/%Y %H:%M:%S")..")",
      },
    }
  }
  PerformHttpRequest(wh, function(err, text, headers)  end, 'POST', json.encode({username = cfg.webhooks.info.title, embeds = embed}), { ['Content-Type'] = 'application/json' })
end


CreateThread(function() 
 print("(uf-coins initialized)")
  vRP.execute('uf/createTable')
  vRP.execute('uf/addMoedasToTable')
  local rows = vRP.query('uf/getAppointaments')
  for k,v in pairs(rows) do 
    local productInfo = json.decode(v.product)
    if not evalToUser[v.user_id] then 
      evalToUser[v.user_id] = {}
    end
    table.insert(evalToUser[v.user_id],{appointament = v.id, 
      product = ((v.type == 'buy') and cfg.products[productInfo.category][productInfo.index] or cfg.roulette.items[productInfo.index])
    })
  end
end)

function lServer.showNotify(cor,texto)
  local _src    = source 
  TriggerClientEvent("Notify",_src,cor,texto,5000)
end 

function lServer.openUi(user_id)
  local source = source 
  local user_id = vRP.getUserId(source)
  local coins = 0 
  local rows,affected = vRP.query("uf/getCoins",{ user_id = user_id })
  if #rows > 0 then 
    coins = rows[1].coins
    cachedCoins[user_id] = coins
  end
  return {
    coins = coins or 0
  }
end

function lServer.getCoinsNew()
  local source = source 
  local user_id = vRP.getUserId(source)
  local coins = 0 
  local rows,affected = vRP.query("uf/getCoins",{ user_id = user_id })
  if #rows > 0 then 
    coins = rows[1].coins
  end
  return coins
end



function lServer.getEval()
  local source = source 
  local user_id = vRP.getUserId(source)
  if user_id then 
    local coins           = vRP.query("uf/getCoins",{user_id = user_id})[1][cfg.columnName]
    cachedCoins[user_id]  = coins
  end
  if user_id and evalToUser[user_id] then 
    local copyTable = evalToUser[user_id]
    for k,v in ipairs(evalToUser[user_id]) do 
      if v.temporary and v.temporary.onRemove then 
        sendToDiscord(cfg.webhooks.onremove,"Usuário **"..user_id.."** reembolsando (**"..v.name.."**) ")
        v.temporary.onRemove(source,user_id)
      end
      if v.appointament then 
        vRP._execute('uf/deleteAppointament',{id = v.appointament})
      end
    end
    evalToUser[user_id] = nil
    return {appointaments = copyTable,user_id = user_id}
  end
  return {user_id = user_id}
end


local function addExpirateProduct(user_id,product,_expirate)
  vRP._execute('uf/insertTemporaryData',{
    user_id = user_id,
    product = json.encode(product),
    expirate = os.date("%Y-%m-%d %H:%M:%S",_expirate)
  })
end


function lServer.giveRouletteReward(itemInfo)
  local source        = source 
  local user_id       = vRP.getUserId(source)
  local productTable  = cfg.roulette.items[itemInfo.index]
  if productTable then 
    if productTable.onBuy then 
      productTable.onBuy(source,user_id)
    end
    if productTable.temporary and productTable.temporary.enable then 
      addExpirateProduct(user_id,{
        type = "reward",
        index = itemInfo.index
      },os.time()+productTable.temporary.days)
    end
    if productTable.type == 'normal' then 
      local coins 
      local rows,affected = vRP.query("uf/getCoins",{ user_id = user_id })
      if #rows > 0 then 
        coins = rows[1].coins
      end
      coins = coins + tonumber(productTable.amount)
      vRP._execute('uf/updateCoins',{user_id = parseInt(user_id), coins = parseInt(coins)})
      TriggerClientEvent("Notify",source,"verde","Você recebeu: <b> "..tonumber(productTable.amount).. "Alameda Coins</b>",5000)
      cachedCoins[user_id] = coins
    else
      vRP.giveInventoryItem(user_id,"dollars", productTable.amount,true)
      TriggerClientEvent("sounds:source",source,"coin",0.8)
      TriggerClientEvent("Notify",source,"verde","Você recebeu: <b>$ "..productTable.amount.."</b>",5000)
    end 
    
    sendToDiscord(cfg.webhooks.roulette,"user_id **"..user_id.."** get item! (**"..productTable.name.."**). temporary? "..((productTable.temporary and productTable.temporary.enable) and 'Y *('..productTable.temporary.days..'d)*' or 'N').." ")
    -- 
    local identity = vRP.query("characters/getUsers",{ id = user_id })
    local name  = identity[1]["name"]
    if cfg.roulette.types[productTable.type] then 
      if cfg.roulette.types[productTable.type].notifyAll.notify then 
        TriggerClientEvent(resName..':notifyAll', -1, {
          identity = identity,
          name = name,
          index = ((productTable.idname) and productTable.idname or productTable.model),
          type = productTable.type
        })
      end
      if cfg.roulette.types[productTable.type].notifyAll.chat.enabled then 
        TriggerClientEvent(resName..':notifyAll', -1, {
          identity = identity,
          name = name,
          index = ((productTable.idname) and productTable.idname or productTable.model),
        })
      end
    end
    if cfg.roulette.types[productTable.productType] then 
      cfg.roulette.types[productTable.productType]({
        src = source,
        user_id = user_id, 
        model = productTable.model, 
        idname = productTable.idname,
        amount = productTable.amount,
        info = productTable.additionalData,
        ammo = productTable.ammo,
      })
    end
    return true
  else 
    print('not found '..itemInfo.index)
  end
end

function lServer.tryOpenBox(value)
  local source        = source 
  local user_id       = vRP.getUserId(source)
  if cachedCoins[user_id] >= value then 
    vRP._execute('uf/updateCoins',{user_id = user_id, coins = cachedCoins[user_id] - value})
    cachedCoins[user_id] = cachedCoins[user_id] - value
    return {success = true}
  end
  TriggerClientEvent("Notify",source,"vermelho","Saldo insuficiente",5000)
  return { success = false} 
end

function lServer.buyProduct(productInfo)
  local source        = source 
  local user_id       = vRP.getUserId(source)
  local category      = productInfo.category
  local productTable  = cfg.products[category][productInfo.index]
  if not user_id then 
    print('SOURCE: '..source..' ID NOT DETECTED! ')
    return {success = false  }
  end
  if productTable and cachedCoins[user_id] then 
    if cachedCoins[user_id] - productTable.price < 0 then 
      TriggerClientEvent("Notify",source,"vermelho","Saldo insuficiente",5000)
      return { success = false} 
    end
    if cachedCoins[user_id] <  productTable.price then 
          TriggerClientEvent("Notify",source,"vermelho","Saldo insuficiente",5000)
          return { success = false} 
    else       
          TriggerClientEvent("Notify",source,"verde","Você comprou uma " ..productTable.name ,5000)
    end 

    vRP._execute('uf/updateCoins',{user_id = user_id, coins = cachedCoins[user_id] - productTable.price})
    cachedCoins[user_id] = cachedCoins[user_id] - productTable.price
    vRP.giveInventoryItem(user_id, productTable.idname, 1,true)
    sendToDiscord(cfg.webhooks.buy,"user_id **"..user_id.."** get item! (**"..productTable.name.."**) value **"..productTable.price.." coins** temp? "..((productTable.temporary and productTable.temporary.enable) and 'y *('..productTable.temporary.days..'d)*' or 'n').." ")

    if cfg.roulette.types[productTable.productType] then 
      cfg.roulette.types[productTable.productType]({
        src = source,
        user_id = user_id, 
        model = productTable.model, 
        idname = productTable.idname,
        amount = productTable.amount,
        info = productTable.additionalData,
        ammo = productTable.ammo,
      })
    end

    if productTable.temporary and productTable.temporary.enable then 
      addExpirateProduct(user_id,{
        type = "buy",
        category = category,
        index = productInfo.index
      },os.time()+productTable.temporary.days)
    end

    return {success = true, coins = cachedCoins[user_id] or 0 }
  else 
    print('Informacao nao batendo -> ',json.encode(productInfo,{indent = true}), "> cachedCoins[user_id] = ",json(encode(cachedCoins[user_id] or {})))
    return {success = false  }
    
  end

end

RegisterCommand(cfg.commands.admin.give.command, function(source,args) 
  local source = source 
  local user_id = vRP.getUserId(source)
  if not args or not args[1] or tonumber(args[1]) <= 0 or not args[2] or tonumber(args[2]) <= 0 then 
    TriggerClientEvent("Notify", source, "vermelho","Correctly: /"..cfg.commands.admin.give.command.." [id] [quantidade]")
    return false
  end
  if vRP.hasPermission(user_id,cfg.commands.admin.give.permission) then 
    local nuser_id = tonumber(args[1])
    local coins = tonumber(args[2])
    vRP._execute('uf/giveCoins',{user_id = nuser_id, coins = coins})
    if cachedCoins[nuser_id] then cachedCoins[nuser_id] =cachedCoins[nuser_id] + coins end
    local nplayer = vRP.getUserSource(nuser_id)
    if nplayer then 
      lClient._updateCoin(nplayer,cachedCoins[nuser_id])
    end
    sendToDiscord(cfg.webhooks.commands,"STAFF **"..user_id.."** ADD **"..coins.." coins** TO **"..nuser_id.."**")
    TriggerClientEvent("Notify", source, "verde",'+'..coins..' ADD TO '..nuser_id)
    -- TriggerClientEvent("Notify", "verde", '+'..coins..' ADD TO '..nuser_id)
  end
end)

local lastGive = nil
RegisterCommand(cfg.commands.admin.giveall.command, function(source,args) 
  local source = source 
  local user_id = vRP.getUserId(source)
  if not args or not args[1] or tonumber(args[1]) <= 0 then 
    TriggerClientEvent("Notify", source, "vermelho","Uso correto: /"..cfg.commands.admin.giveall.command.." [quantidade]")
    return false
  end
  if vRP.hasPermission(user_id,cfg.commands.admin.giveall.permission) then 
    if lastGive and os.time() - lastGive < 60 then 
      local ok = vRP.request(source,cfg.lang.cooldown_warning,15)
      if not ok then 
        TriggerClientEvent("Notify", source, "vermelho","Ação cancelada.")
        return false 
      end
    end
    local coins = tonumber(args[1])
    for id,src in pairs(vRP.getUsers()) do 
      vRP._execute('uf/giveCoins',{user_id = id, coins = coins})
      if cachedCoins[id] then cachedCoins[id] = cachedCoins[id] + coins end
      lClient._updateCoin(src,cachedCoins[id])
    end
    TriggerClientEvent("Notify", -1, "verde", "+"..coins.." "..cfg.coinName.."!")
    sendToDiscord(cfg.webhooks.commands,"STAFF **"..user_id.."** GIVE **"..coins.." coins** TO ALL!")
  end
end)

RegisterCommand(cfg.commands.admin.remove.command, function(source,args) 
  local source = source 
  local user_id = vRP.getUserId(source)
  if not args or not args[1] or tonumber(args[1]) <= 0 or not args[2] or tonumber(args[2]) <= 0 then 
    TriggerClientEvent("Notify", source, "vermelho","CORRECT: /"..cfg.commands.admin.remove.command.." [id] [quantidade]")
    return false
  end
  if vRP.hasPermission(user_id,cfg.commands.admin.remove.permission) then 
    local nuser_id = tonumber(args[1])
    local coins = tonumber(args[2])
    if cachedCoins[nuser_id] and cachedCoins[nuser_id] - coins >= 0 then cachedCoins[nuser_id] = cachedCoins[nuser_id] - coins end
    vRP._execute('uf/removeCoins',{user_id = nuser_id, coins = coins})
    local nplayer = vRP.getUserSource(nuser_id)
    if nplayer then 
      lClient._updateCoin(nplayer,cachedCoins[nuser_id])
    end
    sendToDiscord(cfg.webhooks.commands,"O administrador **"..user_id.."** removeu **"..coins.." coins** do usuário **"..nuser_id.."**")
    TriggerClientEvent("Notify", "verde", '-'..coins..' para o usuário '..nuser_id)
  end
end)

RegisterNetEvent("uf-coins:updateGive",function(id,amount)
  if cachedCoins[id] then 
    cachedCoins[id] = cachedCoins[id] + amount 
    local nplayer = vRP.getUserSource(id)
    if nplayer then 
      lClient._updateCoin(nplayer,cachedCoins[id])
    end
  end
end)

RegisterCommand(cfg.commands.admin.set.command, function(source,args) 
  local source = source 
  local user_id = vRP.getUserId(source)
  if not args or not args[1] or tonumber(args[1]) <= 0 or not args[2] or tonumber(args[2]) <= 0 then 
    TriggerClientEvent("Notify", source, "vermelho","CORRECT: /"..cfg.commands.admin.set.command.." [id] [quantidade]")
    return false
  end
  if vRP.hasPermission(user_id,cfg.commands.admin.set.permission) then 
    local nuser_id = tonumber(args[1])
    local coins = tonumber(args[2])
    vRP._execute('uf/updateCoins',{user_id = nuser_id, coins = coins})
    if cachedCoins[nuser_id] then cachedCoins[nuser_id] =  coins end
    local nplayer = vRP.getUserSource(nuser_id)
    if nplayer then 
      lClient._updateCoin(nplayer,cachedCoins[nuser_id])
    end
    sendToDiscord(cfg.webhooks.commands,"O administrador **"..user_id.."** setou **"..coins.." coins** do usuário **"..nuser_id.."**")

    TriggerClientEvent("Notify", source,"verde", 'Setado '..coins..' para o usuário '..nuser_id)
  end
end)

function sendMessage(msgData)
  local source = source 
  local user_id = vRP.getUserId(source)
  if string.match(msgData.message,"nome") or string.match(msgData.message,"sobrenome") then 
    
    local identity = vRP.query("characters/getUsers",{ id = user_id })
    if name then 
      msgData.message = msgData.message:gsub("{nome}",name)
      msgData.message =  msgData.message:gsub("{sobrenome}",name2)
    end
  end
  msgData.message = msgData.message:gsub("{amount}",msgData.amount)
  TriggerClientEvent('chat:addMessage', -1, {
    template = cfg.actions.chat_template,
    args = { msgData.message }
  })
end