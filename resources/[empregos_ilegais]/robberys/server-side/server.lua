-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("robberys",cRP)
vCLIENT = Tunnel.getInterface("robberys")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERYAVAILABLE
-----------------------------------------------------------------------------------------------------------------------------------------
local robberyAvailable = {
	["departamentStore"] = os.time(),
	["ammunation"] = os.time(),
	["fleecas"] = os.time(),
	["barbershop"] = os.time(),
	["banks"] = os.time(),
	["register"] = os.time(),
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERYS
-----------------------------------------------------------------------------------------------------------------------------------------
local robberys = {
	["1"] = {
		["coords"] = { 28.24,-1338.832,29.5 },
		["name"] = "Loja de departamento",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Sul",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["2"] = {
		["coords"] = { 2548.883,384.850,108.63 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Sul",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["3"] = {
		["coords"] = { 1159.156,-314.055,69.21 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Sul",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["4"] = {
		["coords"] = { -710.067,-904.091,19.22 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Sul",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["5"] = {
		["coords"] = { -43.652,-1748.122,29.43 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Sul",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["6"] = {
		["coords"] = { 378.291,333.712,103.57 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Sul",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["7"] = {
		["coords"] = { -3250.385,1004.504,12.84 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Sul",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["8"] = {
		["coords"] = { 1734.968,6421.161,35.04 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Norte",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["9"] = {
		["coords"] = { 546.450,2662.45,42.16 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Norte",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["10"] = {
		["coords"] = { 1959.113,3749.239,32.35 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Norte",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["11"] = {
		["coords"] = { 2672.457,3286.811,55.25 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Norte",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["12"] = {
		["coords"] = { 1708.095,4920.711,42.07 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Norte",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["13"] = {
		["coords"] = { -1829.422,798.491,138.2 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Sul",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["14"] = {
		["coords"] = { -2959.66,386.765,14.05 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Sul",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["15"] = {
		["coords"] = { -3048.155,585.519,7.91 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Sul",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["16"] = {
		["coords"] = { 1126.75,-979.760,45.42 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Sul",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["17"] = {
		["coords"] = { 1169.631,2717.833,37.16 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Norte",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["18"] = {
		["coords"] = { -1478.67,-375.675,39.17 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Sul",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["19"] = {
		["coords"] = { -1221.126,-916.213,11.33 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Sul",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["20"] = {
		["coords"] = { 168.97,6644.71,31.69 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Norte",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["21"] = {
		["coords"] = { -168.42,6318.8,30.58 },
		["name"] = "Loja de departamentStoreo",
		["type"] = "departamentStore",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card01",
		["locate"] = "Norte",
		["timer"] = 200,
		["cops"] = 4,
		["payment"] = {
			{ "dollars2",130000,140000 }
		}
	},
	["22"] = {
		["coords"] = { 1693.374,3761.669,34.71 },
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card02",
		["locate"] = "Norte",
		["timer"] = 120,
		["cops"] = 3,
		["payment"] = {
			{ "dollars2",70000,80000 }
		}
	},
	["23"] = {
		["coords"] = { 253.061,-51.643,69.95 },
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card02",
		["locate"] = "Sul",
		["timer"] = 120,
		["cops"] = 3,
		["payment"] = {
			{ "dollars2",70000,80000 }
		}
	},
	["24"] = {
		["coords"] = { 841.128,-1034.951,28.2 },
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card02",
		["locate"] = "Sul",
		["timer"] = 120,
		["cops"] = 3,
		["payment"] = {
			{ "dollars2",70000,80000 }
		}
	},
	["25"] = {
		["coords"] = { -330.467,6085.647,31.46 },
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card02",
		["locate"] = "Norte",
		["timer"] = 120,
		["cops"] = 3,
		["payment"] = {
			{ "dollars2",70000,80000 }
		}
	},
	["26"] = {
		["coords"] = { -660.987,-933.901,21.83 },
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card02",
		["locate"] = "Sul",
		["timer"] = 120,
		["cops"] = 3,
		["payment"] = {
			{ "dollars2",70000,80000 }
		}
	},
	["27"] = {
		["coords"] = { -1304.775,-395.832,36.7 },
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card02",
		["locate"] = "Sul",
		["timer"] = 120,
		["cops"] = 3,
		["payment"] = {
			{ "dollars2",70000,80000 }
		}
	},
	["28"] = {
		["coords"] = { -1117.765,2700.388,18.56 },
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card02",
		["locate"] = "Norte",
		["timer"] = 120,
		["cops"] = 3,
		["payment"] = {
			{ "dollars2",70000,80000 }
		}
	},
	["29"] = {
		["coords"] = { 2566.632,292.945,108.74 },
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card02",
		["locate"] = "Sul",
		["timer"] = 120,
		["cops"] = 3,
		["payment"] = {
			{ "dollars2",70000,80000 }
		}
	},
	["30"] = {
		["coords"] = { -3172.701,1089.462,20.84 },
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card02",
		["locate"] = "Sul",
		["timer"] = 120,
		["cops"] = 3,
		["payment"] = {
			{ "dollars2",70000,80000 }
		}
	},
	["31"] = {
		["coords"] = { 23.733,-1106.27,29.8 },
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card02",
		["locate"] = "Sul",
		["timer"] = 120,
		["cops"] = 3,
		["payment"] = {
			{ "dollars2",70000,80000 }
		}
	},
	["32"] = {
		["coords"] = { 808.914,-2158.684,29.62 },
		["name"] = "Loja de Armas",
		["type"] = "ammunation",
		["distance"] = 10.0,
		["cooldown"] = 45,
		["item"] = "card02",
		["locate"] = "Sul",
		["timer"] = 120,
		["cops"] = 3,
		["payment"] = {
			{ "dollars2",70000,80000 }
		}
	},
	["33"] = {
		["coords"] = { -1210.409,-336.485,38.29 },
		["name"] = "Banco Fleeca",
		["type"] = "fleecas",
		["distance"] = 10.0,
		["cooldown"] = 380,
		["item"] = "card03",
		["locate"] = "Sul",
		["timer"] = 420,
		["cops"] = 7,
		["payment"] = {
			{ "dollars2",250000,260000 }
		}
	},
	["34"] = {
		["coords"] = { -353.519,-55.518,49.54 },
		["name"] = "Banco Fleeca",
		["type"] = "fleecas",
		["distance"] = 10.0,
		["cooldown"] = 380,
		["item"] = "card03",
		["locate"] = "Sul",
		["timer"] = 420,
		["cops"] = 7,
		["payment"] = {
			{ "dollars2",250000,260000 }
		}
	},
	["35"] = {
		["coords"] = { 311.525,-284.649,54.67 },
		["name"] = "Banco Fleeca",
		["type"] = "fleecas",
		["distance"] = 10.0,
		["cooldown"] = 380,
		["item"] = "card03",
		["locate"] = "Sul",
		["timer"] = 420,
		["cops"] = 7,
		["payment"] = {
			{ "dollars2",250000,260000 }
		}
	},
	["36"] = {
		["coords"] = { 147.210,-1046.292,29.87 },
		["name"] = "Banco Fleeca",
		["type"] = "fleecas",
		["distance"] = 10.0,
		["cooldown"] = 380,
		["item"] = "card03",
		["locate"] = "Sul",
		["timer"] = 420,
		["cops"] = 7,
		["payment"] = {
			{ "dollars2",250000,260000 }
		}
	},
	["37"] = {
		["coords"] = { -2956.449,482.090,16.2 },
		["name"] = "Banco Fleeca",
		["type"] = "fleecas",
		["distance"] = 10.0,
		["cooldown"] = 380,
		["item"] = "card03",
		["locate"] = "Sul",
		["timer"] = 420,
		["cops"] = 7,
		["payment"] = {
			{ "dollars2",250000,260000 }
		}
	},
	["38"] = {
		["coords"] = { 1175.66,2712.939,38.59 },
		["name"] = "Banco Fleeca",
		["type"] = "fleecas",
		["distance"] = 10.0,
		["cooldown"] = 380,
		["item"] = "card03",
		["locate"] = "Norte",
		["timer"] = 420,
		["cops"] = 7,
		["payment"] = {
			{ "dollars2",250000,260000 }
		}
	},
	["39"] = {
		["coords"] = { -810.15,-179.57,37.57 },
		["name"] = "Barbearia",
		["type"] = "barbershop",
		["distance"] = 10.0,
		["cooldown"] = 60,
		["item"] = "card04",
		["locate"] = "Sul",
		["timer"] = 60,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",30000,35000 }
		}
	},
	["40"] = {
		["coords"] = { 134.4,-1707.81,29.28 },
		["name"] = "Barbearia",
		["type"] = "barbershop",
		["distance"] = 10.0,
		["cooldown"] = 60,
		["item"] = "card04",
		["locate"] = "Sul",
		["timer"] = 60,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",30000,35000 }
		}
	},
	["41"] = {
		["coords"] = { -1284.26,-1115.11,6.99 },
		["name"] = "Barbearia",
		["type"] = "barbershop",
		["distance"] = 10.0,
		["cooldown"] = 60,
		["item"] = "card04",
		["locate"] = "Sul",
		["timer"] = 60,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",30000,35000 }
		}
	},
	["42"] = {
		["coords"] = { 1930.61,3727.97,32.84 },
		["name"] = "Barbearia",
		["type"] = "barbershop",
		["distance"] = 10.0,
		["cooldown"] = 60,
		["item"] = "card04",
		["locate"] = "Norte",
		["timer"] = 60,
		["cops"] = 3,
		["payment"] = {
			{ "dollars2",30000,35000 }
		}
	},
	["43"] = {
		["coords"] = { 1211.45,-470.7,66.2 },
		["name"] = "Barbearia",
		["type"] = "barbershop",
		["distance"] = 10.0,
		["cooldown"] = 60,
		["item"] = "card04",
		["locate"] = "Sul",
		["timer"] = 60,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",30000,35000 }
		}
	},
	["44"] = {
		["coords"] = { -30.56,-151.83,57.07 },
		["name"] = "Barbearia",
		["type"] = "barbershop",
		["distance"] = 10.0,
		["cooldown"] = 60,
		["item"] = "card04",
		["locate"] = "Sul",
		["timer"] = 60,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",30000,35000 }
		}
	},
	["45"] = {
		["coords"] = { -277.75,6230.6,31.69 },
		["name"] = "Barbearia",
		["type"] = "barbershop",
		["distance"] = 10.0,
		["cooldown"] = 60,
		["item"] = "card04",
		["locate"] = "Norte",
		["timer"] = 60,
		["cops"] = 3,
		["payment"] = {
			{ "dollars2",30000,35000 }
		}
	},
	["46"] = {
		["coords"] = { -104.386,6477.150,31.83 }, -- BANCO PALETO
		["name"] = "Saving Bank",
		["type"] = "banks",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "card05",
		["locate"] = "Norte",
		["timer"] = 900,
		["cops"] = 9,
		["payment"] = {
			{ "dollars2",650000,750000 }
		}
	},
	["47"] = {
		["coords"] = { 265.336,220.184,102.09 }, -- BANCO CENTRAL
		["name"] = "Vinewood Vault",
		["type"] = "banks",
		["distance"] = 20.0,
		["cooldown"] = 360,
		["item"] = "card05",
		["locate"] = "Sul",
		["timer"] = 900,
		["cops"] = 11,
		["payment"] = {
			{ "dollars2",700000,800000 }
		}
	},
	["48"] = {
		["coords"] = { 24.44,-1344.94,29.49 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["49"] = {
		["coords"] = { 24.50,-1347.34,29.49 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["50"] = {
		["coords"] = { 1165.07,-324.50,69.20 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["51"] = {
		["coords"] = { 1164.67,-322.76,69.20 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["52"] = {
		["coords"] = { -706.10,-915.43,19.21 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["53"] = {
		["coords"] = { -706.16,-913.65,19.21 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["54"] = {
		["coords"] = { -47.96,-1759.34,29.42 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["55"] = {
		["coords"] = { -46.80,-1757.94,29.42 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["56"] = {
		["coords"] = { 372.56,326.44,103.56 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["57"] = {
		["coords"] = { 373.03,328.61,103.56 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["58"] = {
		["coords"] = { -3242.1,999.91,12.82 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["59"] = {
		["coords"] = { -3244.57,1000.11,12.82 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["60"] = {
		["coords"] = { 1727.91,6415.3,35.03 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["61"] = {
		["coords"] = { 1728.89,6417.24,35.03 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["62"] = {
		["coords"] = { 549.03,2671.36,42.15 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["63"] = {
		["coords"] = { 549.33,2669.04,42.15 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["64"] = {
		["coords"] = { 1958.96,3742.01,32.34 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["65"] = {
		["coords"] = { 1960.12,3740.01,32.34 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["66"] = {
		["coords"] = { 2678.07,3279.42,55.24 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["67"] = {
		["coords"] = { 2676.03,3280.56,55.24 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["68"] = {
		["coords"] = { 1696.57,4923.9,42.06 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["69"] = {
		["coords"] = { 1697.91,4922.96,42.06 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["70"] = {
		["coords"] = { -1818.89,792.94,138.08 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["71"] = {
		["coords"] = { -1819.96,794.09,138.08 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["72"] = {
		["coords"] = { 1393.05,3606.52,34.98 },
		["name"] = "Registradora",
		["type"] = "register",
			["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["73"] = {
		["coords"] = { -2966.36,390.95,15.05 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["74"] = {
		["coords"] = { -3038.92,584.48,7.90 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["75"] = {
		["coords"] = { -3041.19,583.84,7.90 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["76"] = {
		["coords"] = { 1134.12,-982.31,46.4 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["77"] = {
		["coords"] = { -1222.07,-908.45,12.32 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["78"] = {
		["coords"] = { 73.88,-1392.27,29.37 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["79"] = {
		["coords"] = { 75.06,-1387.6,29.37 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["80"] = {
		["coords"] = { 78.02,-1387.69,29.37 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["81"] = {
		["coords"] = { 427.06,-806.98,29.49 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["82"] = {
		["coords"] = { 425.98,-811.54,29.49 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["83"] = {
		["coords"] = { 422.83,-811.54,29.49 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["84"] = {
		["coords"] = { -816.58,-1073.12,11.32 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["85"] = {
		["coords"] = { -818.21,-1070.38,11.32 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["86"] = {
		["coords"] = { -822.52,-1071.87,11.32 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["87"] = {
		["coords"] = { -1195.27,-767.93,17.3 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["88"] = {
		["coords"] = { -1193.84,-766.95,17.3 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["89"] = {
		["coords"] = { -1192.44,-765.94,17.3 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["90"] = {
		["coords"] = { 5.33,6510.9,31.88 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["91"] = {
		["coords"] = { 1.39,6508.33,31.88 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["92"] = {
		["coords"] = { -0.83,6510.72,31.88 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["93"] = {
		["coords"] = { 1695.04,4817.64,42.06 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["94"] = {
		["coords"] = { 1692.14,4817.25,42.06 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["95"] = {
		["coords"] = { 127.65,-222.47,54.56 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["96"] = {
		["coords"] = { 126.41,-225.85,54.56 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["97"] = {
		["coords"] = { 612.89,2762.73,42.09 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["98"] = {
		["coords"] = { 612.8,2764.36,42.09 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["99"] = {
		["coords"] = { 1197.42,2711.63,38.22 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["100"] = {
		["coords"] = { 1201.88,2710.74,38.22 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["101"] = {
		["coords"] = { 1201.87,2707.60,38.22 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["102"] = {
		["coords"] = { -3168.64,1044.82,20.86 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["103"] = {
		["coords"] = { -3169.43,1043.06,20.86 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["104"] = {
		["coords"] = { -3170.04,1041.67,20.86 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["105"] = {
		["coords"] = { -1101.80,2712.10,19.10 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["106"] = {
		["coords"] = { -1097.90,2714.40,19.10 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["107"] = {
		["coords"] = { -1095.82,2712.08,19.10 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["108"] = {
		["coords"] = { -821.9,-183.29,37.56 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Sul",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["109"] = {
		["coords"] = { 162.11,6643.19,31.69 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
	["110"] = {
		["coords"] = { 160.42,6641.6,31.69 },
		["name"] = "Registradora",
		["type"] = "register",
		["distance"] = 10.0,
		["cooldown"] = 360,
		["item"] = "pliers",
		["locate"] = "Norte",
		["timer"] = 30,
		["cops"] = 2,
		["payment"] = {
			{ "dollars2",20000,25000 }
		}
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkRobbery(robberyId)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if robberys[robberyId] then
			local prev = robberys[robberyId]

			if os.time() >= robberyAvailable[prev["type"]] then
				local policeResult = vRP.numPermission("Police")
				if parseInt(#policeResult) >= parseInt(prev["cops"]) then
					local consultItem = vRP.getInventoryItemAmount(user_id,prev["item"])
					if consultItem[1] <= 0 then
						TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x "..itemName(prev["item"]).."</b>.",5000)
						return false
					end

					if vRP.checkBroken(consultItem[2]) then
						TriggerClientEvent("Notify",source,"vermelho","<b>"..itemName(prev["item"]).."</b> quebrado.",5000)
						return false
					end

					if vRP.tryGetInventoryItem(user_id,consultItem[2],1) then
						robberyAvailable[prev["type"]] = os.time() + (prev["cooldown"] * 1)
						TriggerClientEvent("player:applyGsr",source)

						for k,v in pairs(policeResult) do
							async(function()
								TriggerClientEvent("NotifyPush",v,{ code = 31, title = prev["name"], x = prev["coords"][1], y = prev["coords"][2], z = prev["coords"][3], time = "Recebido às "..os.date("%H:%M"), blipColor = 22 })
								vRPC.playSound(v,"Beep_Green","DLC_HEIST_HACKING_SNAKE_SOUNDS")
							end)
						end

						return true
					end
				else
					TriggerClientEvent("Notify",source,"vermelho","Policiais insuficientes!")
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Sistema indisponível no momento.",5000)
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTROBBERY
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.paymentRobbery(robberyId)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.upgradeStress(user_id,10)
		TriggerEvent("",source,user_id,900)

		local identity = vRP.userIdentity(user_id)
		for k,v in pairs(robberys[robberyId]["payment"]) do
			local value = math.random(v[2],v[3])
			vRP.generateItem(user_id,v[1],parseInt(value),true)

			if robberys[robberyId]["locate"] ~= identity["locate"] then
				vRP.generateItem(user_id,v[1],parseInt(value * 0.1),true)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("playerConnect",function(user_id,source)
	vCLIENT.inputRobberys(source,robberys)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERYS:JEWELRY
-----------------------------------------------------------------------------------------------------------------------------------------
local jewelryShowcase = {}
local jewelryTimers = os.time()
local jewelryCooldowns = os.time()
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERYS:INITJEWELRY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("robberys:initJewelry")
AddEventHandler("robberys:initJewelry",function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if os.time() >= jewelryCooldowns then
			local policeResult = vRP.numPermission("Police")
			if parseInt(#policeResult) >= 7 then
				local consultItem = vRP.getInventoryItemAmount(user_id,"pendrive")
				if consultItem[1] <= 0 then
					TriggerClientEvent("Notify",source,"amarelo","Precisa de <b>1x Pendrive</b>.",5000)
					return false
				end

				if vRP.checkBroken(consultItem[2]) then
					TriggerClientEvent("Notify",source,"vermelho","<b>Pendrive</b> quebrado.",5000)
					return false
				end

				if vRP.tryGetInventoryItem(user_id,consultItem[2],1) then
					TriggerClientEvent("Notify",source,"verde","Sistema corrompido.",5000)
					jewelryCooldowns = os.time() + 7200
					jewelryTimers = os.time() + 600
					jewelryShowcase = {}

					for k,v in pairs(policeResult) do
						async(function()
							TriggerClientEvent("NotifyPush",v,{ code = 31, title = "Joalheria", x = -633.07, y = -238.7, z = 38.06, time = "Recebido às "..os.date("%H:%M"), blipColor = 22 })
							vRPC.playSound(v,"Beep_Green","DLC_HEIST_HACKING_SNAKE_SOUNDS")
						end)
					end
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Sistema indisponível no momento.",5000)
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Sistema indisponível no momento.",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROBBERYS:JEWELRY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("robberys:jewelry")
AddEventHandler("robberys:jewelry",function(entity)
	local source = source
	local showcase = entity[1]
	local user_id = vRP.getUserId(source)
	if user_id then
		if os.time() <= jewelryTimers then
			if jewelryShowcase[showcase] == nil then
				jewelryShowcase[showcase] = true
				TriggerClientEvent("vRP:Cancel",source,true)
				vRPC.playAnim(source,false,{"oddjobs@shop_robbery@rob_till","loop"},true)

				SetTimeout(20000,function()
					vRPC.stopAnim(source,false)
					vRP.upgradeStress(user_id,10)
					TriggerEvent("Wanted",source,user_id,60)
					TriggerClientEvent("vRP:Cancel",source,false)
					vRP.generateItem(user_id,"watch",math.random(20,30),true)
				end)
			else
				TriggerClientEvent("Notify",source,"azul","Vitrine vazia.",3000)
			end
		else
			TriggerClientEvent("Notify",source,"amarelo","Necessário corromper o sistema.",3000)
		end
	end
end)