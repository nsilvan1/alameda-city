-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
	["casino_ticket"] = {
		["index"] = "casino_ticket",
		["name"] = "Ticket de Cassino",
		["desc"] = "<green>Usado para roleta do Cassino</green>",
		["type"] = "Usável",
		["weight"] = 0.0
	},
	["fichas"] = {
		["index"] = "fichas",
		["name"] = "Fichas",
		["desc"] = "<green>Usado para Apostas</green>",
		["type"] = "Usável",
		["weight"] = 0.0
	},
	["coins"] = {
		["index"] = "coins",
		["name"] = "Himalaia Coins",
		["desc"] = "<green>Usado para compra de item e aposta</green>",
		["type"] = "Usável",
		["weight"] = 0.0
	},
	["tablet"] = {
		["index"] = "tablet",
		["name"] = "Tablet",
		["desc"] = "<green>Tablet de Administração</green>",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 0.2
	},
	["badge01"] = {
		["index"] = "badge01",
		["name"] = "Distintivo",
		["desc"] = "Divisão: <green>Agente Speed</green>",
		["type"] = "Usável",
		["weight"] = 0.0
	},
	["badge02"] = {
		["index"] = "badge02",
		["name"] = "Distintivo",
		["desc"] = "Divisão: <green>Agente de Assuntos Internos</green>",
		["type"] = "Usável",
		["weight"] = 0.0
	},
	["badge03"] = {
		["index"] = "badge03",
		["name"] = "Distintivo",
		["desc"] = "<green>Agente Tático Especial</green>",
		["type"] = "Usável",
		["weight"] = 0.0
	},
	["badge04"] = {
		["index"] = "badge04",
		["name"] = "Distintivo",
		["desc"] = "<green>Agente de Emergencia Médica</green>",
		["type"] = "Usável",
		["weight"] = 0.0
	},
	["badge05"] = {
		["index"] = "badge05",
		["name"] = "Distintivo",
		["desc"] = "<green>Agente de Departamento de Correções</green>",
		["type"] = "Usável",
		["weight"] = 0.0
	},
	["badge06"] = {
		["index"] = "badge06",
		["name"] = "Distintivo",
		["desc"] = "<green>Agente de Operações de Treinamento</green>",
		["type"] = "Usável",
		["weight"] = 0.0
	},
	["badge07"] = {
		["index"] = "badge07",
		["name"] = "Distintivo",
		["desc"] = "<green>Agente do Departamento de Los Santos</green>",
		["type"] = "Usável",
		["weight"] = 0.0
	},
	["badge08"] = {
		["index"] = "badge08",
		["name"] = "Distintivo",
		["desc"] = "<green>Agente de Operações de Patrulha</green>",
		["type"] = "Usável",
		["weight"] = 0.0
	},
	["badge09"] = {
		["index"] = "badge09",
		["name"] = "Distintivo",
		["desc"] = "<green>Agente de Departamento de Detetives</green>",
		["type"] = "Usável",
		["weight"] = 0.0
	},
	["badge10"] = {
		["index"] = "badge10",
		["name"] = "Distintivo",
		["desc"] = "<green>Agente de Conselho Honorário</green>",
		["type"] = "Usável",
		["weight"] = 0.0
	},
	["mushroomtea"] = {
		["index"] = "mushroomtea",
		["name"] = "Chá de Cogumelo",
		["desc"] = "Tempo pedalando reduzido para <green>10 minutos</green> por <green>60 minutos</green>, lembrando que o efeito passa desconectando da cidade.",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.75
	},
	["miner"] = {
		["index"] = "miner",
		["name"] = "Mineradora",
		["type"] = "Usável",
		["weight"] = 25.0
	},
	["cryptocoins"] = {
		["index"] = "cryptocoins",
		["name"] = "Criptomoeda",
		["desc"] = "Cotação atual da moeda: <blue>$0,23148</blue>",
		["type"] = "Comum",
		["weight"] = 0.0
	},
	["seaweed"] = {
		["index"] = "seaweed",
		["name"] = "Alga Marinha",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["nigirizushi"] = {
		["index"] = "nigirizushi",
		["name"] = "Nigirizushi",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.45,
		["scape"] = true,
		["max"] = 100
	},
	["sushi"] = {
		["index"] = "sushi",
		["name"] = "Sushi",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.45,
		["scape"] = true,
		["max"] = 100
	},
	["cupcake"] = {
		["index"] = "cupcake",
		["name"] = "Cupcake",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.45,
		["scape"] = true,
		["max"] = 100
	},
	["cappuccino"] = {
		["index"] = "cappuccino",
		["name"] = "Moccaccino",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.55,
		["scape"] = true,
		["max"] = 100
	},
	["applelove"] = {
		["index"] = "applelove",
		["name"] = "Maça do Amor",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.55,
		["scape"] = true,
		["max"] = 100
	},
	["credential"] = {
		["index"] = "credential",
		["name"] = "Credencial",
		["desc"] = "Ticket de corrida",
		["type"] = "Comum",
		["weight"] = 0.75
	},
	["ticket_tunagem"] = {
		["index"] = "ticket_tunagem",
		["name"] = "Ticket de Tunagem",
		["desc"] = "Usado para realizar tunagem de veículo na Los Santos Customs",
		["type"] = "Comum",
		["weight"] = 0.75
	},
	["bucket"] = {
		["index"] = "bucket",
		["name"] = "Balde",
		["type"] = "Comum",
		["weight"] = 0.50
	},
	["capsula"] = {
		["index"] = "capsula",
		["name"] = "capsula",
		["type"] = "Comum",
		["weight"] = 0.50
	},
	["polvora"] = {
		["index"] = "polvora",
		["name"] = "Pólvora",
		["type"] = "Comum",
		["weight"] = 0.50
	},
	["scanner"] = {
		["index"] = "scanner",
		["name"] = "Scanner",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 5.00
	},
	["nitro"] = {
		["index"] = "nitro",
		["name"] = "Nitro",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 10.00
	},
	["postit"] = {
		["index"] = "postit",
		["name"] = "Post-It",
		["type"] = "Usável",
		["weight"] = 0.10
	},
	["attachsFlashlight"] = {
		["index"] = "attachsFlashlight",
		["name"] = "Lanterna Tatica",
		["type"] = "Usável",
		["weight"] = 0.75
	},
	["attachsCrosshair"] = {
		["index"] = "attachsCrosshair",
		["name"] = "Mira Holográfica",
		["type"] = "Usável",
		["weight"] = 0.75
	},
	["attachsSilencer"] = {
		["index"] = "attachsSilencer",
		["name"] = "Silenciador",
		["type"] = "Usável",
		["weight"] = 0.75
	},
	["attachsGrip"] = {
		["index"] = "attachsGrip",
		["name"] = "Empunhadura",
		["type"] = "Usável",
		["weight"] = 0.75
	},
	["cheese"] = {
		["index"] = "cheese",
		["name"] = "Queijo",
		["type"] = "Comum",
		["weight"] = 0.75
	},
	["wheat"] = {
		["index"] = "wheat",
		["name"] = "Trigo",
		["type"] = "Comum",
		["weight"] = 0.20
	},
	["potato"] = {
		["index"] = "potato",
		["name"] = "Batata",
		["type"] = "Comum",
		["weight"] = 0.50
	},	
	["lettuce"] = {
		["index"] = "lettuce",
		["name"] = "Alface",
		["type"] = "Comum",
		["weight"] = 0.20
	},	
	["onion"] = {
		["index"] = "onion",
		["name"] = "Cebola",
		["type"] = "Comum",
		["weight"] = 0.50
	},	
	["silk"] = {
		["index"] = "silk",
		["name"] = "Seda",
		["type"] = "Comum",
		["weight"] = 0.18
	},
	["coketable"] = {
		["index"] = "coketable",
		["name"] = "Mesa de Criação",
		["desc"] = "Utilizada para criação de Cocaína.",
		["type"] = "Usável",
		["durability"] = 1,
		["weight"] = 2.00
	},
	["methtable"] = {
		["index"] = "methtable",
		["name"] = "Mesa de Criação",
		["desc"] = "Utilizada para criação de Metanfetamina.",
		["type"] = "Usável",
		["durability"] = 1,
		["weight"] = 2.00
	},
	["weedtable"] = {
		["index"] = "weedtable",
		["name"] = "Mesa de Criação",
		["desc"] = "Utilizada para criação de Baseados.",
		["type"] = "Usável",
		["durability"] = 1,
		["weight"] = 2.00
	},
	["tablelean"] = {
		["index"] = "tablelean",
		["name"] = "Mesa de Criação",
		["desc"] = "Utilizada para criação de Lean.",
		["type"] = "Usável",
		["durability"] = 1,
		["weight"] = 2.00
	},
	["tableesctasy"] = {
		["index"] = "tableesctasy",
		["name"] = "Mesa de Criação",
		["desc"] = "Utilizada para criação de Esctasy.",
		["type"] = "Usável",
		["durability"] = 1,
		["weight"] = 2.00
	},
	["campfire"] = {
		["index"] = "campfire",
		["name"] = "Fogueira",
		["type"] = "Usável",
		["weight"] = 1.00
	},
	["barrier"] = {
		["index"] = "barrier",
		["name"] = "Barreira",
		["type"] = "Usável",
		["weight"] = 1.25
	},
	["medicbag"] = {
		["index"] = "medicbag",
		["name"] = "Bolsa Médica",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 0.55
	},
	["backpack"] = {
		["index"] = "backpack",
		["name"] = "Mochila",
		["desc"] = "Utilizada para aumentar inventario.",
		["type"] = "Usável",
		["weight"] = 0.50
	},
	["chair01"] = {
		["index"] = "chair01",
		["name"] = "Cadeira",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 1.25
	},
	["techtrash"] = {
		["index"] = "techtrash",
		["name"] = "Lixo Eletrônico",
		["type"] = "Comum",
		["weight"] = 0.65
	},
	["tarp"] = {
		["index"] = "tarp",
		["name"] = "Lona",
		["type"] = "Comum",
		["weight"] = 0.45
	},
	["sheetmetal"] = {
		["index"] = "sheetmetal",
		["name"] = "Chapa de Metal",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["roadsigns"] = {
		["index"] = "roadsigns",
		["name"] = "Placas de Trânsito",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["leather"] = {
		["index"] = "leather",
		["name"] = "Couro",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["explosives"] = {
		["index"] = "explosives",
		["name"] = "Explosivos",
		["type"] = "Comum",
		["weight"] = 0.15
	},
	["c4"] = {
		["index"] = "c4",
		["name"] = "C4",
		["type"] = "Comum",
		["weight"] = 0.15
	},
	["animalfat"] = {
		["index"] = "animalfat",
		["name"] = "Gordura Animal",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["fidentity"] = {
		["index"] = "identity",
		["name"] = "Passaporte",
		["type"] = "Usável",
		["weight"] = 0.10
	},
	["identity"] = {
		["index"] = "identity",
		["name"] = "Passaporte",
		["type"] = "Usável",
		["weight"] = 0.10
	},
	["blocksignal"] = {
		["index"] = "blocksignal",
		["name"] = "Bloqueador de Sinal",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 0.55
	},
	["pistolkitten"] = {
		["index"] = "pistolkitten",
		["name"] = "Gatilho de Pistola",
		["type"] = "Comum",
		["desc"] = "Utilizado para fabricação de arma.",
		["weight"] = 0.10
	},
	["smgkitten"] = {
		["index"] = "smgkitten",
		["name"] = "Gatilho de Sub-Metralhadora",
		["desc"] = "Utilizado para fabricação de arma.",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["riflekitten"] = {
		["index"] = "riflekitten",
		["name"] = "Gatilho de Rifle",
		["desc"] = "Utilizado para fabricação de arma.",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["pistolbody"] = {
		["index"] = "pistolbody",
		["name"] = "Corpo de Pistola",
		["desc"] = "Utilizado para fabricação de arma.",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["smgbody"] = {
		["index"] = "smgbody",
		["name"] = "Corpo de Sub-Metralhadora",
		["desc"] = "Utilizado para fabricação de arma.",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["riflebody"] = {
		["index"] = "riflebody",
		["name"] = "Corpo de Rifle",
		["desc"] = "Utilizado para fabricação de arma.",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["cotton"] = {
		["index"] = "cotton",
		["name"] = "Algodão",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["plaster"] = {
		["index"] = "plaster",
		["name"] = "Esparadrapo",
		["type"] = "Comum",
		["weight"] = 0.35
	},
	["sulfuric"] = {
		["index"] = "sulfuric",
		["name"] = "Ácido Sulfúrico",
		["type"] = "Usável",
		["weight"] = 0.45
	},
	["saline"] = {
		["index"] = "saline",
		["name"] = "Soro Fisiológico",
		["type"] = "Comum",
		["weight"] = 0.45
	},
	["defibrillator"] = {
		["index"] = "defibrillator",
		["name"] = "Desfibrilador",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 1.25
	},
	["alcohol"] = {
		["index"] = "alcohol",
		["name"] = "Álcool",
		["type"] = "Comum",
		["weight"] = 0.75
	},
	["notebook"] = {
		["index"] = "notebook",
		["name"] = "Notebook",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 1.25
	},
	["syringe"] = {
		["index"] = "adrenaline",
		["name"] = "Seringa",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["syringe01"] = {
		["index"] = "syringe",
		["name"] = "Seringa A+",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["syringe02"] = {
		["index"] = "syringe",
		["name"] = "Seringa B+",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["syringe03"] = {
		["index"] = "syringe",
		["name"] = "Seringa A-",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["syringe04"] = {
		["index"] = "syringe",
		["name"] = "Seringa B-",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["foodburger"] = {
		["index"] = "foodburger",
		["name"] = "Caixa de Hamburger",
		["type"] = "Comum",
		["weight"] = 0.15,
		["max"] = 100
	},
	["foodjuice"] = {
		["index"] = "foodjuice",
		["name"] = "Copo de Suco",
		["type"] = "Comum",
		["weight"] = 0.15,
		["max"] = 100
	},
	["foodbox"] = {
		["index"] = "foodbox",
		["name"] = "Combo",
		["type"] = "Comum",
		["weight"] = 0.50,
		["max"] = 100
	},
	["wheelchair"] = {
		["index"] = "wheelchair",
		["name"] = "Cadeira de Rodas",
		["type"] = "Usável",
		["weight"] = 1.50
	},
	["vehkey"] = {
		["index"] = "vehkey",
		["name"] = "Chave Cópia",
		["type"] = "Usável",
		["weight"] = 0.75
	},
	["evidence01"] = {
		["index"] = "evidence01",
		["name"] = "Evidência",
		["type"] = "Usável",
		["weight"] = 0.10
	},
	["evidence02"] = {
		["index"] = "evidence02",
		["name"] = "Evidência",
		["type"] = "Usável",
		["weight"] = 0.10
	},
	["evidence03"] = {
		["index"] = "evidence03",
		["name"] = "Evidência",
		["type"] = "Usável",
		["weight"] = 0.10
	},
	["evidence04"] = {
		["index"] = "evidence04",
		["name"] = "Evidência",
		["type"] = "Usável",
		["weight"] = 0.10
	},
	["rottweiler"] = {
		["index"] = "rottweiler",
		["name"] = "Coleira de Rottweiler",
		["type"] = "Animal",
		["durability"] = 24,
		["weight"] = 1.25
	},
	["husky"] = {
		["index"] = "husky",
		["name"] = "Coleira de Husky",
		["type"] = "Animal",
		["durability"] = 24,
		["weight"] = 1.25
	},
	["shepherd"] = {
		["index"] = "shepherd",
		["name"] = "Coleira de Shepherd",
		["type"] = "Animal",
		["durability"] = 24,
		["weight"] = 1.25
	},
	["retriever"] = {
		["index"] = "retriever",
		["name"] = "Coleira de Retriever",
		["type"] = "Animal",
		["durability"] = 24,
		["weight"] = 1.25
	},
	["poodle"] = {
		["index"] = "poodle",
		["name"] = "Coleira de Poodle",
		["type"] = "Animal",
		["durability"] = 24,
		["weight"] = 1.25
	},
	["pug"] = {
		["index"] = "pug",
		["name"] = "Coleira de Pug",
		["type"] = "Animal",
		["durability"] = 24,
		["weight"] = 1.25
	},
	["westy"] = {
		["index"] = "westy",
		["name"] = "Coleira de Westy",
		["type"] = "Animal",
		["durability"] = 24,
		["weight"] = 1.25
	},
	["cat"] = {
		["index"] = "cat",
		["name"] = "Coleira de Gato",
		["type"] = "Animal",
		["durability"] = 24,
		["weight"] = 1.25
	},
	["card01"] = {
		["index"] = "card01",
		["name"] = "Cartão Comum",
		["desc"] = "Roubar Lojas de Departamento.",
		["type"] = "Comum",
		["durability"] = 10,
		["weight"] = 0.10
	},
	["card02"] = {
		["index"] = "card02",
		["name"] = "Cartão In-Comum",
		["desc"] = "Roubar Lojas de Armas.",
		["type"] = "Comum",
		["durability"] = 10,
		["weight"] = 0.10
	},
	["card03"] = {
		["index"] = "card03",
		["name"] = "Cartão Normal",
		["desc"] = "Roubar Bancos Fleeca.",
		["type"] = "Comum",
		["durability"] = 10,
		["weight"] = 0.10
	},
	["card04"] = {
		["index"] = "card04",
		["name"] = "Cartão Raro",
		["desc"] = "Roubar Barbearias.",
		["type"] = "Comum",
		["durability"] = 10,
		["weight"] = 0.10
	},
	["card05"] = {
		["index"] = "card05",
		["name"] = "Cartão Lendário",
		["desc"] = "Roubar Bancos.",
		["type"] = "Comum",
		["durability"] = 10,
		["weight"] = 0.10
	},
	["gemstone"] = {
		["index"] = "gemstone",
		["name"] = "Gemstone",
		["type"] = "Usável",
		["weight"] = 0.10
	},
	["key"] = {
		["index"] = "key",
		["name"] = "Chaves",
		["type"] = "Comum",
		["durability"] = 3,
		["weight"] = 0.25
	},
	["radio"] = {
		["index"] = "radio",
		["name"] = "Rádio",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["vest"] = {
		["index"] = "vest",
		["name"] = "Colete",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 1.25,
		["max"] = 100
	},
	["bandage"] = {
		["index"] = "bandage",
		["name"] = "Bandagem",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.10,
		["max"] = 100
	},
	["medkit"] = {
		["index"] = "medkit",
		["name"] = "Kit Médico",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.45,
		["max"] = 100
	},
	["adrenaline"] = {
		["index"] = "adrenaline",
		["name"] = "Adrenalina",
		["type"] = "Usável",
		["durability"] = 1,
		["weight"] = 0.35
	},
	["pouch"] = {
		["index"] = "pouch",
		["name"] = "Malote",
		["type"] = "Comum",
		["weight"] = 0.75
	},
	["woodlog"] = {
		["index"] = "woodlog",
		["name"] = "Tora de Madeira",
		["type"] = "Comum",
		["weight"] = 0.75
	},
	["fishingrod"] = {
		["index"] = "fishingrod",
		["name"] = "Vara de Pescar",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 1.75
	},
	["octopus"] = {
		["index"] = "octopus",
		["name"] = "Polvo",
		["type"] = "Comum",
		["weight"] = 0.75
	},
	["shrimp"] = {
		["index"] = "shrimp",
		["name"] = "Camarão",
		["type"] = "Comum",
		["weight"] = 0.50
	},
	["carp"] = {
		["index"] = "carp",
		["name"] = "Carpa",
		["type"] = "Usável",
		["weight"] = 0.50
	},
	["codfish"] = {
		["index"] = "codfish",
		["name"] = "Bacalhau",
		["type"] = "Usável",
		["weight"] = 0.50
	},
	["catfish"] = {
		["index"] = "catfish",
		["name"] = "Bagre",
		["type"] = "Usável",
		["weight"] = 0.50
	},
	["goldenfish"] = {
		["index"] = "goldenfish",
		["name"] = "Dourado",
		["type"] = "Usável",
		["weight"] = 0.25
	},
	["horsefish"] = {
		["index"] = "horsefish",
		["name"] = "Cavala",
		["type"] = "Usável",
		["weight"] = 0.50
	},
	["tilapia"] = {
		["index"] = "tilapia",
		["name"] = "Tilápia",
		["type"] = "Usável",
		["weight"] = 0.25
	},
	["pacu"] = {
		["index"] = "pacu",
		["name"] = "Pacu",
		["type"] = "Usável",
		["weight"] = 0.50
	},
	["pirarucu"] = {
		["index"] = "pirarucu",
		["name"] = "Pirarucu",
		["type"] = "Usável",
		["weight"] = 0.25
	},
	["tambaqui"] = {
		["index"] = "tambaqui",
		["name"] = "Tambaqui",
		["type"] = "Usável",
		["weight"] = 0.75
	},
	["bait"] = {
		["index"] = "bait",
		["name"] = "Isca",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["animalpelt"] = {
		["index"] = "animalpelt",
		["name"] = "Pele Animal",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["joint"] = {
		["index"] = "joint",
		["name"] = "Baseado",
		["type"] = "Usável",
		["weight"] = 0.10
	},
	["weedleaf"] = {
		["index"] = "weedleaf",
		["name"] = "Folha de Maconha",
		["durability"] = 3,
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["fertilizer"] = {
		["index"] = "fertilizer",
		["name"] = "Fertilizante",
		["type"] = "Comum",
		["weight"] = 1.0
	},
	["esterco"] = {
		["index"] = "esterco",
		["name"] = "Esterco",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["weedseed"] = {
		["index"] = "weedseed",
		["name"] = "Semente de Maconha",
		["type"] = "Usável",
		["weight"] = 0.10
	},
	["lean"] = {
		["index"] = "lean",
		["name"] = "Lean",
		["type"] = "Usável",
		["weight"] = 0.50
	},
	["codeine"] = {
		["index"] = "codeine",
		["name"] = "Codeína",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["ecstasy"] = {
		["index"] = "ecstasy",
		["name"] = "Ecstasy",
		["type"] = "Usável",
		["weight"] = 0.50
	},
	["amphetamine"] = {
		["index"] = "amphetamine",
		["name"] = "Anfetamina",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["cocaine"] = {
		["index"] = "cocaine",
		["name"] = "Cocaína",
		["type"] = "Usável",
		["weight"] = 0.50
	},
	["cokeseed"] = {
		["index"] = "cokeseed",
		["name"] = "Semente de Cocaína",
		["type"] = "Usável",
		["weight"] = 0.10
	},
	["cokeleaf"] = {
		["index"] = "cokeleaf",
		["name"] = "Folha de Coca",
		["type"] = "Comum",
		["durability"] = 3,
		["weight"] = 0.10
	},
	["mushseed"] = {
		["index"] = "mushseed",
		["name"] = "Semente de Cogumelo",
		["type"] = "Usável",
		["weight"] = 0.10
	},
	["meth"] = {
		["index"] = "meth",
		["name"] = "Metanfetamina",
		["type"] = "Usável",
		["weight"] = 0.50
	},
	["acetone"] = {
		["index"] = "acetone",
		["name"] = "Acetona",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["heroine"] = {
		["index"] = "heroine",
		["name"] = "Heroína",
		["type"] = "Comum",
		["weight"] = 0.50
	},
	["premium"] = {
		["index"] = "premium",
		["name"] = "Premium",
		["type"] = "Usável",
		["weight"] = 0.00
	},
	["premium2"] = {
		["index"] = "premium2",
		["name"] = "Prata",
		["type"] = "Usável",
		["weight"] = 0.00
	},
	["premium3"] = {
		["index"] = "premium3",
		["name"] = "Ouro",
		["type"] = "Usável",
		["weight"] = 0.00
	},
	["premium4"] = {
		["index"] = "premium4",
		["name"] = "Platina",
		["type"] = "Usável",
		["weight"] = 0.00
	},
	["premium5"] = {
		["index"] = "premium5",
		["name"] = "Diamante",
		["type"] = "Usável",
		["weight"] = 0.00
	},
	["newlocate"] = {
		["index"] = "newlocate",
		["name"] = "Nacionalidade",
		["type"] = "Usável",
		["desc"] = "Inverte nacionalidade de Sul/Norte.",
		["weight"] = 0.00
	},
	["newgarage"] = {
		["index"] = "newgarage",
		["name"] = "+1 Garagem",
		["type"] = "Usável",
		["desc"] = "Limite de garagem em +1.",
		["weight"] = 0.00
	},
	["premiumplate"] = {
		["index"] = "platepremium",
		["name"] = "Placa Premium",
		["type"] = "Usável",
		["desc"] = "Personaliza a placa do veículo.",
		["weight"] = 0.00
	},
	["newchars"] = {
		["index"] = "newchars",
		["name"] = "+1 Personagem",
		["type"] = "Usável",
		["desc"] = "Limite de personagem em +1.",
		["weight"] = 0.00
	},
	["chip"] = {
		["index"] = "chip",		["durability"] = 3,
		["name"] = "Chip Telefônico",
		["type"] = "Usável",
		["desc"] = "Troca o número telefônico.",
		["weight"] = 0.00
	},
	["namechange"] = {
		["index"] = "namechange",
		["name"] = "Troca de Nome",
		["type"] = "Usável",
		["desc"] = "Troca o nome do personagem.",
		["weight"] = 0.00
	},
	["contract1"] = {
		["index"] = "contract",
		["name"] = "Contrato de Propriedade 1",
		["type"] = "Usável",
		["desc"] = "Assinatura de Contrato de Mansão.",
		["weight"] = 0.00
	},
	["contract2"] = {
		["index"] = "contract",
		["name"] = "Contrato de Propriedade 2",
		["type"] = "Usável",
		["desc"] = "Assinatura de Contrato de Casa Classe Média Alta.",
		["weight"] = 0.00
	},
	["contract3"] = {
		["index"] = "contract",
		["name"] = "Contrato de Propriedade 3",
		["type"] = "Usável",
		["desc"] = "Assinatura de Contrato de Casa Classe Média Alta.",
		["weight"] = 0.00
	},
	["contract4"] = {
		["index"] = "contract",
		["name"] = "Contrato de Propriedade 4",
		["type"] = "Usável",
		["desc"] = "Assinatura de Contrato de Casa Classe Média.",
		["weight"] = 0.00
	},
	["contract5"] = {
		["index"] = "contract",
		["name"] = "Contrato de Propriedade 5",
		["type"] = "Usável",
		["desc"] = "Assinatura de Contrato de Casa Classe Média.",
		["weight"] = 0.00
	},
	["contract6"] = {
		["index"] = "contract",
		["name"] = "Contrato de Propriedade 6",
		["type"] = "Usável",
		["desc"] = "Assinatura de Contrato de Casa Classe Média.",
		["weight"] = 0.00
	},
	["contract7"] = {
		["index"] = "contract",
		["name"] = "Contrato de Propriedade 7",
		["type"] = "Usável",
		["desc"] = "Assinatura de Contrato de Casa Classe Média.",
		["weight"] = 0.00
	},
	["contract8"] = {
		["index"] = "contract",
		["name"] = "Contrato de Propriedade 8",
		["type"] = "Usável",
		["desc"] = "Assinatura de Contrato de Casa Classe Econômica.",
		["weight"] = 0.00
	},
	["contract9"] = {
		["index"] = "contract",
		["name"] = "Contrato de Propriedade 9",
		["type"] = "Usável",
		["desc"] = "Assinatura de Contrato de Casa Classe Econômica.",
		["weight"] = 0.00
	},
	["contract10"] = {
		["index"] = "contract",
		["name"] = "Contrato de Propriedade 10",
		["type"] = "Usável",
		["desc"] = "Assinatura de Contrato de Container.",
		["weight"] = 0.00
	},
	["energetic"] = {
		["index"] = "energetic",
		["name"] = "Energético",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.25,
		["max"] = 100
	},
	["milkbottle"] = {
		["index"] = "milkbottle",
		["name"] = "Garrafa de Leite",
		["type"] = "Usável",
		["weight"] = 0.15,
		["scape"] = true,
		["max"] = 100
	},
	["water"] = {
		["index"] = "water",
		["name"] = "Água",
		["type"] = "Usável",
		["weight"] = 0.15,
		["scape"] = true,
		["max"] = 100
	},
	["combo1"] = {
		["index"] = "combo1",
		["name"] = "Combo Himalaia",
		["type"] = "Usável",
		["weight"] = 3.00,
		["scape"] = true,
		["max"] = 100
	},
	["combo2"] = {
		["index"] = "combo2",
		["name"] = "Combo Furioso",
		["type"] = "Usável",
		["weight"] = 2.50,
		["scape"] = true,
		["max"] = 100
	},
	["combo3"] = {
		["index"] = "combo3",
		["name"] = "Combo Mega",
		["type"] = "Usável",
		["weight"] = 2.00,
		["scape"] = true,
		["max"] = 100
	}, 


 --============== COLEÇÃO DE POKEMON ===========================================

-- COMUM

	["pidgey"] = {
		["index"] = "pidgey",
		["name"] = "Pidgey",
		["desc"] = "Colecionáveis - COMUM 20/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["weedle"] = {
		["index"] = "weedle",
		["name"] = "Weedle",
		["desc"] = "Colecionáveis - COMUM 19/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["rattata"] = {
		["index"] = "rattata",
		["name"] = "Rattata",
		["desc"] = "Colecionáveis - COMUM 18/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["zubat"] = {
		["index"] = "zubat",
		["name"] = "Zubat",
		["desc"] = "Colecionáveis - COMUM 17/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	
-- RARO

	["meowth"] = {
		["index"] = "meowth",
		["name"] = "Meowth",
		["desc"] = "Colecionáveis - RARO 16/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["eevee"] = {
		["index"] = "eevee",
		["name"] = "Eevee",
		["desc"] = "Colecionáveis - RARO 15/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["squirtle"] = {
		["index"] = "squirtle",
		["name"] = "Squirtle",
		["desc"] = "Colecionáveis - RARO 14/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["bulbasaur"] = {
		["index"] = "bulbasaur",
		["name"] = "Bulbasaur",
		["desc"] = "Colecionáveis - RARO 13/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["charmander"] = {
		["index"] = "charmander",
		["name"] = "Charmander",
		["desc"] = "Colecionáveis - RARO 12/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},

-- ÉPICO

	["chansey"] = {
		["index"] = "chansey",
		["name"] = "Chansey",
		["desc"] = "Colecionáveis - ÉPICO 11/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["pikachu"] = {
		["index"] = "pikachu",
		["name"] = "Pikachu",
		["desc"] = "Colecionáveis - ÉPICO 10/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["mime"] = {
		["index"] = "mime",
		["name"] = "Mime",
		["desc"] = "Colecionáveis - ÉPICO 09/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["snorlax"] = {
		["index"] = "snorlax",
		["name"] = "Snorlax",
		["desc"] = "Colecionáveis - ÉPICO 08/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["porygon"] = {
		["index"] = "porygon",
		["name"] = "Porygon",
		["desc"] = "Colecionáveis - ÉPICO 07/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["lapras"] = {
		["index"] = "lapras",
		["name"] = "Lapras",
		["desc"] = "Colecionáveis - ÉPICO 06/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},

-- LENDÁRIO

	["zapdos"] = {
		["index"] = "zapdos",
		["name"] = "Zapdos",
		["desc"] = "Colecionáveis - LENDÁRIO 05/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["articuno"] = {
		["index"] = "articuno",
		["name"] = "Articuno",
		["desc"] = "Colecionáveis - LENDÁRIO 04/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["moltres"] = {
		["index"] = "moltres",
		["name"] = "Moltres",
		["desc"] = "Colecionáveis - LENDÁRIO 03/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["mew"] = {
		["index"] = "mew",
		["name"] = "Mew",
		["desc"] = "Colecionáveis - LENDÁRIO 02/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},

-- SUPREMO

	["mewtwo"] = {
		["index"] = "mewtwo",
		["name"] = "Mewtwo",
		["desc"] = "Colecionáveis - SUPREMO 01/20",
		["type"] = "Comum",
		["weight"] = 0.10
	},

	 --============== COLEÇÃO DE POKEMON ===========================================

    ["emptybottle"] = {
		["index"] = "emptybottle",
		["name"] = "Garrafa Vazia",
		["type"] = "Usável",
		["weight"] = 0.10,
		["scape"] = true,
		["max"] = 100
	},
	["coffee"] = {
		["index"] = "coffee",
		["name"] = "Copo de Café",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.15,
		["max"] = 100
	},
	["frangofrito"] = {
		["index"] = "frangofrito",
		["name"] = "Frango Frito",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.15,
		["max"] = 100		
	},
	["frango"] = {
		["index"] = "frango",
		["name"] = "Frango",
		["type"] = "Usável",
		["weight"] = 0.15	
	},
	["batata"] = {
		["index"] = "batata",
		["name"] = "Batata",
		["type"] = "Usável",
		["weight"] = 0.15					
	},
	["baldedefrango"] = {
		["index"] = "baldedefrango",
		["name"] = "Balde De Frango",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.90,
		["max"] = 100						
	},	
	["cola"] = {
		["index"] = "cola",
		["name"] = "Coca Cola",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.15,
		["max"] = 100
	},
	["tacos"] = {
		["index"] = "tacos",
		["name"] = "Tacos",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.25,
		["max"] = 100
	},
	["soda"] = {
		["index"] = "soda",
		["name"] = "Sprite",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.15,
		["max"] = 100
	},
	["apple"] = {
		["index"] = "apple",
		["name"] = "Maça",
		["type"] = "Usável",
		["weight"] = 0.25
	},
	["acerola"] = {
		["index"] = "acerola",
		["name"] = "Acerola",
		["type"] = "Usável",
		["weight"] = 0.25
	},
	["orange"] = {
		["index"] = "orange",
		["name"] = "Laranja",
		["type"] = "Usável",
		["weight"] = 0.25
	},
	["cacau"] = {
		["index"] = "cacau",
		["name"] = "Cacau",
		["type"] = "Usável",
		["weight"] = 0.25
	},
	["strawberry"] = {
		["index"] = "strawberry",
		["name"] = "Morango",
		["type"] = "Usável",
		["weight"] = 0.15
	},
	["coffee2"] = {
		["index"] = "coffee2",
		["name"] = "Grão de Café",
		["type"] = "Usável",
		["weight"] = 0.10
	},
	["grape"] = {
		["index"] = "grape",
		["name"] = "Uva",
		["type"] = "Usável",
		["weight"] = 0.15
	},
	["tange"] = {
		["index"] = "tange",
		["name"] = "Tangerina",
		["type"] = "Usável",
		["weight"] = 0.25
	},
	["banana"] = {
		["index"] = "banana",
		["name"] = "Banana",
		["type"] = "Usável",
		["weight"] = 0.25
	},
	["passion"] = {
		["index"] = "passion",
		["name"] = "Maracujá",
		["type"] = "Usável",
		["weight"] = 0.25
	},
	["tomato"] = {
		["index"] = "tomato",
		["name"] = "Tomate",
		["type"] = "Usável",
		["weight"] = 0.15
	},
	["mushroom"] = {
		["index"] = "mushroom",
		["name"] = "Cogumelo",
		["type"] = "Usável",
		["weight"] = 0.15
	},
	["sugar"] = {
		["index"] = "sugar",
		["name"] = "Açucar",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["orangejuice"] = {
		["index"] = "orangejuice",
		["name"] = "Suco de Laranja",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.75,
		["scape"] = true,
		["max"] = 100
	},
	["tangejuice"] = {
		["index"] = "tangejuice",
		["name"] = "Suco de Tangerina",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.45,
		["scape"] = true,
		["max"] = 100
	},
	["grapejuice"] = {
		["index"] = "grapejuice",
		["name"] = "Suco de Uva",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.45,
		["scape"] = true,
		["max"] = 100
	},
	["strawberryjuice"] = {
		["index"] = "strawberryjuice",
		["name"] = "Suco de Morango",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.45,
		["scape"] = true,
		["max"] = 100
	},
	["bananajuice"] = {
		["index"] = "bananajuice",
		["name"] = "Suco de Banana",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.45,
		["scape"] = true,
		["max"] = 100
	},
	["acerolajuice"] = {
		["index"] = "acerolajuice",
		["name"] = "Suco de Acerola",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.45,
		["scape"] = true,
		["max"] = 100
	},
	["passionjuice"] = {
		["index"] = "passionjuice",
		["name"] = "Suco de Maracujá",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.45,
		["scape"] = true,
		["max"] = 100
	},
	["bread"] = {
		["index"] = "bread",
		["name"] = "Pão",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["ketchup"] = {
		["index"] = "ketchup",
		["name"] = "Ketchup",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["cannedsoup"] = {
		["index"] = "cannedsoup",
		["name"] = "Lata de Tilápia",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.25
	},
	["canofbeans"] = {
		["index"] = "canofbeans",
		["name"] = "Lata de Lambari",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.25
	},
	["meat"] = {
		["index"] = "meat",
		["name"] = "Carne Animal",
		["type"] = "Comum",
		["weight"] = 0.75
	},
	["fishfillet"] = {
		["index"] = "fishfillet",
		["name"] = "Filé de Peixe",
		["type"] = "Comum",
		["weight"] = 0.75
	},
	["marshmallow"] = {
		["index"] = "marshmallow",
		["name"] = "Marshmallow",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.15,
		["scape"] = true,
		["max"] = 100
	},
	["cookedfishfillet"] = {
		["index"] = "cookedfishfillet",
		["name"] = "Filé de Peixe Cozido",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.35,
		["scape"] = true,
		["max"] = 100
	},
	["cookedmeat"] = {
		["index"] = "cookedmeat",
		["name"] = "Carne Animal Cozida",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.35,
		["scape"] = true,
		["max"] = 100
	},
	["hamburger"] = {
		["index"] = "hamburger",
		["name"] = "Hambúrguer",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.35,
		["max"] = 100
	},
	["hamburger2"] = {
		["index"] = "hamburger2",
		["name"] = "Hambúrguer Artesanal",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.55,
		["scape"] = true,
		["max"] = 100
	},

--- BURGERSHOT=======================================================================

	["heartstopper"] = {
		["index"] = "heartstopper",
		["name"] = "Heart Stopper",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 1.00,
		["scape"] = true,
		["max"] = 100
	},
	["moneyshot"] = {
		["index"] = "moneyshot",
		["name"] = "Money Shot",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.55,
		["scape"] = true,
		["max"] = 100
	},
	["torpedo"] = {
		["index"] = "torpedo",
		["name"] = "Torpedo",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.55,
		["scape"] = true,
		["max"] = 100
	},
	["bleeder"] = {
		["index"] = "bleeder",
		["name"] = "Bleeder",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.35,
		["scape"] = true,
		["max"] = 100
	},
	["meatfree"] = {
		["index"] = "meatfree",
		["name"] = "Meat Free",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.35,
		["scape"] = true,
		["max"] = 100
	},
	["fries"] = {
		["index"] = "fries",
		["name"] = "Batata Frita",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.35,
		["scape"] = true,
		["max"] = 100
	},
	["shotrings"] = {
		["index"] = "shotrings",
		["name"] = "Cebola Frita",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.35,
		["scape"] = true,
		["max"] = 100
	},
	
	["taco"] = {
		["index"] = "taco",
		["name"] = "Taco",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.35,
		["scape"] = true,
		["max"] = 100
	},
	["torta"] = {
		["index"] = "torta",
		["name"] = "Torta de Maça",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.35,
		["scape"] = true,
		["max"] = 100
	},
	["wrap"] = {
		["index"] = "wrap",
		["name"] = "Wrap",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.35,
		["scape"] = true,
		["max"] = 100
	},
	["icecream1"] = {
		["index"] = "icecream1",
		["name"] = "Sorvete de Chocolate",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.35,
		["scape"] = true,
		["max"] = 100
	},
	["icecream2"] = {
		["index"] = "icecream2",
		["name"] = "Sorvete de Baunilha",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.35,
		["scape"] = true,
		["max"] = 100
	},
	["milkshake"] = {
		["index"] = "milkshake",
		["name"] = "Milk Shake",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.35,
		["scape"] = true,
		["max"] = 100
	},

--- BURGERSHOT======================================================================

	["pizza"] = {
		["index"] = "pizza",
		["name"] = "Pizza de Muçarela",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.35,
		["scape"] = true,
		["max"] = 100
	},
	["pizza2"] = {
		["index"] = "pizza2",
		["name"] = "Pizza de Cogumelo",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.35,
		["scape"] = true,
		["max"] = 100
	},
	["hotdog"] = {
		["index"] = "hotdog",
		["name"] = "Cachorro-Quente",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.35,
		["max"] = 100
	},
	["donut"] = {
		["index"] = "donut",
		["name"] = "Rosquinha",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.25,
		["max"] = 100
	},
	["cookies"] = {
		["index"] = "cookies",
		["name"] = "Cookies",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.25,
		["max"] = 100
	},
	["plate"] = {
		["index"] = "plate",
		["name"] = "Placa",
		["type"] = "Comum",
		["weight"] = 0.50
	},
	["lockpick"] = {
		["index"] = "lockpick",
		["name"] = "Lockpick de Carro",
		["desc"] = "Utilizada para roubar veículos.",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 1.25
	},
	["lockpick2"] = {
		["index"] = "lockpick2",
		["name"] = "Lockpick de Casa",
		["desc"] = "Utilizada para roubar propriedades.",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 1.25
	},
	["brokenpick"] = {
		["index"] = "brokenpick",
		["name"] = "Lockpick Quebrado",
		["type"] = "Comum",
		["weight"] = 0.75
	},
	["toolbox"] = {
		["index"] = "toolbox",
		["name"] = "Ferramentas Básicas",
		["type"] = "Usável",
		["durability"] = 7,
		["desc"] = "Utilizada para consertar veículo 1x.",
		["weight"] = 1.75,
		["max"] = 100
	},
	["advtoolbox"] = {
		["index"] = "toolbox2",
		["name"] = "Ferramentas Avançadas",
		["type"] = "Usável",
		["durability"] = 7,
		["desc"] = "Utilizada para consertar veículo 3x.",
		["weight"] = 2.25,
		["charges"] = 3,
		["max"] = 100
	},
	["notepad"] = {
		["index"] = "notepad",
		["name"] = "Bloco de Notas",
		["type"] = "Usável",
		["weight"] = 0.25
	},
	["tyres"] = {
		["index"] = "tyres",
		["name"] = "Pneu",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 1.50,
		["max"] = 100
	},
	["cellphone"] = {
		["index"] = "cellphone",
		["name"] = "Celular",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["anotacoes"] = {
		["index"] = "anotacoes",
		["name"] = "Anotações",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["divingsuit"] = {
		["index"] = "divingsuit",
		["name"] = "Roupa de Mergulho",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 4.75
	},
	["handcuff"] = {
		["index"] = "handcuff",
		["name"] = "Algemas",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["rope"] = {
		["index"] = "rope",
		["name"] = "Cordas",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 1.50
	},
	["hood"] = {
		["index"] = "hood",
		["name"] = "Capuz",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 1.50
	},
	["nails"] = {
		["index"] = "nails",
		["name"] = "Pregos",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["plastic"] = {
		["index"] = "plastic",
		["name"] = "Plástico",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["glass"] = {
		["index"] = "glass",
		["name"] = "Vidro",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["rubber"] = {
		["index"] = "rubber",
		["name"] = "Borracha",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["aluminum"] = {
		["index"] = "aluminum",
		["name"] = "Alumínio",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["bauxita"] = {
		["index"] = "bauxita",
		["name"] = "Bauxita",
		["type"] = "Comum",
		["weight"] = 0.15
	},
	["carvao"] = {
		["index"] = "carvao",
		["name"] = "Carvão",
		["type"] = "Comum",
		["weight"] = 0.15
	},
	["min_chumbo"] = {
		["index"] = "min_chumbo",
		["name"] = "Minério de Chumbo",
		["type"] = "Comum",
		["weight"] = 0.15
	},
	["chumbo"] = {
		["index"] = "chumbo",
		["name"] = "Chumbo",
		["type"] = "Comum",
		["weight"] = 0.15
	},
	["enxofre"] = {
		["index"] = "enxofre",
		["name"] = "Enxofre",
		["type"] = "Comum",
		["weight"] = 0.15
	},
	["min_ferro"] = {
		["index"] = "min_ferro",
		["name"] = "Minério de Ferro",
		["type"] = "Comum",
		["weight"] = 0.15
	},
	["ferro"] = {
		["index"] = "ferro",
		["name"] = "Ferro",
		["type"] = "Comum",
		["weight"] = 0.15
	},
	["min_cobre"] = {
		["index"] = "min_cobre",
		["name"] = "Minério de Cobre",
		["type"] = "Comum",
		["weight"] = 0.15
	},
	["nitrato"] = {
		["index"] = "nitrato",
		["name"] = "Nitrato de Potássio",
		["type"] = "Comum",
		["weight"] = 0.15
	},
	["bronze"] = {
		["index"] = "bronze",
		["name"] = "Bronze",
		["type"] = "Comum",
		["weight"] = 0.15
	},
	["copper"] = {
		["index"] = "copper",
		["name"] = "Cobre",
		["type"] = "Comum",
		["weight"] = 0.15
	},
	["newspaper"] = {
		["index"] = "newspaper",
		["name"] = "Jornal",
		["type"] = "Comum",
		["weight"] = 0.1
	},
	["ritmoneury"] = {
		["index"] = "ritmoneury",
		["name"] = "Ritmoneury",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.25,
		["max"] = 100
	},
	["sinkalmy"] = {
		["index"] = "sinkalmy",
		["name"] = "Sinkalmy",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.25,
		["max"] = 100
	},
	["cigarette"] = {
		["index"] = "cigarette",
		["name"] = "Cigarro",
		["type"] = "Usável",
		["weight"] = 0.10,
		["max"] = 100
	},
	["lighter"] = {
		["index"] = "lighter",
		["name"] = "Isqueiro",
		["durability"] = 7,
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["vape"] = {
		["index"] = "vape",
		["name"] = "Vaper",
		["type"] = "Usável",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["dollars"] = {
		["index"] = "dollars",
		["name"] = "Dólares",
		["type"] = "Comum",
		["weight"] = 0.00
    },
	["dollars2"] = {
		["index"] = "dollars2",
		["name"] = "Dólares Marcado",
		["type"] = "Comum",
		["weight"] = 0.00
	},
	["battery"] = {
		["index"] = "battery",
		["name"] = "Pilhas",
		["type"] = "Comum",
		["weight"] = 0.20
	},
	["elastic"] = {
		["index"] = "elastic",
		["name"] = "Elástico",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["plasticbottle"] = {
		["index"] = "plasticbottle",
		["name"] = "Garrafa Plástica",
		["type"] = "Comum",
		["weight"] = 0.20
	},
	["glassbottle"] = {
		["index"] = "glassbottle",
		["name"] = "Garrafa de Vidro",
		["type"] = "Comum",
		["weight"] = 0.50
	},
	["metalcan"] = {
		["index"] = "metalcan",
		["name"] = "Lata de Metal",
		["type"] = "Comum",
		["weight"] = 0.20
	},
	["chocolate"] = {
		["index"] = "chocolate",
		["name"] = "Chocolate",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.10,
		["scape"] = true,
		["max"] = 100
	},
	["sandwich"] = {
		["index"] = "sandwich",
		["name"] = "Sanduiche",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.25,
		["max"] = 100
	},
	["rose"] = {
		["index"] = "rose",
		["name"] = "Rosa",
		["type"] = "Usável",
		["weight"] = 0.15
	},
	["teddy"] = {
		["index"] = "teddy",
		["name"] = "Teddy",
		["type"] = "Usável",
		["weight"] = 0.75
	},
	["absolut"] = {
		["index"] = "absolut",
		["name"] = "Absolut",
		["type"] = "Usável",
		["weight"] = 0.25
	},
	["chandon"] = {
		["index"] = "chandon",
		["name"] = "Chandon",
		["type"] = "Usável",
		["weight"] = 0.35
	},
	["dewars"] = {
		["index"] = "dewars",
		["name"] = "Dewars",
		["type"] = "Usável",
		["weight"] = 0.25
	},
	["hennessy"] = {
		["index"] = "hennessy",
		["name"] = "Hennessy",
		["type"] = "Usável",
		["weight"] = 0.25
	},
	["goldbar"] = {
		["index"] = "goldbar",
		["name"] = "Barra de Ouro",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["binoculars"] = {
		["index"] = "binoculars",
		["name"] = "Binóculos",
		["type"] = "Usável",
		["durability"] = 14,
		["weight"] = 0.75
	},
	["camera"] = {
		["index"] = "camera",
		["name"] = "Câmera",
		["type"] = "Usável",
		["durability"] = 14,
		["weight"] = 0.25
	},
	["WEAPON_SWITCHBLADE"] = {
		["index"] = "switchblade",
		["name"] = "Canivete",
		["type"] = "Armamento",
		["desc"] = "Utilizada para remoção de carne.",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["WEAPON_HATCHET"] = {
		["index"] = "hatchet",
		["name"] = "Machado",
		["type"] = "Armamento",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["WEAPON_BAT"] = {
		["index"] = "bat",
		["name"] = "Bastão de Beisebol",
		["type"] = "Armamento",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["WEAPON_KATANA"] = {
		["index"] = "katana",
		["name"] = "Katana",
		["type"] = "Armamento",
		["repair"] = "repairkit01",
		["durability"] = 7,
		["weight"] = 0.75,
		["economy"] = 1225
	},
	["WEAPON_KARAMBIT"] = {
		["index"] = "karambit",
		["name"] = "Karambit",
		["type"] = "Armamento",
		["repair"] = "repairkit01",
		["durability"] = 7,
		["weight"] = 0.75,
		["economy"] = 1025
	},
	["WEAPON_BATTLEAXE"] = {
		["index"] = "battleaxe",
		["name"] = "Machado de Batalha",
		["type"] = "Armamento",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["WEAPON_CROWBAR"] = {
		["index"] = "crowbar",
		["name"] = "Pé de Cabra",
		["type"] = "Armamento",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["WEAPON_GOLFCLUB"] = {
		["index"] = "golfclub",
		["name"] = "Taco de Golf",
		["type"] = "Armamento",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["WEAPON_HAMMER"] = {
		["index"] = "hammer",
		["name"] = "Martelo",
		["type"] = "Armamento",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["WEAPON_MACHETE"] = {
		["index"] = "machete",
		["name"] = "Facão",
		["type"] = "Armamento",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["WEAPON_POOLCUE"] = {
		["index"] = "poolcue",
		["name"] = "Taco de Sinuca",
		["type"] = "Armamento",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["WEAPON_STONE_HATCHET"] = {
		["index"] = "stonehatchet",
		["name"] = "Machado de Pedra",
		["type"] = "Armamento",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["WEAPON_WRENCH"] = {
		["index"] = "wrench",
		["name"] = "Chave Inglesa",
		["type"] = "Armamento",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["WEAPON_KNUCKLE"] = {
		["index"] = "knuckle",
		["name"] = "Soco Inglês",
		["type"] = "Armamento",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["WEAPON_FLASHLIGHT"] = {
		["index"] = "flashlight",
		["name"] = "Lanterna",
		["type"] = "Armamento",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["WEAPON_NIGHTSTICK"] = {
		["index"] = "nightstick",
		["name"] = "Cassetete",
		["type"] = "Armamento",
		["durability"] = 7,
		["weight"] = 0.75
	},
	["projetil_reforcado"] = {
		["index"] = "projetil_reforcado",
		["name"] = "Projetil Reforçado",
		["type"] = "Comum",
		["desc"] = "Utilizada para fabricação de munição.",
		["weight"] = 0.10
	},
	["projetil"] = {
		["index"] = "projetil",
		["name"] = "Projetil",
		["type"] = "Comum",
		["desc"] = "Utilizada para fabricação de munição.",
		["weight"] = 0.10
	},
	["capsula_pistol"] = {
		["index"] = "capsula_pistol",
		["name"] = "Capsula de Pistola",
		["type"] = "Comum",
		["desc"] = "Utilizada para fabricação de munição.",
		["weight"] = 0.10
	},
	["capsula_smg"] = {
		["index"] = "capsula_smg",
		["name"] = "Capsula de SMG",
		["type"] = "Comum",
		["desc"] = "Utilizada para fabricação de munição.",
		["weight"] = 0.10
	},
	["capsula_fuzil"] = {
		["index"] = "capsula_fuzil",
		["name"] = "Capsula de Fuzil",
		["type"] = "Comum",
		["desc"] = "Utilizada para fabricação de munição.",
		["weight"] = 0.10
	},
	["WEAPON_PISTOL"] = {
		["index"] = "m1911",
		["name"] = "M1911",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_PISTOL_AMMO",
		["durability"] = 24,
		["vehicle"] = true,
		["weight"] = 1.25
	},
	["WEAPON_PISTOL_MK2"] = {
		["index"] = "fiveseven",
		["name"] = "FN Five Seven",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_PISTOL_AMMO",
		["durability"] = 24,
		["vehicle"] = true,
		["weight"] = 1.50
	},
	["WEAPON_COMPACTRIFLE"] = {
		["index"] = "akcompact",
		["name"] = "AK Compact",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_RIFLE_AMMO",
		["durability"] = 24,
		["weight"] = 2.25
	},
	["WEAPON_APPISTOL"] = {
		["index"] = "kochvp9",
		["name"] = "Koch Vp9",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_PISTOL_AMMO",
		["durability"] = 24,
		["vehicle"] = true,
		["weight"] = 1.25
	},
	["WEAPON_HEAVYPISTOL"] = {
		["index"] = "atifx45",
		["name"] = "Ati FX45",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_PISTOL_AMMO",
		["durability"] = 24,
		["vehicle"] = true,
		["weight"] = 1.50
	},
	["WEAPON_MACHINEPISTOL"] = {
		["index"] = "tec9",
		["name"] = "Tec-9",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_SMG_AMMO",
		["durability"] = 24,
		["vehicle"] = true,
		["weight"] = 1.75
	},
	["WEAPON_MICROSMG"] = {
		["index"] = "uzi",
		["name"] = "Uzi",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_SMG_AMMO",
		["durability"] = 24,
		["vehicle"] = true,
		["weight"] = 1.25
	},
	["WEAPON_MINISMG"] = {
		["index"] = "skorpionv61",
		["name"] = "Skorpion V61",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_SMG_AMMO",
		["durability"] = 24,
		["vehicle"] = true,
		["weight"] = 1.75
	},
	["WEAPON_SNSPISTOL"] = {
		["index"] = "amt380",
		["name"] = "AMT 380",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_PISTOL_AMMO",
		["durability"] = 24,
		["vehicle"] = true,
		["weight"] = 1.00
	},
	["WEAPON_SNSPISTOL_MK2"] = {
		["index"] = "hkp7m10",
		["name"] = "HK P7M10",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_PISTOL_AMMO",
		["durability"] = 24,
		["vehicle"] = true,
		["weight"] = 1.25
	},
	["WEAPON_VINTAGEPISTOL"] = {
		["index"] = "m1922",
		["name"] = "M1922",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_PISTOL_AMMO",
		["durability"] = 24,
		["vehicle"] = true,
		["weight"] = 1.25
	},
	["WEAPON_PISTOL50"] = {
		["index"] = "desert",
		["name"] = "Desert Eagle",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_PISTOL_AMMO",
		["durability"] = 24,
		["vehicle"] = true,
		["weight"] = 1.50
	},
	["WEAPON_REVOLVER"] = {
		["index"] = "magnum",
		["name"] = "Magnum 44",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_PISTOL_AMMO",
		["durability"] = 24,
		["vehicle"] = true,
		["weight"] = 1.50
	},
	["WEAPON_COMBATPISTOL"] = {
		["index"] = "glock",
		["name"] = "Glock",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_PISTOL_AMMO",
		["durability"] = 24,
		["vehicle"] = true,
		["weight"] = 1.25
	},
	["WEAPON_CARBINERIFLE"] = {
		["index"] = "m4a1",
		["name"] = "M4A1",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_RIFLE_AMMO",
		["durability"] = 24,
		["weight"] = 1.75
	},
	["WEAPON_CARBINERIFLE_MK2"] = {
		["index"] = "m4a4",
		["name"] = "M4A4",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_RIFLE_AMMO",
		["durability"] = 24,
		["weight"] = 1.50
	},
	["WEAPON_ADVANCEDRIFLE"] = {
		["index"] = "tar21",
		["name"] = "Tar-21",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_RIFLE_AMMO",
		["durability"] = 24,
		["weight"] = 1.75
	},
	["WEAPON_BULLPUPRIFLE"] = {
		["index"] = "qbz95",
		["name"] = "QBZ-95",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_RIFLE_AMMO",
		["durability"] = 24,
		["weight"] = 1.75
	},
	["WEAPON_BULLPUPRIFLE_MK2"] = {
		["index"] = "l85",
		["name"] = "L85",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_RIFLE_AMMO",
		["durability"] = 24,
		["weight"] = 1.75
	},
	["WEAPON_SPECIALCARBINE"] = {
		["index"] = "g36c",
		["name"] = "G36C",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_RIFLE_AMMO",
		["durability"] = 24,
		["weight"] = 1.25
	},
	["WEAPON_SPECIALCARBINE_MK2"] = {
		["index"] = "sigsauer556",
		["name"] = "Sig Sauer 556",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_RIFLE_AMMO",
		["durability"] = 24,
		["weight"] = 1.25
	},
	["WEAPON_PUMPSHOTGUN"] = {
		["index"] = "mossberg590",
		["name"] = "Mossberg 590",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_SHOTGUN_AMMO",
		["durability"] = 24,
		["weight"] = 1.25
	},
	["WEAPON_PUMPSHOTGUN_MK2"] = {
		["index"] = "mossberg590a1",
		["name"] = "Mossberg 590A1",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_SHOTGUN_AMMO",
		["durability"] = 24,
		["weight"] = 1.25
	},
	["WEAPON_MUSKET"] = {
		["index"] = "winchester",
		["name"] = "Winchester 1892",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_MUSKET_AMMO",
		["durability"] = 24,
		["weight"] = 1.25
	},
	["WEAPON_SNIPERRIFLE"] = {
		["index"] = "sauer101",
		["name"] = "Sauer 101",
		["desc"] = "Sniper com durabilidade de 3 dias",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_MUSKET_AMMO",
		["durability"] = 3,
		["weight"] = 1.25
	},
	["WEAPON_SAWNOFFSHOTGUN"] = {
		["index"] = "mossberg500",
		["name"] = "Mossberg 500",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_SHOTGUN_AMMO",
		["durability"] = 24,
		["weight"] = 1.75
	},
	["WEAPON_SMG"] = {
		["index"] = "mp5",
		["name"] = "MP5",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_SMG_AMMO",
		["durability"] = 24,
		["weight"] = 1.25
	},
	["WEAPON_SMG_MK2"] = {
		["index"] = "evo3",
		["name"] = "Evo-3",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_SMG_AMMO",
		["durability"] = 24,
		["weight"] = 1.25
	},
	["WEAPON_ASSAULTRIFLE"] = {
		["index"] = "ak103",
		["name"] = "AK-103",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_RIFLE_AMMO",
		["durability"] = 24,
		["weight"] = 1.75
	},
	["WEAPON_ASSAULTRIFLE_MK2"] = {
		["index"] = "ak74",
		["name"] = "AK-74",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_RIFLE_AMMO",
		["durability"] = 24,
		["weight"] = 1.75
	},
	["WEAPON_ASSAULTSMG"] = {
		["index"] = "steyraug",
		["name"] = "Steyr AUG",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_SMG_AMMO",
		["durability"] = 24,
		["weight"] = 5.75
	},
	["WEAPON_GUSENBERG"] = {
		["index"] = "thompson",
		["name"] = "Thompson",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_SMG_AMMO",
		["durability"] = 24,
		["weight"] = 6.25
	},
	["WEAPON_PETROLCAN"] = {
		["index"] = "gallon",
		["name"] = "Galão",
		["type"] = "Armamento",
		["ammo"] = "WEAPON_PETROLCAN_AMMO",
		["weight"] = 1.25
	},
	["WEAPON_BRICK"] = {
		["index"] = "brick",
		["name"] = "Tijolo",
		["type"] = "Throwing",
		["vehicle"] = true,
		["weight"] = 0.50,
		["economy"] = 20
	},
	["WEAPON_SNOWBALL"] = {
		["index"] = "snowball",
		["name"] = "Bola de Neve",
		["type"] = "Throwing",
		["vehicle"] = true,
		["weight"] = 0.25,
		["economy"] = 6
	},
	["WEAPON_SHOES"] = {
		["index"] = "shoes",
		["name"] = "Tênis",
		["type"] = "Throwing",
		["vehicle"] = true,
		["weight"] = 0.50,
		["economy"] = 20
	},
	["WEAPON_MOLOTOV"] = {
		["index"] = "molotov",
		["name"] = "Coquetel Molotov",
		["type"] = "Throwing",
		["vehicle"] = true,
		["weight"] = 0.50,
		["economy"] = 225,
		["max"] = 100
	},
	["WEAPON_SMOKEGRENADE"] = {
		["index"] = "smokegrenade",
		["name"] = "Granada de Fumaça",
		["type"] = "Throwing",
		["vehicle"] = true,
		["weight"] = 0.50,
		["economy"] = 225,
		["max"] = 100
	},
	["WEAPON_BZGAS"] = {
		["index"] = "smokegrenade",
		["name"] = "Granada de Gás",
		["type"] = "Throwing",
		["vehicle"] = true,
		["weight"] = 0.50,
		["economy"] = 225,
		["max"] = 100
	},
	["GADGET_PARACHUTE"] = {
		["index"] = "parachute",
		["name"] = "Paraquedas",
		["type"] = "Usável",
		["weight"] = 2.25
	},
	["WEAPON_STUNGUN"] = {
		["index"] = "stungun",
		["name"] = "Tazer",
		["type"] = "Armamento",
		["durability"] = 21,
		["weight"] = 0.75
	},
	["WEAPON_PISTOL_AMMO"] = {
		["index"] = "pistolammo",
		["name"] = "Munição de Pistola",
		["type"] = "Munição",
		["weight"] = 0.10
	},
	["WEAPON_SMG_AMMO"] = {
		["index"] = "smgammo",
		["name"] = "Munição de Sub",
		["type"] = "Munição",
		["weight"] = 0.10
	},
	["WEAPON_RIFLE_AMMO"] = {
		["index"] = "rifleammo",
		["name"] = "Munição de Rifle",
		["type"] = "Munição",
		["weight"] = 0.10
	},
	["WEAPON_SHOTGUN_AMMO"] = {
		["index"] = "shotgunammo",
		["name"] = "Munição de Escopeta",
		["type"] = "Munição",
		["weight"] = 0.10
	},
	["WEAPON_MUSKET_AMMO"] = {
		["index"] = "musketammo",
		["name"] = "Munição de Mosquete",
		["type"] = "Munição",
		["weight"] = 0.10
	},
	["WEAPON_PETROLCAN_AMMO"] = {
		["index"] = "fuel",
		["name"] = "Combustível",
		["type"] = "Munição",
		["weight"] = 0.10
	},
	["pager"] = {
		["index"] = "pager",
		["name"] = "Pager",
		["type"] = "Usável",
		["weight"] = 1.25
	},
	["firecracker"] = {
		["index"] = "firecracker",
		["name"] = "Fogos de Artificio",
		["type"] = "Usável",
		["durability"] = 14,
		["weight"] = 1.25
	},
	["analgesic"] = {
		["index"] = "analgesic",
		["name"] = "Analgésico",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.10,
		["max"] = 100
	},
	["oxy"] = {
		["index"] = "analgesic",
		["name"] = "Oxy",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.10,
		["max"] = 100
	},
	["gauze"] = {
		["index"] = "gauze",
		["name"] = "Gaze",
		["type"] = "Usável",
		["durability"] = 3,
		["weight"] = 0.10,
		["max"] = 100
	},
	["gsrkit"] = {
		["index"] = "gsrkit",
		["name"] = "Kit Residual",
		["type"] = "Usável",
		["weight"] = 0.75
	},
	["gdtkit"] = {
		["index"] = "gdtkit",
		["name"] = "Kit Químico",
		["type"] = "Usável",
		["weight"] = 0.75
	},
	["emerald"] = {
		["index"] = "emerald",
		["name"] = "Esmeralda",
		["type"] = "Comum",
		["weight"] = 0.85
	},
	["diamond"] = {
		["index"] = "diamond",
		["name"] = "Diamante",
		["type"] = "Comum",
		["weight"] = 0.80
	},
	["ruby"] = {
		["index"] = "ruby",
		["name"] = "Rubi",
		["type"] = "Comum",
		["weight"] = 0.75
	},
	["sapphire"] = {
		["index"] = "sapphire",
		["name"] = "Safira",
		["type"] = "Comum",
		["weight"] = 0.70
	},
	["amethyst"] = {
		["index"] = "amethyst",
		["name"] = "Ametista",
		["type"] = "Comum",
		["weight"] = 0.65
	},
	["amber"] = {
		["index"] = "amber",
		["name"] = "Âmbar",
		["type"] = "Comum",
		["weight"] = 0.60
	},
	["turquoise"] = {
		["index"] = "turquoise",
		["name"] = "Turquesa",
		["type"] = "Comum",
		["weight"] = 0.55
	},
	["keyboard"] = {
		["index"] = "keyboard",
		["name"] = "Teclado",
		["type"] = "Comum",
		["weight"] = 0.50
	},
	["mouse"] = {
		["index"] = "mouse",
		["name"] = "Mouse",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["silverring"] = {
		["index"] = "silverring",
		["name"] = "Anel de Prata",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["goldring"] = {
		["index"] = "goldring",
		["name"] = "Anel de Ouro",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["silvercoin"] = {
		["index"] = "silvercoin",
		["name"] = "Moeda de Prata",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["goldcoin"] = {
		["index"] = "goldcoin",
		["name"] = "Moeda de Ouro",
		["type"] = "Comum",
		["weight"] = 0.10
	},
	["watch"] = {
		["index"] = "watch",
		["name"] = "Relógio",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["playstation"] = {
		["index"] = "playstation",
		["name"] = "Playstation",
		["type"] = "Comum",
		["weight"] = 2.00
	},
	["xbox"] = {
		["index"] = "xbox",
		["name"] = "Xbox",
		["type"] = "Comum",
		["weight"] = 1.75
	},
	["legos"] = {
		["index"] = "legos",
		["name"] = "Legos",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["ominitrix"] = {
		["index"] = "ominitrix",
		["name"] = "Ominitrix",
		["type"] = "Comum",
		["weight"] = 0.50
	},
	["bracelet"] = {
		["index"] = "bracelet",
		["name"] = "Bracelete",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["dildo"] = {
		["index"] = "dildo",
		["name"] = "Vibrador",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["spray01"] = {
		["index"] = "spray01",
		["name"] = "Desodorante 24hrs",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["spray02"] = {
		["index"] = "spray02",
		["name"] = "Antisséptico",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["spray03"] = {
		["index"] = "spray03",
		["name"] = "Desodorante 48hrs",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["spray04"] = {
		["index"] = "spray04",
		["name"] = "Desodorante 72hrs",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["brick"] = {
		["index"] = "brick",
		["name"] = "Tijolo",
		["type"] = "Comum",
		["weight"] = 0.50
	},
	["dices"] = {
		["index"] = "dices",
		["name"] = "Dados",
		["type"] = "Usável",
		["weight"] = 0.25
	},
	["dish"] = {
		["index"] = "dish",
		["name"] = "Prato",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["pan"] = {
		["index"] = "pan",
		["name"] = "Panela",
		["type"] = "Usável",
		["weight"] = 0.50
	},
	["sneakers"] = {
		["index"] = "sneakers",
		["name"] = "Tenis",
		["type"] = "Comum",
		["weight"] = 0.50
	},
	["fan"] = {
		["index"] = "fan",
		["name"] = "Ventilador",
		["type"] = "Comum",
		["weight"] = 0.50
	},
	["rimel"] = {
		["index"] = "rimel",
		["name"] = "Rímel",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["blender"] = {
		["index"] = "blender",
		["name"] = "Liquidificador",
		["type"] = "Usável",
		["weight"] = 0.50
	},
	["switch"] = {
		["index"] = "switch",
		["name"] = "Interruptor",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["horseshoe"] = {
		["index"] = "horseshoe",
		["name"] = "Ferradura",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["brush"] = {
		["index"] = "brush",
		["name"] = "Escova",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["domino"] = {
		["index"] = "domino",
		["name"] = "Dominó",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["floppy"] = {
		["index"] = "floppy",
		["name"] = "Disquete",
		["type"] = "Comum",
		["weight"] = 0.15
	},
	["cup"] = {
		["index"] = "cup",
		["name"] = "Cálice",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["deck"] = {
		["index"] = "deck",
		["name"] = "Baralho",
		["type"] = "Usável",
		["weight"] = 0.15
	},
	["eraser"] = {
		["index"] = "eraser",
		["name"] = "Apagador",
		["type"] = "Comum",
		["weight"] = 0.15
	},
	["pliers"] = {
		["index"] = "pliers",
		["name"] = "Alicate",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["lampshade"] = {
		["index"] = "lampshade",
		["name"] = "Abajur",
		["type"] = "Comum",
		["weight"] = 0.50
	},
	["soap"] = {
		["index"] = "soap",
		["name"] = "Sabonete",
		["type"] = "Usável",
		["weight"] = 0.25
	},
	["slipper"] = {
		["index"] = "slipper",
		["name"] = "Chinelo",
		["type"] = "Comum",
		["weight"] = 0.50
	},
	["winner"] = {
		["index"] = "winner",
		["name"] = "Troféu de Vencedor",
		["type"] = "Comum",
		["weight"] = 0.35
	},	
	["pendrive2"] = {
		["index"] = "pendrive2",
		["name"] = "Pendrive de Ouro",
		["desc"] = "Roubar Carro Forte.",
		["type"] = "Comum",
		["weight"] = 0.25
	},
	["pendrive"] = {
		["index"] = "pendrive",
		["name"] = "Pendrive",
		["desc"] = "Roubar Joalheria.",
		["type"] = "Comum",
		["weight"] = 0.25
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMBODY
-----------------------------------------------------------------------------------------------------------------------------------------
function itemBody(nameItem)
	local splitName = splitString(nameItem,"-")

	if itemlist[splitName[1]] then
		return itemlist[splitName[1]]
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMINDEX
-----------------------------------------------------------------------------------------------------------------------------------------
function itemIndex(nameItem)
	local splitName = splitString(nameItem,"-")

	if itemlist[splitName[1]] then
		return itemlist[splitName[1]]["index"]
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMNAME
-----------------------------------------------------------------------------------------------------------------------------------------
function itemName(nameItem)
	local splitName = splitString(nameItem,"-")

	if itemlist[splitName[1]] then
		return itemlist[splitName[1]]["name"]
	end

	return "Deletado"
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMTYPE
-----------------------------------------------------------------------------------------------------------------------------------------
function itemType(nameItem)
	local splitName = splitString(nameItem,"-")

	if itemlist[splitName[1]] then
		return itemlist[splitName[1]]["type"]
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMAMMO
-----------------------------------------------------------------------------------------------------------------------------------------
function itemAmmo(nameItem)
	local splitName = splitString(nameItem,"-")

	if itemlist[splitName[1]] then
		return itemlist[splitName[1]]["ammo"]
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
function itemVehicle(nameItem)
	local splitName = splitString(nameItem,"-")

	if itemlist[splitName[1]] then
		return itemlist[splitName[1]]["vehicle"] or false
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMWEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
function itemWeight(nameItem)
	local splitName = splitString(nameItem,"-")

	if itemlist[splitName[1]] then
		return itemlist[splitName[1]]["weight"] or 0.0
	end

	return 0.0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMMAXAMOUNT
-----------------------------------------------------------------------------------------------------------------------------------------
function itemMaxAmount(nameItem)
	local splitName = splitString(nameItem,"-")

	if itemlist[splitName[1]] then
		return itemlist[splitName[1]]["max"] or nil
	end

	return nil
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMSCAPE
-----------------------------------------------------------------------------------------------------------------------------------------
function itemScape(nameItem)
	local splitName = splitString(nameItem,"-")

	if itemlist[splitName[1]] then
		return itemlist[splitName[1]]["scape"] or nil
	end

	return nil
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMDESCRIPTION
-----------------------------------------------------------------------------------------------------------------------------------------
function itemDescription(nameItem)
	local splitName = splitString(nameItem,"-")

	if itemlist[splitName[1]] then
		return itemlist[splitName[1]]["desc"] or nil
	end

	return nil
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMDURABILITY
-----------------------------------------------------------------------------------------------------------------------------------------
function itemDurability(nameItem)
	local splitName = splitString(nameItem,"-")

	if itemlist[splitName[1]] then
		return itemlist[splitName[1]]["durability"] or false
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMCHARGES
-----------------------------------------------------------------------------------------------------------------------------------------
function itemCharges(nameItem)
	local splitName = splitString(nameItem,"-")

	if itemlist[splitName[1]] then
		return itemlist[splitName[1]]["charges"] or nil
	end

	return nil
end