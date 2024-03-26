cfg = cfg or {}

cfg.storeUrl = "https://discord.gg/NHyffzKm6e"

cfg.columnName = "coins"

cfg.commands = {
  openUi = "loja" --[[ /loja ]],
  admin = {
    give = {
      command = "givecoin",
      permission = "Admin"
    },
    remove = {
      command = "removecoin",
      permission = "Admin"
    },
    set = {
      command = "setcoin",
      permission = "Admin"
    },
    giveall = {
      command = "coinstoall",
      permission = "Admin",
    }
  }
}

cfg.roulette = {
  price = 250,
  types = {
    ["lendario"] = {
      porcent = 0.1,
      notifyAll = {
        chat = {
          enabled = true,
          message = "{nome} {sobrenome} pegou um item LENDÁRIO na Roleta da Sorte! ({item})",
          chat_template = '<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(255, 200, 0, 1) 3%, rgba(46, 128, 255,0) 95%);border-radius: 5px;">{0}</div>'
        }, 
        notify = false
      },
    },
    ["epico"] = {
      porcent = 0.2,
      notifyAll = {
        chat = {
          enabled = true,
          message = "{nome} {sobrenome} pegou um item ÉPICO na Roleta da Sorte! ({item})",
          chat_template = '<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(255, 0, 43, 0.8) 3%, rgba(46, 128, 255,0) 95%);border-radius: 5px;">{0}</div>'
        }, 
        notify = false
      },
    },
    ["raro"] = {
      porcent = 0.6,
      notifyAll = {
        chat = {
          enabled = true,
          chat_template = '<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, #00ddff 3%, rgba(46, 128, 255,0) 95%);border-radius: 5px;">{0}</div>',
          message = "{nome} {sobrenome} pegou um item RARO na Roleta da Sorte! ({item})"
        }, 
        notify = false
      },
    },
    ["normal"] = {
      porcent = 30.0,
      notifyAll = {
        chat = {
          chat_template = '<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(42,255,142,1) 3%, rgba(46, 128, 255,0) 95%);border-radius: 5px;">{0}</div>',
          enabled = false,
          message = "{nome} {sobrenome} pegou um item NORMAL na Roleta da Sorte! ({item})"
        }, 
        notify = false
      },
    }
  },
  items = {
      {
        productType = "item",
        idname = "fichas",
        name = "50 Fichas",
        amount = 50,
        type = "normal",
      }, 
      {
        productType = "item",
        idname = "vale50bela",
        name = "Vale R$50.000",
        amount = 50000,
        type = "raro",
      }, 
      {
        productType = "item",
        idname = "vale75bela",
        name = "Vale R$75.000",
        amount = 75000,
        type = "raro",
      },
      {
        productType = "item",
        idname = "vale100bela",
        name = "Vale R$100.000",
        amount = 100000,
        type = "epico",
      },
      {
        productType = "item",
        idname = "vale125bela",
        name = "Vale R$125.000",
        amount = 125000,
        type = "epico",
      },
      {
        productType = "item",
        idname = "vale150bela",
        name = "Vale R$150.000",
        amount = 150000,
        type = "epico",
      },
      {
        productType = "item",
        idname = "vale200bela",
        name = "Vale R$200.000",
        amount = 200000,
        type = "lendario",
      },
      {
        productType = "item",
        idname = "vale300bela",
        name = "Vale R$300.000",
        amount = 300000,
        type = "lendario",
      },
      {
        productType = "item",
        idname = "vale500bela",
        name = "Vale R$500.000",
        amount = 500000,
        type = "lendario",
      },
  }
}


cfg.coinName = 'coins'

cfg.products = {
  ["Itens"] = {
    {
      productType = "item",
      idname = "gemstone",
      amount = 1,
      name = "Gema",
      price = 500,
    },
    {
      productType = "item",
      idname = "lockpick",
      amount = 1,
      name = "Lockpick",
      price = 250,
    },
    {
      productType = "item",
      idname = "WEAPON_PISTOL_MK2",
      amount = 1,
      name = "Five Seven",
      price = 2500,
    },
    {
      productType = "item",
      idname = "WEAPON_SAWNOFFSHOTGUN",
      amount = 1,
      name = "Mossberg 500",
      price = 7000,
    },
    {
      productType = "item",
      idname = "WEAPON_PISTOL_AMMO",
      amount = 1,
      name = "Muni Pistola",
      price = 100,
    },
    {
      productType = "item",
      idname = "WEAPON_SHOTGUN_AMMO",
      amount = 1,
      name = "Muni Escopeta",
      price = 250,
    },
    {
      productType = "item",
      idname = "tablet",
      amount = 1,
      name = "Tablet",
      price = 50,
    },
    {
      productType = "item",
      idname = "rope",
      amount = 1,
      name = "Corda",
      price = 50,
    }
  },
}

cfg.imagesUrl = "./images/"


cfg.identity = {
  sobrenome = "name2", --[[ Nome do campo de sobrenome, nome baseado nas tabelas.]]
  nome      = "name",
}


cfg.onlyNotifyPlayersOnStore = true --

cfg.webhooks = {
  buy = "https://discord.com/api/webhooks/1119053713722589244/2nmxcs6wVuuLYJML0LZU44oKc6qEQ0oW2OfIuCymRWWY_IugxKtPKGpSENKoeL9V2C4C",
  roulette = "https://discord.com/api/webhooks/1119053093259190281/oKQe_ZKAebm8UdEvxYpXDwDb8Ax0093EwfZXrQk7cmOiqBSbkGnwWI2FQ-Cu4f5WT8DT",
  commands = "https://discord.com/api/webhooks/1019846394665783356/av53R_j4Jf-jmC9zecCbRrEE57qHqgntehkOq7GaUaWt44CqfTxrggVvTKgrIniBjrMi",
  onremove = "https://discord.com/api/webhooks/1019846485329846272/WHJ3iSfEdjNC4YjoYqNQis61qYQ4NX2OtqdZJIa7lHyBNlw1aIKlZYPU9diMwjry2L-3",
  info = {
    title  = 'Coins',
    footer = ''
  }
}

return cfg