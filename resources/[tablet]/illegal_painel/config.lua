----------------------------------------------------------------
--                  DESENVOLVIDO POR REIS                     --
--                       TOKYO STORE                          --
--                        RS_GROUPS                           --
----------------------------------------------------------------
-- [TERMOS]
-- Não oferecemos reembolso por se tratar de um produto digital.
-- Caso algum cliente disponibilize nosso produto de forma gratuita (vazando o mesmo) ele perderá a licença e suporte de todos os produtos comprados na loja.
-- Qualquer tentativa de vazamento, o nosso avançado sistema de autenticação irá ser ativado enviando uma log para o Reis e sua licença será removida
-- É proibido vender a licença de nossos produtos. Caso o mesmo aconteça você perderá a licença e suporte do produto. (Ex: minha cidade fechou e vou vender o script da Tokyo Store que tinha comprado.
-- Nosso suporte é dedicado a bugs, ou seja qualquer alteração que o cliente desejar será necessário a abertura de um orçamento para o mesmo.
Config = {} -- deixar aqui importante para o funcionamento da config

Config.blocklist =
    { -- aqui irão ficar todos os outros grupos que não usam o painel porém são empregos com carteira assinada
        "Jornal"
    }

Config.notify = "Notify"

Config.notify_sucesso = "verde"

Config.notify_erro = "vermelho"

Config.notify_debito = "verde"

Config.notify_credito = "verde"

Config.printbau = true

--[[ Config.licenca = "" -- licenca que deve ser obtida através do comando .ativar ]] ---- 76.07,-37.29,80.32

Config.webhooks = {
    demitir = "https://discord.com/api/webhooks/1022155288209543198/f1mpVts3limhqziKUnTcRlkZfmtSfUSG0opXxdsgLCjMXAwmsbC2b0Qk6FbKVYhuSRBs",
    promover = "https://discord.com/api/webhooks/1022155464529682463/1K4EH6XTfurQUYymSjxaMphOsmiBQDiUZjqTFktxIIVjlCMOTkOa0-sPuVsMxXpNhbta",
    contratar = "https://discord.com/api/webhooks/1022155589511553124/Chkaa0dUgoZWzw-ktDQZkIh9xmywypVUaJhcqbI7nexb8APPdjM9NbpKgtXCZak3MK27",
    bau = "https://discord.com/api/webhooks/1022155733720113272/3DFSEfMizMXaUS1rpMaS0QqVJNVPSNbuU-afwne_CMGJfn6lc47v722dcLr0HsWMvuMF",
    banco = "https://discord.com/api/webhooks/1119054658854461440/S8OP3RY-rRgnV5SJb4dlrEn40RfeO_cGnlyoJPku6tHX9tAV8Q2ck5SjuL85b-AfQDYZ"
}

Config.Cargo = {

    ["HPDiretor"] = {grupo = "HP", cargo = "Diretor"},
    ["HPMedico"] = {grupo = "HP", cargo = "Medico"},
    ["HPParamedic"] = { grupo = "HP", cargo = "Paramedico"},

    ["PoliceComando"] = {grupo = "Police", cargo = "Comando"},
    ["PoliceSargento"] = {grupo = "Police", cargo = "Sargento"},
    ["PoliceSoldado"] = { grupo = "Police", cargo = "Soldado"},
    ["PoliceRecruta"] = { grupo = "Police", cargo = "Recruta"},

    ["MechanicLider"] = {grupo = "Mechanic", cargo = "Lider"},
    ["MechanicGerente"] = {grupo = "Mechanic", cargo = "Gerente"},
    ["MechanicMembro"] = { grupo = "Mechanic", cargo = "Membro"},

    ["BurgershotLider"] = {grupo = "Burgershot", cargo = "Lider"},
    ["BurgershotGerente"] = {grupo = "Burgershot", cargo = "Gerente"},
    ["BurgershotMembro"] = { grupo = "Burgershot", cargo = "Membro"},    

    ["ObeyLider"] = {grupo = "Obey", cargo = "Lider"},
    ["ObeyGerente"] = {grupo = "Obey", cargo = "Gerente"},
    ["ObeyMembro"] = { grupo = "Obey", cargo = "Membro"},
    
    ["BunkerLider"] = {grupo = "Bunker", cargo = "Lider"},
    ["BunkerGerente"] = {grupo = "Bunker", cargo = "Gerente"},
    ["BunkerMembro"] = { grupo = "Bunker", cargo = "Membro"},

    ["BallasLider"] = {grupo = "Ballas", cargo = "Lider"},
    ["BallasGerente"] = {grupo = "Ballas", cargo = "Gerente"},
    ["BallasMembro"] = { grupo = "Ballas", cargo = "Membro"},

    ["YakuzaLider"] = {grupo = "Yakuza", cargo = "Lider"},
    ["YakuzaGerente"] = {grupo = "Yakuza", cargo = "Gerente"},
    ["YakuzaMembro"] = { grupo = "Yakuza", cargo = "Membro"},

    ["VagosLider"] = {grupo = "Vagos", cargo = "Lider"},
    ["VagosGerente"] = {grupo = "Vagos", cargo = "Gerente"},
    ["VagosMembro"] = { grupo = "Vagos", cargo = "Membro"},

    ["MafiavinhedoLider"] = {grupo = "Mafiavinhedo", cargo = "Lider"},
    ["MafiavinhedoGerente"] = {grupo = "Mafiavinhedo", cargo = "Gerente"},
    ["MafiavinhedoMembro"] = { grupo = "Mafiavinhedo", cargo = "Membro"}
}

Config.grupos = {

    ["East Customs"] = { -- inicio de um grupo
        config = {
            foto = "https://cdn.discordapp.com/attachments/1020044589761036328/1036669683866288218/eastcustoms.png", -- link direto da imagem que será a foto do grupo (A proporção deve ser 1:1 ou seja 1080x1080 / 1000x1000)
            bau = "chest:Mechanic" -- nome do bau que vai ser criado com o comando createChest
        },
        grupos = {
            ["Líder"] = {grupo = "MechanicLider", org = "Mechanic", titulo = "Líder"}, -- grupo -> igual ao do group id grupo | titulo -> um titulo mais bonito para gerar mais imesão na NUI
            ["Membros"] = {
                -- aqui irão ficar todos os grupos dos membros que não sao líderes, esses grupos devem ser numerados sempre respeitando que o grupo base deve ser o número 1
                       [2] = {grupo = "MechanicGerente", org = "Mechanic", titulo = "Gerente"},
                       [1] = {grupo = "MechanicMembro", org = "Mechanic", titulo = "Membro"}
            }
        }
    }, -- final de um grupo

    ["Burgershot"] = { -- inicio de um grupo
        config = {
            foto = "https://cdn.discordapp.com/attachments/1020044589761036328/1036669683459436715/burgershot.png", -- link direto da imagem que será a foto do grupo (A proporção deve ser 1:1 ou seja 1080x1080 / 1000x1000)
            bau = "chest:Burgershot" -- nome do bau que vai ser criado com o comando createChest
    },
        grupos = {
            ["Líder"] = {grupo = "BurgershotLider", org = "Burgershot", titulo = "Líder"}, -- grupo -> igual ao do group id grupo | titulo -> um titulo mais bonito para gerar mais imesão na NUI
            ["Membros"] = {
        -- aqui irão ficar todos os grupos dos membros que não sao líderes, esses grupos devem ser numerados sempre respeitando que o grupo base deve ser o número 1
                        [2] = {grupo = "BurgershotGerente", org = "Burgershot", titulo = "Gerente"},
                        [1] = {grupo = "BurgershotMembro", org = "Burgershot", titulo = "Membro"}
            }
        }
    }, -- final de um grupo)    

    ["Cuf Hospital"] = { -- inicio de um grupo
         config = {
            foto = "https://cdn.discordapp.com/attachments/1020044589761036328/1039270377236467793/CUF.png", -- link direto da imagem que será a foto do grupo (A proporção deve ser 1:1 ou seja 1080x1080 / 1000x1000)
            bau = "chest:Paramedic" -- nome do bau que vai ser criado com o comando createChest
    },
        grupos = {
            ["Líder"] = {grupo = "HPDiretor", org = "HP", titulo = "Diretor"}, -- grupo -> igual ao do group id grupo | titulo -> um titulo mais bonito para gerar mais imesão na NUI
            ["Membros"] = {
        -- aqui irão ficar todos os grupos dos membros que não sao líderes, esses grupos devem ser numerados sempre respeitando que o grupo base deve ser o número 1
                        [2] = {grupo = "HPMedico", org = "HP", titulo = "Medico"}, -- esse seria o rank mais alto do grupo pois ele acompanha o maior número junto com ele
                        [1] = {grupo = "HPParamedic", org = "HP", titulo = "Paramedico"},
            }
        }
    }, -- final de um grupo)    

    ["Motoclub"] = { -- inicio de um grupo
        config = {
            foto = "https://cdn.discordapp.com/attachments/1020044589761036328/1109722638340853861/motoclub.png", -- link direto da imagem que será a foto do grupo (A proporção deve ser 1:1 ou seja 1080x1080 / 1000x1000)
            bau = "chest:Motoclub" -- nome do bau que vai ser criado com o comando createChest
    },
    grupos = {
            ["Líder"] = {grupo = "MotoclubLider", org = "Motoclub", titulo = "Líder"}, -- grupo -> igual ao do group id grupo | titulo -> um titulo mais bonito para gerar mais imesão na NUI
            ["Membros"] = {
                -- aqui irão ficar todos os grupos dos membros que não sao líderes, esses grupos devem ser numerados sempre respeitando que o grupo base deve ser o número 1
                        [2] = {grupo = "MotoclubGerente", org = "Motoclub", titulo = "Gerente"},
                        [1] = {grupo = "MotoclubMembro", org = "Motoclub", titulo = "Membro"}
            }
        }
    }, -- final de um grupo   

    ["Crips"] = { -- inicio de um grupo
        config = {
            foto = "https://cdn.discordapp.com/attachments/1020044589761036328/1109697388349767700/crips.png", -- link direto da imagem que será a foto do grupo (A proporção deve ser 1:1 ou seja 1080x1080 / 1000x1000)
            bau = "chest:Crips" -- nome do bau que vai ser criado com o comando createChest
        },
        grupos = {
            ["Líder"] = {grupo = "CripsLider", org = "Crips", titulo = "Líder"}, -- grupo -> igual ao do group id grupo | titulo -> um titulo mais bonito para gerar mais imesão na NUI
            ["Membros"] = {
                -- aqui irão ficar todos os grupos dos membros que não sao líderes, esses grupos devem ser numerados sempre respeitando que o grupo base deve ser o número 1
                       [2] = {grupo = "CripsGerente", org = "Crips", titulo = "Gerente"},
                       [1] = {grupo = "CripsMembro", org = "Crips", titulo = "Membro"}
            }
        }
    }, -- final de um grupo    

    ["Obey"] = { -- inicio de um grupo
        config = {
            foto = "https://cdn.discordapp.com/attachments/1020044589761036328/1116913723685212160/obey.png", -- link direto da imagem que será a foto do grupo (A proporção deve ser 1:1 ou seja 1080x1080 / 1000x1000)
            bau = "chest:Obey" -- nome do bau que vai ser criado com o comando createChest
        },
        grupos = {
            ["Líder"] = {grupo = "ObeyLider", org = "Obey", titulo = "Líder"}, -- grupo -> igual ao do group id grupo | titulo -> um titulo mais bonito para gerar mais imesão na NUI
            ["Membros"] = {
                -- aqui irão ficar todos os grupos dos membros que não sao líderes, esses grupos devem ser numerados sempre respeitando que o grupo base deve ser o número 1
                       [2] = {grupo = "ObeyGerente", org = "Obey", titulo = "Gerente"},
                       [1] = {grupo = "ObeyMembro", org = "Obey", titulo = "Membro"}
            }
        }
    }, -- final de um grupo

    ["Bunker"] = { -- inicio de um grupo
        config = {
            foto = "https://cdn.discordapp.com/attachments/1020044589761036328/1036669682947719198/bunker.png", -- link direto da imagem que será a foto do grupo (A proporção deve ser 1:1 ou seja 1080x1080 / 1000x1000)
            bau = "chest:Bunker" -- nome do bau que vai ser criado com o comando createChest
        },
        grupos = {
            ["Líder"] = {grupo = "BunkerLider", org = "Bunker", titulo = "Líder"}, -- grupo -> igual ao do group id grupo | titulo -> um titulo mais bonito para gerar mais imesão na NUI
            ["Membros"] = {
            -- aqui irão ficar todos os grupos dos membros que não sao líderes, esses grupos devem ser numerados sempre respeitando que o grupo base deve ser o número 1
                       [2] = {grupo = "BunkerGerente", org = "Bunker", titulo = "Gerente"},
                       [1] = {grupo = "BunkerMembro", org = "Bunker", titulo = "Membro"}
            }
        }
    }, -- final de um grupo)

    ["Mafiavinhedo"] = { -- inicio de um grupo
        config = {
            foto = "https://cdn.discordapp.com/attachments/1020044589761036328/1120580764480847942/MafiaVinhedo.png", -- link direto da imagem que será a foto do grupo (A proporção deve ser 1:1 ou seja 1080x1080 / 1000x1000)
            bau = "chest:Mafiavinhedo" -- nome do bau que vai ser criado com o comando createChest
        },
        grupos = {
            ["Líder"] = {grupo = "MafiavinhedoLider",  org = "Mafiavinhedo", titulo = "Líder"}, -- grupo -> igual ao do group id grupo | titulo -> um titulo mais bonito para gerar mais imesão na NUI
            ["Membros"] = {
            -- aqui irão ficar todos os grupos dos membros que não sao líderes, esses grupos devem ser numerados sempre respeitando que o grupo base deve ser o número 1
                        [2] = {grupo = "MafiavinhedoGerente",  org = "Mafiavinhedo", titulo = "Gerente"},
                        [1] = {grupo = "MafiavinhedoMembro",  org = "Mafiavinhedo",  titulo = "Membro"}
            }
        }
    }, -- final de um grupo)

    ["Ballas"] = { -- inicio de um grupo
    config = {
        foto = "https://cdn.discordapp.com/attachments/1020044589761036328/1036669682029182976/ballas.png", -- link direto da imagem que será a foto do grupo (A proporção deve ser 1:1 ou seja 1080x1080 / 1000x1000)
        bau = "chest:Ballas" -- nome do bau que vai ser criado com o comando createChest
    },
        grupos = {
            ["Líder"] = {grupo = "BallasLider", org = "Ballas", xtitulo = "Líder"}, -- grupo -> igual ao do group id grupo | titulo -> um titulo mais bonito para gerar mais imesão na NUI
            ["Membros"] = {
        -- aqui irão ficar todos os grupos dos membros que não sao líderes, esses grupos devem ser numerados sempre respeitando que o grupo base deve ser o número 1
                        [2] = {grupo = "BallasGerente", org = "Ballas", titulo = "Gerente"},
                        [1] = {grupo = "BallasMembro", org = "Ballas", titulo = "Membro"}
            }
        }
    }, -- final de um grupo)

    ["Yakuza"] = { -- inicio de um grupo
    config = {
        foto = "https://cdn.discordapp.com/attachments/1020044589761036328/1036669684214398977/yakuza.png", -- link direto da imagem que será a foto do grupo (A proporção deve ser 1:1 ou seja 1080x1080 / 1000x1000)
        bau = "chest:Yakuza" -- nome do bau que vai ser criado com o comando createChest
    },
        grupos = {
            ["Líder"] = {grupo = "YakuzaLider", org = "Yakuza", titulo = "Líder"}, -- grupo -> igual ao do group id grupo | titulo -> um titulo mais bonito para gerar mais imesão na NUI
            ["Membros"] = {
        -- aqui irão ficar todos os grupos dos membros que não sao líderes, esses grupos devem ser numerados sempre respeitando que o grupo base deve ser o número 1
                        [2] = {grupo = "YakuzaGerente", org = "Yakuza", titulo = "Gerente"},
                        [1] = {grupo = "YakuzaMembro", org = "Yakuza", titulo = "Membro"}
            }
        }
    }, -- final de um grupo)

    ["Vagos"] = { -- inicio de um grupo
    config = {
        foto = "https://cdn.discordapp.com/attachments/1020044589761036328/1116927256858726490/vagos.png", -- link direto da imagem que será a foto do grupo (A proporção deve ser 1:1 ou seja 1080x1080 / 1000x1000)
        bau = "chest:Vagos" -- nome do bau que vai ser criado com o comando createChest
    },
        grupos = {
            ["Líder"] = {grupo = "VagosLider", org = "Vagos", titulo = "Líder"}, -- grupo -> igual ao do group id grupo | titulo -> um titulo mais bonito para gerar mais imesão na NUI
            ["Membros"] = {
        -- aqui irão ficar todos os grupos dos membros que não sao líderes, esses grupos devem ser numerados sempre respeitando que o grupo base deve ser o número 1
                        [2] = {grupo = "VagosGerente", org = "Vagos", titulo = "Gerente"},
                        [1] = {grupo = "VagosMembro", org = "Vagos", titulo = "Membro"}
            }
        }
    }, -- final de um grupo)

    ["Police Alameda"] = { -- inicio de um grupo
    config = {
        foto = "https://cdn.discordapp.com/attachments/1020044589761036328/1159233022286110781/Police.png", -- link direto da imagem que será a foto do grupo (A proporção deve ser 1:1 ou seja 1080x1080 / 1000x1000)
        bau = "chest:Police" -- nome do bau que vai ser criado com o comando createChest
    },
        grupos = {
            ["Líder"] = {grupo = "PoliceComando", org = "Police", titulo = "Comando"}, -- grupo -> igual ao do group id grupo | titulo -> um titulo mais bonito para gerar mais imesão na NUI
            ["Membros"] = {
        -- aqui irão ficar todos os grupos dos membros que não sao líderes, esses grupos devem ser numerados sempre respeitando que o grupo base deve ser o número 1
                        [3] = {grupo = "PoliceSargento", org = "Police", titulo = "Sargento"},
                        [2] = {grupo = "PoliceSoldado", org = "Police", titulo = "Soldado"},
                        [1] = {grupo = "PoliceRecruta", org = "Police", titulo = "Recruta"}
            }
        }
    } -- final de um grupo)   
}
