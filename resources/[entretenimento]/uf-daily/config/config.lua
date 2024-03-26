cfg = {}

cfg.command = "horas"

cfg.listOnePorcentage = 0.1 --ou false (Colocar na lista apenas itens raros.)

cfg.actions = {
  login = {
   -- chat_notify = {enable = true, message = "^7𝐒𝐄𝐉𝐀 𝐁𝐄𝐌 𝐕𝐈𝐍𝐃𝐎 𝐀𝐎 𝐄𝐕𝐄𝐍𝐓𝐎 𝐉𝐎𝐆𝐔𝐄 𝐌𝐀𝐈𝐒! 𝐏𝐀𝐑𝐀 𝐕𝐄𝐑 𝐎 𝐒𝐄𝐔 𝐒𝐓𝐀𝐓𝐔𝐒, 𝐃𝐈𝐆𝐈𝐓𝐄 /𝐇𝐎𝐑𝐀𝐒"},
   -- event_notify = {enable = false, message = "^7𝐒𝐄𝐉𝐀 𝐁𝐄𝐌 𝐕𝐈𝐍𝐃𝐎 𝐀𝐎 𝐄𝐕𝐄𝐍𝐓𝐎 𝐉𝐎𝐆𝐔𝐄 𝐌𝐀𝐈𝐒! 𝐏𝐀𝐑𝐀 𝐕𝐄𝐑 𝐎 𝐒𝐄𝐔 𝐒𝐓𝐀𝐓𝐔𝐒, 𝐃𝐈𝐆𝐈𝐓𝐄 /𝐇𝐎𝐑𝐀𝐒"},
  chat_notify = {enable = true, message = "🕒 Bem vindo(a) ao evento jogue mais! Para ver seu status, digite /horas 🕒"},
  event_notify = {enable = true, message = "Bem vindo(a) ao evento jogue mais! Para ver seu status, digite /horas"},
    sound_beep  = {enable = true}
  },
  reedemGift = {
    baloons = {enable = true}
  },
  chat_template = '<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(5, 40, 50,1) 3%, rgba(5, 40, 50,0) 95%);border-radius: 8px;">{0}</div>'
}


--[[
  Mínimo de raridade é 0.1;
]]

