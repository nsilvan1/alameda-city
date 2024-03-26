-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("crafting",cRP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local craftList = {
	["mechanicShop"] = {
		["perm"] = "Mechanic",
		["list"] = {
			["toolbox"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 8,
					["copper"] = 10
				}
			},
			["advtoolbox"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 20,
					["copper"] = 25
				}
			},
			["WEAPON_WRENCH"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 20,
					["copper"] = 15
				}
			},
			["tyres"] = {
				["amount"] = 4,
				["destroy"] = false,
				["require"] = {
					["plastic"] = 15,
					["rubber"] = 5
				}
			},
			["credential"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["plastic"] = 10
				}
			},	
			["nitro"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 20,
					["copper"] = 30
				}
			},			
			["notebook"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 30,
					["glass"] = 60,
					["plastic"] = 80
				}
			}
		}
	},
	["lockShop"] = {
		["list"] = {

	        ["lockpick"] = {
		        ["amount"] = 1,
	        	["destroy"] = false,
	           	["require"] = {
		     	["brokenpick"] = 5
		        }
	        }
        }
    },
	["fazendeiroShop"] = {
		["list"] = {
	        ["bread"] = {
		        ["amount"] = 1,
	        	["destroy"] = false,
	           	["require"] = {
		     	["wheat"] = 10
		        }
	        }
        }
    },
	["Burgershot2"] = {
		["perm"] = "Burgershot",
		["list"] = {
	        ["combo1"] = {
		        ["amount"] = 1,
	        	["destroy"] = false,
	           	["require"] = {
		     	["heartstopper"] = 1,
				["taco"] = 1,
				["milkshake"] = 1,
				["passionjuice"] = 1
		        }
	        },
			["combo2"] = {
		        ["amount"] = 1,
	        	["destroy"] = false,
	           	["require"] = {
				["torpedo"] = 1,
				["shotrings"] = 1,
				["icecream1"] = 1,
				["orangejuice"] = 1
				}
	        },
			["combo3"] = {
		        ["amount"] = 1,
	        	["destroy"] = false,
	           	["require"] = {
				["bleeder"] = 1,
				["fries"] = 1,
				["orangejuice"] = 1
				}
	        }
        }
    },
	["Burgershot"] = {
		["perm"] = "Burgershot",
		["list"] = {
			["heartstopper"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["meat"] = 10,
					["bread"] = 1,
					["lettuce"] = 10,
					["cheese"] = 2,
					["tomato"] = 10
				}
			},
			["moneyshot"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["meat"] = 5,
					["bread"] = 1,
					["lettuce"] = 5,
					["cheese"] = 1,
					["tomato"] = 5
				}
			},
			["torpedo"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["meat"] = 5,
					["bread"] = 1,
					["lettuce"] = 5,
					["cheese"] = 1,
					["tomato"] = 5
				}
			},		
			["bleeder"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["meat"] = 3,
					["bread"] = 1,
					["lettuce"] = 3,
					["cheese"] = 1,
					["tomato"] = 3
				}
			},	
			["meatfree"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["meat"] = 3,
					["bread"] = 1,
					["lettuce"] = 3,
					["cheese"] = 1,
					["tomato"] = 3
				}
			},		
			["fries"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["potato"] = 15
				}
			},	
			["shotrings"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["onion"] = 15
				}
			},
			["taco"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["meat"] = 2,
					["wheat"] = 5,
					["lettuce"] = 2,
					["cheese"] = 1,
					["tomato"] = 2
				}
			},
			["wrap"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["meat"] = 2,
					["wheat"] = 5,
					["lettuce"] = 2,
					["cheese"] = 1,
					["tomato"] = 2
				}
			},
			["icecream1"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["milkbottle"] = 2,
					["cacau"] = 5
				}
			},	
			
			["icecream2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["milkbottle"] = 2,
					["coffee2"] = 5
				}
			},
			["torta"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["wheat"] = 10,
					["apple"] = 3
				}
			},	
			["milkshake"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["milkbottle"] = 2,
					["banana"] = 5
				}
			},	
			["orangejuice"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["water"] = 3,
					["orange"] = 10
				}
			},
			["grapejuice"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["water"] = 3,
					["grape"] = 10
				}
			},
			["strawberryjuice"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["water"] = 3,
					["strawberry"] = 10
				}
			},
			["passionjuice"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["water"] = 3,
					["passion"] = 15
				}
			},

			["cappuccino"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["cacau"] = 2,
					["milkbottle"] = 2,
					["coffee2"] = 5
				}
			}
		}
	},
	["itensShop"] = {
		["list"] = {
			["ketchup"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["emptybottle"] = 1,
					["tomato"] = 6
				}
			},
			["emptybottle"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["plastic"] = 2
				}
			},		
			["bucket"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["plastic"] = 5,
					["aluminum"] = 2
				}
			},
			["campfire"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["alcohol"] = 1,
					["lighter"] = 1,
					["woodlog"] = 10
				}
			},
			["dollars"] = {
				["amount"] = 5000,
				["destroy"] = false,
				["require"] = {
					["cryptocoins"] = 20000
				}
			}
		}
	},
	["craftShop"] = {
		["list"] = {
			["ketchup"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["emptybottle"] = 1,
					["tomato"] = 6
				}
			},
			["bandage"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["plaster"] = 1,
					["cotton"] = 1,
					["alcohol"] = 1
				}
			},
			["gauze"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["saline"] = 1,
					["cotton"] = 1
				}
			},
			["bucket"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["plastic"] = 5,
					["aluminum"] = 2
				}
			},
			["campfire"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["alcohol"] = 1,
					["lighter"] = 1,
					["woodlog"] = 10
				}
			},
			["seaweed"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["wheat"] = 3
				}
			},
			["dollars"] = {
				["amount"] = 4750,
				["destroy"] = false,
				["require"] = {
					["cryptocoins"] = 21600
				}
			}
		}
	},
	["ammuShop"] = {
		["list"] = {
			["attachsFlashlight"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["techtrash"] = 10,
					["roadsigns"] = 2,
					["glass"] = 1,
					["plastic"] = 3
				}
			},
			["attachsCrosshair"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["techtrash"] = 10,
					["roadsigns"] = 2,
					["glass"] = 2,
					["aluminum"] = 1
				}
			},
			["attachsSilencer"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["techtrash"] = 10,
					["roadsigns"] = 6,
					["sheetmetal"] = 6
				}
			},
			["attachsGrip"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["techtrash"] = 10,
					["roadsigns"] = 2,
					["aluminum"] = 3
				}
			}
		}
	},
	["Motoclub"] = {
		["perm"] = "Motoclub",
		["list"] = {
			["lockpick"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 20,
					["plastic"] = 10
					
				}
			},
			["lockpick2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 20,
					["rubber"] = 10
					
				}
			},
			["blocksignal"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 20,
					["plastic"] = 20,
					["rubber"] = 10
					
				}
			},
			["plate"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 20,
					["rubber"] = 10										
				}
			}
		}
	},
	["Vagos"] = {
		["perm"] = "Vagos",
		["list"] = {
			["cocaine"] = { -- cocaina
				["amount"] = 2,
				["destroy"] = false,
				["require"] = {
					["sulfuric"] = 1,
					["cokeleaf"] = 1
				}
			},	
			["coketable"] = { -- mesa de coca
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["nails"] = 200,
					["woodlog"] = 150,
					["leather"] = 100,
				}
			}
		}
	},	
				
	["Vagos2"] = {
		["operm"] = "Vagos2",
		["list"] = {			
			["handcuff"] = { -- algema
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 15
				}
			},	
			["vest"] = { -- colete
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["tarp"] = 15,
					["rubber"] = 40,
					["copper"] = 15
				}
			},			
			["hood"] = { -- capuz
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["plastic"] = 30,
					["tarp"] = 15
				}
			}	
		}
	},	
	["Ballas"] = {
		["perm"] = "Ballas",
		["list"] = {
			["joint"] = { -- maconha
				["amount"] = 2,
				["destroy"] = false,
				["require"] = {
					["silk"] = 1,
					["weedleaf"] = 1
				}
			},	
			["weedtable"] = { -- mesa de maconha
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["nails"] = 200,
					["woodlog"] = 150,
					["leather"] = 100,
				}
			}
		}
	},		
	["Ballas2"] = {
		["perm"] = "Ballas",
		["list"] = {			
			["handcuff"] = { -- algema
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 30,
					["copper"] = 15
				}
			},	
			["vest"] = { -- colete
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["tarp"] = 15,
					["rubber"] = 40,
					["copper"] = 15
				}
			},			
			["hood"] = { -- capuz
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["plastic"] = 30,
					["tarp"] = 15
				}
			}	
		}
	},	
    ["Ilegalfree"] = {
		["list"] = {
			["card01"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["plastic"] = 50,
					["copper"] = 10
				}
			},
			["card02"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["plastic"] = 50,
					["copper"] = 10
				}
			},
			["card03"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["plastic"] = 60,
					["copper"] = 10
				}
			},
			["card04"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["plastic"] = 60,
					["copper"] = 20
				}
			},
			["card05"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["plastic"] = 50,
					["copper"] = 10
				}
			},
			["pendrive"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["plastic"] = 20,
					["copper"] = 10
				}
			},
			["floppy"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["plastic"] = 10,
					["copper"] = 2
				}
			}
		}
	},	
    ["Mafiavinhedo2"] = {
		["perm"] = "Mafiavinhedo",
		["list"] = {
			["pistolkitten"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["ferro"] = 1
				}
			},
			["pistolbody"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["bronze"] = 1,
					["chumbo"] = 2
				}
			},			
			["smgkitten"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["ferro"] = 2
				}
			},
			["smgbody"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["bronze"] = 2,
					["chumbo"] = 4
				}
			},			
			["riflekitten"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["ferro"] = 3
				}
			},
			["riflebody"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["bronze"] = 4,
					["chumbo"] = 6
				}
			}
		}
	},	
	["Mafiavinhedo"] = {
		["perm"] = "Mafiavinhedo",
		["list"] = {
			["WEAPON_PISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 1,
					["pistolkitten"] = 1
				}
			},
			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 1,
					["pistolkitten"] = 1
				}
			},
			["WEAPON_MACHINEPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 1,
					["smgkitten"] = 1
				}
			},		
			["WEAPON_SMG_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 1,
					["smgkitten"] = 1
				}
			},		
			["WEAPON_ASSAULTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 1,
					["riflekitten"] = 1
				}
			},
			["WEAPON_ASSAULTRIFLE_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 1,
					["riflekitten"] = 1
				}
			},
			["WEAPON_ADVANCEDRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 1,
					["riflekitten"] = 1
				}
			}
		}
	},			
	["Bunker"] = {
		["perm"] = "Bunker",
		["list"] = {
			["projetil"] = { 
				["amount"] = 250,
				["destroy"] = false,
				["require"] = {
					["chumbo"] = 1
				}
			},
			["projetil_reforcado"] = {
				["amount"] = 150,
				["destroy"] = false,
				["require"] = {
					["chumbo"] = 2
				}
			},
			["capsula_pistol"] = {
				["amount"] = 250,
				["destroy"] = false,
				["require"] = {
					["bronze"] = 1,
					["ferro"] = 1																										
				}
			},
			["capsula_smg"] = {
				["amount"] = 200,
				["destroy"] = false,
				["require"] = {
					["bronze"] = 1,
					["ferro"] = 1																										
				}
			},
			["capsula_fuzil"] = {
				["amount"] = 150,
				["destroy"] = false,
				["require"] = {
					["bronze"] = 1,
					["ferro"] = 1																										
				}
			}								
		}
	},
	["Bunker2"] = {
		["perm"] = "Bunker",
		["list"] = {
			["WEAPON_PISTOL_AMMO"] = { 
				["amount"] = 100,
				["destroy"] = false,
				["require"] = {
					["capsula_pistol"] = 100,
					["polvora"] = 100,
					["projetil"] = 100
				}
			},
			["WEAPON_SMG_AMMO"] = {
				["amount"] = 100,
				["destroy"] = false,
				["require"] = {
					["capsula_smg"] = 100,
					["polvora"] = 100,
					["projetil"] = 100
				}
			},
			["WEAPON_RIFLE_AMMO"] = {
				["amount"] = 100,
				["destroy"] = false,
				["require"] = {
					["capsula_fuzil"] = 100,
					["polvora"] = 100,
					["projetil_reforcado"] = 100																									
				}
			}								
		}
	},
	["Yakuza"] = {
		["perm"] = "Yakuza",
		["list"] = {
			["dollars"] = { 
				["amount"] = 95000,
				["destroy"] = false,
				["require"] = {
					["dollars2"] = 100000,
					["newspaper"] = 100
				}
			}
		}
	},
	["LavagemNPC"] = {
		["list"] = {
			["dollars"] = { 
				["amount"] = 60000,
				["destroy"] = false,
				["require"] = {
					["dollars2"] = 100000
				}
			}
		}
	},
	["huntingShop"] = {
		["list"] = {
			["leather"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["animalpelt"] = 5
				}
			}
		}
	},	
	["ropeShop"] = {
		["list"] = {
			["rope"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["leather"] = 5,
					["plastic"] = 10,
					["woodlog"] = 20
				}
			}
		}
	},
	["FertilizanteShop"] = {
		["list"] = {
			["fertilizer"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["esterco"] = 5
				}
			}
		}
	},
	["PenShop"] = {
		["list"] = {
			["c4"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["dollars2"] = 5000
				}
			},
			["pendrive2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["winner"] = 5,
					["dollars2"] = 5000
				}
			}
		}
	},		
	["minerShop"] = {
		["list"] = {
			["chumbo"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["min_chumbo"] = 40
				}
			},
			["ferro"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["min_ferro"] = 40
				}
			},
			["bronze"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["min_cobre"] = 40,
					["bauxita"] = 40
				}
			},
			["polvora"] = {
				["amount"] = 250,
				["destroy"] = false,
				["require"] = {
					["carvao"] = 40,
					["nitrato"] = 40,
					["enxofre"] = 5
				}
			}
		}
	},
	["lixeiroShop"] = {
		["list"] = {
			["glass"] = {
				["amount"] = 3,
				["destroy"] = false,
				["require"] = {
					["glassbottle"] = 1
				}
			},
			["plastic"] = {
				["amount"] = 3,
				["destroy"] = false,
				["require"] = {
					["plasticbottle"] = 1
				}
			},
			["rubber"] = {
				["amount"] = 3,
				["destroy"] = false,
				["require"] = {
					["elastic"] = 1
				}
			},
			["aluminum"] = {
				["amount"] = 3,
				["destroy"] = false,
				["require"] = {
					["metalcan"] = 1
				}
			},
			["copper"] = {
				["amount"] = 3,
				["destroy"] = false,
				["require"] = {
					["battery"] = 1
				}
			}
		}
	},
	["fuelShop"] = {
		["list"] = {
			["WEAPON_PETROLCAN"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["dollars"] = 200
				}
			},
			["WEAPON_PETROLCAN_AMMO"] = {
				["amount"] = 4500,
				["destroy"] = false,
				["require"] = {
					["dollars"] = 1000
				}
			}
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTPERM
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.requestPerm(craftType)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getFines(user_id) > 0 then
			TriggerClientEvent("Notify",source,"vermelho","Multas pendentes encontradas.",3000)
			return false
		end

		if exports["hud"]:Wanted(user_id) then
			return false
		end

		if craftList[craftType]["perm"] ~= nil then
			if not vRP.hasGroup(user_id,craftList[craftType]["perm"]) then
				return false
			end
		end

		return true
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.requestCrafting(craftType)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local inventoryShop = {}
		for k,v in pairs(craftList[craftType]["list"]) do
			local craftList = {}
			for k,v in pairs(v["require"]) do
				table.insert(craftList,{ name = itemName(k), amount = v })
			end

			table.insert(inventoryShop,{ name = itemName(k), index = itemIndex(k), key = k, peso = itemWeight(k), list = craftList, amount = parseInt(v["amount"]), desc = itemDescription(k) })
		end

		local inventoryUser = {}
		local inventory = vRP.userInventory(user_id)
		for k,v in pairs(inventory) do
			v["amount"] = parseInt(v["amount"])
			v["name"] = itemName(v["item"])
			v["peso"] = itemWeight(v["item"])
			v["index"] = itemIndex(v["item"])
			v["key"] = v["item"]
			v["slot"] = k

			local splitName = splitString(v["item"],"-")
			if splitName[2] ~= nil then
				if itemDurability(v["item"]) then
					v["durability"] = parseInt(os.time() - splitName[2])
					v["days"] = itemDurability(v["item"])
				else
					v["durability"] = 0
					v["days"] = 1
				end
			else
				v["durability"] = 0
				v["days"] = 1
			end

			inventoryUser[k] = v
		end

		return inventoryShop,inventoryUser,vRP.inventoryWeight(user_id),vRP.getWeight(user_id)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.functionCrafting(shopItem,shopType,shopAmount,slot)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shopAmount == nil then shopAmount = 1 end
		if shopAmount <= 0 then shopAmount = 1 end

		if craftList[shopType]["list"][shopItem] then
			if vRP.checkMaxItens(user_id,shopItem,craftList[shopType]["list"][shopItem]["amount"] * shopAmount) then
				TriggerClientEvent("Notify",source,"amarelo","Limite atingido.",3000)
				TriggerClientEvent("crafting:Update",source,"requestCrafting")
				return
			end

			if (vRP.inventoryWeight(user_id) + (itemWeight(shopItem) * parseInt(shopAmount))) <= vRP.getWeight(user_id) then
				if shopItem == "nails" then
					local Inventory = vRP.userInventory(user_id)
					if Inventory then
						for k,v in pairs(Inventory) do
							if string.sub(v["item"],1,5) == "badge" then
								vRP.removeInventoryItem(user_id,v["item"],1,false)
								vRP.generateItem(user_id,shopItem,craftList[shopType]["list"][shopItem]["amount"] * shopAmount,false,slot)
								break
							end
						end
					end
				else
					for k,v in pairs(craftList[shopType]["list"][shopItem]["require"]) do
						local consultItem = vRP.getInventoryItemAmount(user_id,k)
						if consultItem[1] < parseInt(v * shopAmount) then
							return
						end

						if vRP.checkBroken(consultItem[2]) then
							TriggerClientEvent("Notify",source,"vermelho","Item quebrado.",5000)
							return
						end
					end

					for k,v in pairs(craftList[shopType]["list"][shopItem]["require"]) do
						local consultItem = vRP.getInventoryItemAmount(user_id,k)
						vRP.removeInventoryItem(user_id,consultItem[2],parseInt(v * shopAmount))
					end

					vRP.generateItem(user_id,shopItem,craftList[shopType]["list"][shopItem]["amount"] * shopAmount,false,slot)
				end
			end
		end

		TriggerClientEvent("crafting:Update",source,"requestCrafting")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONDESTROY
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.functionDestroy(shopItem,shopType,shopAmount,slot)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shopAmount == nil then shopAmount = 1 end
		if shopAmount <= 0 then shopAmount = 1 end
		local splitName = splitString(shopItem,"-")

		if craftList[shopType]["list"][splitName[1]] then
			if craftList[shopType]["list"][splitName[1]]["destroy"] then
				if vRP.checkBroken(shopItem) then
					TriggerClientEvent("Notify",source,"vermelho","Itens quebrados reciclados.",5000)
					TriggerClientEvent("crafting:Update",source,"requestCrafting")
					return
				end

				if vRP.tryGetInventoryItem(user_id,shopItem,craftList[shopType]["list"][splitName[1]]["amount"]) then
					for k,v in pairs(craftList[shopType]["list"][splitName[1]]["require"]) do
						if parseInt(v) <= 1 then
							vRP.generateItem(user_id,k,1)
						else
							vRP.generateItem(user_id,k,v / 2)
						end
					end
				end
			end
		end

		TriggerClientEvent("crafting:Update",source,"requestCrafting")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:populateSlot")
AddEventHandler("crafting:populateSlot",function(nameItem,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		if vRP.tryGetInventoryItem(user_id,nameItem,amount,false,slot) then
			vRP.giveInventoryItem(user_id,nameItem,amount,false,target)
			TriggerClientEvent("crafting:Update",source,"requestCrafting")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:updateSlot")
AddEventHandler("crafting:updateSlot",function(nameItem,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		local inventory = vRP.userInventory(user_id)
		if inventory[tostring(slot)] and inventory[tostring(target)] and inventory[tostring(slot)]["item"] == inventory[tostring(target)]["item"] then
			if vRP.tryGetInventoryItem(user_id,nameItem,amount,false,slot) then
				vRP.giveInventoryItem(user_id,nameItem,amount,false,target)
			end
		else
			vRP.swapSlot(user_id,slot,target)
		end

		TriggerClientEvent("crafting:Update",source,"requestCrafting")
	end
end)