cfg.gifts = {
  ['4'] = {      -- Checkpoint de horas!
    [0.1] = { 
      globalMessage = {enable = true, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "WEAPON_BAT", name='Bastão de Beisebol', amount =  {min = 1, max = 2}},
      }
    },
    [0.4] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "lockpick", name='Lockpick', amount =  {min = 1, max = 2}},
      }
    },
    [0.6] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "dollars2", name='Dinheiro Sujo', amount =  {min = 15000, max = 30000}},
      }
    }
  },
  ['8'] = {
    [0.1 --[[Raridade do item]]] = { 
      globalMessage = {enable = true, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({amount} {item})🎉"},
      gifts = {
        {idname = "WEAPON_SPECIALCARBINE", name='G-36', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_ASSAULTRIFLE", name='AK-103', amount =  {min = 1, max = 1}},
      }
    }, 
    [0.2] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "WEAPON_PISTOL", name='M1911', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_PISTOL_MK2", name='Five-Seven', amount =  {min = 1, max = 1}},
      }
    },
    [0.6] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "WEAPON_BAT", name='Taco de Beisebol', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_SWITCHBLADE", name='Canivete', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_CROWBAR", name='Pé de Cabra', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_KNUCKLE", name='Soco Inglês', amount =  {min = 1, max = 1}},
      }
    },
    [0.8] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "lockpick", name='Lockpick', amount =  {min = 1, max = 5}},
      }
    },
    [0.9] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "dollars2", name='Dinheiro Sujo', amount =  {min = 35000, max = 45000}},
      }
    }
  },
  ['12'] = {
    [0.1 --[[Raridade do item]]] = { 
      globalMessage = {enable = true, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({amount} {item})🎉"},
      gifts = {
        {idname = "WEAPON_ASSAULTRIFLE", name='AK-103', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_SPECIALCARBINE", name='G-36', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_ASSAULTSMG", name='Steyr AUG', amount =  {min = 1, max = 1}},
      }
    }, 
    [0.2] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "WEAPON_PISTOL", name='M1911', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_PISTOL_MK2", name='Five-Seven', amount =  {min = 1, max = 1}},
      }
    },
    [0.5] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "WEAPON_BAT", name='Taco de Beisebol', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_SWITCHBLADE", name='Canivete', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_CROWBAR", name='Pé de Cabra', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_KNUCKLE", name='Soco Inglês', amount =  {min = 1, max = 1}},
      }
    },
    [0.7] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "lockpick", name='Lockpick', amount =  {min = 2, max = 6}},
      }
    },
    [0.8] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "dollars2", name='Dinheiro Sujo', amount =  {min = 40000, max = 50000}},
      }
    }
  },
  ['16'] = {
    [0.1 --[[Raridade do item]]] = { 
      globalMessage = {enable = true, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({amount} {item})🎉"},
      gifts = {
        {idname = "WEAPON_ASSAULTRIFLE", name='AK-103', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_SPECIALCARBINE", name='G-36', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_ASSAULTSMG", name='Steyr AUG', amount =  {min = 1, max = 1}},
      }
    }, 
    [0.2] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "WEAPON_PISTOL", name='M1911', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_PISTOL_MK2", name='Five-Seven', amount =  {min = 1, max = 1}},
      }
    },
    [0.6] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "WEAPON_BAT", name='Taco de Beisebol', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_SWITCHBLADE", name='Canivete', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_CROWBAR", name='Pé de Cabra', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_KNUCKLE", name='Soco Inglês', amount =  {min = 1, max = 1}},
      }
    },
    [0.8] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "lockpick", name='Lockpick', amount =  {min = 3, max = 7}},
      }
    },
    [0.9] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "dollars2", name='Dinheiro Sujo', amount =  {min = 45000, max = 70000}},
      }
    }
  },
  ['20'] = {
    [0.1 --[[Raridade do item]]] = { 
      globalMessage = {enable = true, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({amount} {item})🎉"},
      gifts = {
        {idname = "WEAPON_ASSAULTRIFLE", name='AK-103', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_SPECIALCARBINE", name='G-36', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_ASSAULTSMG", name='Steyr AUG', amount =  {min = 1, max = 1}},
      }
    }, 
    [0.2] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "WEAPON_PISTOL", name='M1911', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_PISTOL_MK2", name='Five-Seven', amount =  {min = 1, max = 1}},
      }
    },
    [0.6] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "WEAPON_BAT", name='Taco de Beisebol', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_SWITCHBLADE", name='Canivete', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_CROWBAR", name='Pé de Cabra', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_KNUCKLE", name='Soco Inglês', amount =  {min = 1, max = 1}},
      }
    },
    [0.7] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "wammo|WEAPON_PISTOL_MK2", name='M F.Seven', amount =  {min = 70, max = 150}},
      }
    },
    [0.9] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "dollars2", name='Dinheiro Sujo', amount =  {min = 50000, max = 75000}},
      }
    }
  },
  ['24'] = {
    [0.1 --[[Raridade do item]]] = { 
      globalMessage = {enable = true, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({amount} {item})🎉"},
      gifts = {
        {idname = "WEAPON_ASSAULTRIFLE", name='AK-103', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_SPECIALCARBINE", name='G-36', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_ASSAULTSMG", name='Steyr AUG', amount =  {min = 1, max = 1}},
      }
    }, 
    [0.2] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "WEAPON_PISTOL", name='M1911', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_PISTOL_MK2", name='Five-Seven', amount =  {min = 1, max = 1}},
      }
    },
    [0.3] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "WEAPON_BAT", name='Taco de Beisebol', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_SWITCHBLADE", name='Canivete', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_CROWBAR", name='Pé de Cabra', amount =  {min = 1, max = 1}},
        {idname = "WEAPON_KNUCKLE", name='Soco Inglês', amount =  {min = 1, max = 1}},
      }
    },
    [0.5] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "wammo|WEAPON_PISTOL_MK2", name='M F.Seven', amount =  {min = 100, max = 200}},
      }
    },
    [0.7] = { 
      globalMessage = {enable = false, message= "🎉{nome} {sobrenome} pegou um item raro no Jogue Mais! ({item})🎉"},
      gifts = {
        {idname = "dollars2", name='Dinheiro Sujo', amount =  {min = 60000, max = 80000}},
      }
    }
  },

}

cfg.initialAutoStart = true     -- Registrar o primeiro ciclo diário automaticamente, após iniciar a resource.
cfg.adminCommand = 'iniciar_evento' -- Isso só podera ser executado pelo console. (/iniciar_evento)

cfg.webhooks = {
  weekEnd = 'https://discord.com/api/webhooks/1018731008654331914/SLp0BBs2zaXegQO2UUX0MD1BuKLJbx-ZAnR87lnRUPCHTjpP7KlFpXG8-vGnHJ7pH8R4',
  log = 'https://discord.com/api/webhooks/1018736346875039744/z-fvniflg85Lk5eWgdHa4fEUauDQ5ZONvNIoxnvenQ9xtTgTw8iIU0YP1QPW8bn43d9h',
  reportbug = 'https://discord.com/api/webhooks/1018731254239199264/migbMZNfe5fQLXZGPZHtUQRUKS5IgceDa5b3EXwZvmhmIXCaOyl-k3rEvB1Agv2U56mS',
  reedemGift = 'https://discord.com/api/webhooks/1018731326670651402/5_LjrVlQHXW6tsG-BqfxOfjX0fZoKPnhaAzTbb81byZo2MEDSqM1pbwmA-qvYoUMWUbP',
  info = {
    title  = 'Jogue mais Ganhe Mais',
    footer = 'UF-DAILY'
  }
}

cfg.identity = {
  sobrenome = "name2", --[[ Nome do campo de sobrenome, nome baseado nas tabelas.]]
  nome      = "name",
}

cfg.nui = {
  nextGift = 'PROXIMA PREMIAÇÃO',
  actualGift = 'PREMIAÇÃO ATUAL',
  percentList = 'CHANCE DE GANHAR',
  title = 'RECOMPENSAS DIARIAS',
  hoursDesc = 'Horas Jogadas',
  reedemButton = 'Receber'
} 
cfg.enviaMsg  = true
return cfg