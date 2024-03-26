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
Tunnel.bindInterface("shops",cRP)
vCLIENT = Tunnel.getInterface("shops")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local shops = {
	["imoveisShop"] = {
		["mode"] = "Buy",
		["perm"] = "Obey",
		["type"] = "Cash",
		["list"] = {
			["contract1"] = 2000000,
			["contract2"] = 1200000,
			["contract3"] = 1000000,
			["contract4"] = 850000,
			["contract5"] = 750000,
			["contract6"] = 650000,
			["contract7"] = 650000,
			["contract8"] = 500000,
			["contract9"] = 400000,
			["contract10"] = 1000000
		}
	},
	["identityStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["identity"] = 20000
		}
	},
	["fazendeiroStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["cheese"] = 500,
			["emptybottle"] = 250
		}
	},
	["cogumeloStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["mushroomtea"] = 7000
		}
	},	
	["ropeStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["rope"] = 3000
		}
	},
	["fidentityStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["fidentity"] = 100000
		}
	},
	["animalStore"] = {
		["mode"] = "Buy",
		["type"] = "Premium",
		["list"] = {
			["rottweiler"] = 30,
			["husky"] = 30,
			["shepherd"] = 30,
			["retriever"] = 30,
			["poodle"] = 30,
			["pug"] = 30,
			["westy"] = 30,
			["cat"] = 30
		}
	},
	["departamentStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
		    ["cellphone"] = 7000,
			["backpack"] = 10000,
			["radio"] = 5000,
			["energetic"] = 8000,
			["chocolate"] = 3000,
			["sandwich"] = 2000,
			["chandon"] = 3000,
			["dewars"] = 2000,
			["hennessy"] = 2000,
			["absolut"] = 2500,
			["water"] = 2000,
			["tacos"] = 2000
		}
	},
	["pier"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["nigirizushi"] = 5000,
			["sushi"] = 5000,
			["cookedfishfillet"] = 6000,
			["cannedsoup"] = 5000,
			["canofbeans"] = 5000,
			["cookies"] = 3000,
			["cola"] = 3000,
			["soda"] = 3000
		}
	},
	["burgershot"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["heartstopper"] = 7500,
			["moneyshot"] = 4500,
			["torpedo"] = 4500,
			["bleeder"] = 3500,
			["meatfree"] = 3500,
			["taco"] = 3500,
			["wrap"] = 2500,
			["shotrings"] = 2500,
			["fries"] = 2500,
			["torta"] = 3500,
			["milkshake"] = 3500,
			["icecream1"] = 3500,
			["icecream2"] = 3500,
			["cappuccino"] = 3500,
			["passionjuice"] = 5000,
			["grapejuice"] = 4500,
			["orangejuice"] = 4500,
			["strawberryjuice"] = 4500
		}
	},
	["chicken"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["baldedefrango"] = 6000,
			["frangofrito"] = 5000,
			["cola"] = 3000,
			["soda"] = 3000,
			["applelove"] = 3000
		}
	},
	["fishdepartamentStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["bait"] = 10,
			["fishingrod"] = 500
		}
	},
	["mercadoCentral"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["rose"] = 80,
			["cigarette"] = 75,
			["lighter"] = 55,
			["postit"] = 150,
			["notepad"] = 100,
			["firecracker"] = 3000,
			["anotacoes"] = 2500,
			["chair01"] = 750,
			["teddy"] = 500,
			["WEAPON_BRICK"] = 550,
			["enxofre"] = 1000,
			["bucket"] = 500,
			["fertilizer"] = 1000,
		}
	},
	["Clothes"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
		}
	},
	["ilegalshop2"] = { 
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["pliers"] = 200,
			["card01"] = 5000,
			["card02"] = 5000,
			["card03"] = 10000,
			["card04"] = 5000,
			["card05"] = 20000,
			["pendrive"] = 5000,
			["floppy"] = 1000,
			["WEAPON_CROWBAR"] = 15000
		}
	},
	["ilegalshop3"] = {
	["mode"] = "Buy",
	["type"] = "Cash",
	["list"] = {
		["pliers"] = 200,
		["card01"] = 5000,
		["card02"] = 5000,
		["card03"] = 10000,
		["card04"] = 5000,
		["card05"] = 20000,
		["pendrive"] = 5000,
		["pendrive2"] = 10000,
		["floppy"] = 1000,
		["c4"] = 5000,
		["pager"] = 5000,
		["WEAPON_CROWBAR"] = 15000,
	}
    },
	["minerioShop2"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["bronze"] = 2500,
			["chumbo"] = 1600,
			["ferro"] = 3300
		}
	},
	["mechanicTools"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["tyres"] = 1000,
			["toolbox"] = 5000,
			["WEAPON_WRENCH"] = 8000
		}
	},
	["mechanicTools2"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["tyres"] = 1500,
			["toolbox"] = 6000,
			["ticket_tunagem"] = 10000,
			["WEAPON_WRENCH"] = 9000
		}
	},
	["mechanicBuy"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Mechanic",
		["list"] = {
			["tyres"] = 400,
			["toolbox"] = 2500,
			["advtoolbox"] = 7000,
			["notebook"] = 9000,
			["nitro"] = 9000,
			["credential"] = 850,
			["WEAPON_WRENCH"] = 3500
		}
	},
	["weaponsStore"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["pistolbody"] = 425,
			["smgbody"] = 525,
			["riflebody"] = 625
		}
	},
	["oxyStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["oxy"] = 150
		}
	},
	["pharmacyStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["gauze"] = 800,
			["sinkalmy"] = 1000,
			["analgesic"] = 1500,
			["ritmoneury"] = 2000,
			["adrenaline"] = 10000,
		    ["medkit"] = 7500,
			["bandage"] = 3000
		}
	},
	["pharmacyParamedic"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Paramedic",
		["list"] = {
			["badge04"] = 100,
			["syringe"] = 100,
			["gauze"] = 100,
			["adrenaline"] = 100,
			["sinkalmy"] = 100,
			["analgesic"] = 100,
			["ritmoneury"] = 100,
			["wheelchair"] = 100,
			["defibrillator"] = 100,
			["medicbag"] = 100,
			["bandage"] = 100,
			["syringe01"] = 2,
			["syringe02"] = 2,
			["syringe03"] = 2,
			["syringe04"] = 2
		}
	},
	["attachStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["attachsFlashlight"] = 5000,
			["attachsCrosshair"] = 5000,
			["attachsSilencer"] = 5000,
			["attachsGrip"] = 5000

		}
	},
	["ammunationStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["GADGET_PARACHUTE"] = 5000,
			["WEAPON_HATCHET"] = 15000,
			["WEAPON_BAT"] = 15000,
			["WEAPON_BATTLEAXE"] = 15000,
			["WEAPON_GOLFCLUB"] = 15000,
			["WEAPON_HAMMER"] = 15000,
			["WEAPON_MACHETE"] = 15000,
			["WEAPON_POOLCUE"] = 15000,
			["WEAPON_STONE_HATCHET"] = 15000,
			["WEAPON_KNUCKLE"] = 15000,
			["WEAPON_FLASHLIGHT"] = 5000
		}
	},
	["burgerStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Burgershot",
		["list"] = {
			["combo1"] = 10000,
			["combo2"] = 6500,
			["combo3"] = 4000
		}
	},
	["premiumStore"] = {
		["mode"] = "Buy",
		["type"] = "Premium",
		["list"] = {
			["gemstone"] = 1,
			["premium"] = 50,
			["premiumplate"] = 20,
			["newgarage"] = 20,
			-- ["newchars"] = 100,
			["namechange"] = 20,
			["chip"] = 30,
			["newlocate"] = 10
		}
	},
	["pneuilegal"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["tyres"] = 450		
		}
	},			
	-- ["huntingSell"] = {
	-- 	["mode"] = "Sell",
	-- 	["type"] = "Cash",
	-- 	["list"] = {
	-- 		["meat"] = 90,
	-- 		["animalpelt"] = 100,
	-- 		["animalfat"] = 70
	-- 	}
	-- },
	["fishingSell"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["octopus"] = 20,
			["shrimp"] = 20,
			["carp"] = 35,
			["horsefish"] = 35,
			["tilapia"] = 40,
			["codfish"] = 45,
			["catfish"] = 45,
			["goldenfish"] = 50,
			["pirarucu"] = 50,
			["pacu"] = 50,
			["tambaqui"] = 50
		}
	},
	["huntingStore"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["WEAPON_SWITCHBLADE"] = 525,
			["WEAPON_MUSKET"] = 3250,
			["WEAPON_MUSKET_AMMO"] = 7
		}
	},
	["trofeuSell"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["winner"] = 10000
		}
	},
	["armamentoBuy"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["WEAPON_PISTOL"] = 46000,
			["WEAPON_PISTOL_MK2"] = 46000,
			["WEAPON_MACHINEPISTOL"] = 86000,
			["WEAPON_SMG_MK2"] = 86000,
			["WEAPON_ASSAULTRIFLE"] = 86000,
			["WEAPON_ASSAULTRIFLE_MK2"] = 142000,
			["WEAPON_ADVANCEDRIFLE"] = 142000,
			["WEAPON_PISTOL_AMMO"] = 120,
			["WEAPON_SMG_AMMO"] = 150,
			["WEAPON_RIFLE_AMMO"] = 200
		}
	},
	["coleteBuy"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["vest"] = 20000,
			["handcuff"] = 12000,
			["hood"] = 8000
		}
	},
	["drogasBuy"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["joint"] = 150,
			["cocaine"] = 150
		}
	},
	["mesadrogasBuy"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["coketable"] = 50000,
			["weedtable"] = 50000,
			["weedseed"] = 100,
			["cokeseed"] = 100,
			["silk"] = 50,
			["sulfuric"] = 50

		}
	},
	["ilegalSniper"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["WEAPON_SNIPERRIFLE"] = 250000,
			["WEAPON_MUSKET_AMMO"] = 7
		}
	},
	["recyclingSell"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {

			["plastic"] = 30,
			["glass"] = 30,
			["rubber"] = 30,
			["aluminum"] = 45,
			["copper"] = 60,
			["newspaper"] = 20,
			["silvercoin"] = 250,
			["goldcoin"] = 350
		}
	},
	["minerShop"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["emerald"] = 500,
			["diamond"] = 350,
			["ruby"] = 250,
			["sapphire"] = 200,
			["amethyst"] = 150,
			["amber"] = 120,
			["turquoise"] = 80
		}
	},
	["animalShop"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["meat"] = 50,
			["animalfat"] = 40, 
			["animalpelt"] = 80 
		}
	},
	["minerioShop"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["bauxita"] = 22,
			["carvao"] = 18,
			["nitrato"] = 20,
			["min_chumbo"] = 30,
			["min_ferro"] = 28,
			["min_cobre"] = 32
		}
	},
	["coffeeMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["coffee"] = 3000
		}
	},
	["sodaMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["cola"] = 3000,
			["soda"] = 3000,
			["energetic"] = 8000
		}
	},
	["cyberbar"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["cola"] = 3000,
			["soda"] = 3000,
			["water"] = 2000,
			["energetic"] = 8000,
			["chocolate"] = 3000,
			["sandwich"] = 2000,
			["chandon"] = 3000,
			["dewars"] = 2000,
			["hennessy"] = 2000,
			["absolut"] = 2500,
			["tacos"] = 2000
		}
	},
	["cyberbar2"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["tablet"] = 15000,
			["cellphone"] = 7000,
			["radio"] = 5000,
			["vape"] = 10000,
			["binoculars"] = 2000,
			["camera"] = 2500
		}
	},	
	["donutMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["donut"] = 3000,
			["chocolate"] = 3000
		}
	},
	["burgerMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["sandwich"] = 2000,
			["water"] = 2000
		}
	},
	["hotdogMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["tacos"] = 2000,
			["water"] = 2000
		}
	},
	["Chihuahua"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["sandwich"] = 2000,
			["tacos"] = 2000,
			["water"] = 2000,			
			["cola"] = 3000,			
			["soda"] = 3000
		}
	},
	["waterMachine"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["water"] = 2000
		}
	},
	["portelspd"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Police",
		["list"] = {
			["WEAPON_PISTOL50"] = 23000,
			["WEAPON_PISTOL_AMMO"] = 60
		}
	},
	["arsenallspd2"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Police",
		["list"] = {
			["vest"] = 1000,
			["gsrkit"] = 250,
			["gdtkit"] = 250,
			["barrier"] = 250,
			["handcuff"] = 500,
			["rope"] = 500,
			["attachsSilencer"] = 1000,
			["attachsGrip"] = 1000,
			["attachsCrosshair"] = 1000,
			["attachsFlashlight"] = 1000,
			["WEAPON_FLASHLIGHT"] = 1000,
			["radio"] = 1500,
			["adrenaline"] = 500,
			["cellphone"] = 2500
			
		}
	},
	["arsenallspd"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["perm"] = "Police",
		["list"] = {
			["WEAPON_SMG"] = 1250,
			["WEAPON_CARBINERIFLE"] = 2500,
			["WEAPON_CARBINERIFLE_MK2"] = 2500,
			["WEAPON_STUNGUN"] = 500,
			["WEAPON_COMBATPISTOL"] = 1000,
			["WEAPON_NIGHTSTICK"] = 250,
			["WEAPON_SPECIALCARBINE_MK2"] = 2500,
			["WEAPON_MINISMG"] = 1250,
			["WEAPON_PISTOL_AMMO"] = 20,
			["WEAPON_SMG_AMMO"] = 30,
			["WEAPON_RIFLE_AMMO"] = 40,
			["WEAPON_BZGAS"] = 250
		}
	},	
	["ilegalHouse"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["keyboard"] = 250,
			["mouse"] = 200,
			["playstation"] = 1000,
			["xbox"] = 1000,
			["brick"] = 20,
			["dish"] = 45,
			["pan"] = 180,
			["fan"] = 550,
			["blender"] = 450,
			["switch"] = 90,
			["cup"] = 90,
			["lampshade"] = 300
		}
	},
	["ilegalCosmetics"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["silverring"] = 450,
			["goldring"] = 700,
			["watch"] = 1000,
			["bracelet"] = 500,
			["dildo"] = 450,
			["spray01"] = 450,
			["spray02"] = 450,
			["spray03"] = 450,
			["spray04"] = 450,
			["sneakers"] = 600,
			["slipper"] = 400,
			["rimel"] = 450,
			["brush"] = 450,
			["soap"] = 400
		}
	},
	["ilegalToys"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["eraser"] = 160,
			["legos"] = 170,
			["ominitrix"] = 170,
			["dices"] = 80,
			["domino"] = 170,
			["floppy"] = 100,
			["horseshoe"] = 160,
			["camera"] = 1000,
			["binoculars"] = 750,
			["deck"] = 100
		}
	},
	["ilegalCriminal"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["goldbar"] = 850,
			["brokenpick"] = 80,
			["pliers"] = 80,
			["pager"] = 110,
			["card01"] = 5000,
			["card02"] = 5000,
			["card03"] = 10000,
			["card04"] = 5000,
			["card05"] = 10000,
			["pendrive"] = 5000
		}
	},
	["woodsell"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["woodlog"] = 35
		}
	},
	["wheatsell"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["wheat"] = 45,
			["potato"] = 55,
			["lettuce"] = 45,
			["onion"] = 55,
			["tomato"] = 45,
			["coffee2"] = 55
		}
	},
	["vestsell"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["banana"] = 50,
			["passion"] = 50,
			["tange"] = 50,   
			["orange"] = 50,
			["grape"] = 75,
			["acerola"] = 75,
			["apple"] = 75,
			["strawberry"] = 75,
			["cacau"] = 75
		}
	},
	["casinoFichasBuy"] = {
		["mode"] = "Buy",
		["type"] = "Cash",
		["list"] = {
			["fichas"] = 1
		}
	},
	["casinoFichasSell"] = {
		["mode"] = "Sell",
		["type"] = "Cash",
		["list"] = {
			["fichas"] = 1
		}
	},
	["coinsSell"] = {
		["mode"] = "CoinsSell",
		["type"] = "Coins",
		["list"] = {
			["coins"] = 1
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- NAMES
-----------------------------------------------------------------------------------------------------------------------------------------
local nameMale = { "James","John","Robert","Michael","William","David","Richard","Charles","Joseph","Thomas","Christopher","Daniel","Paul","Mark","Donald","George","Kenneth","Steven","Edward","Brian","Ronald","Anthony","Kevin","Jason","Matthew","Gary","Timothy","Jose","Larry","Jeffrey","Frank","Scott","Eric","Stephen","Andrew","Raymond","Gregory","Joshua","Jerry","Dennis","Walter","Patrick","Peter","Harold","Douglas","Henry","Carl","Arthur","Ryan","Roger","Joe","Juan","Jack","Albert","Jonathan","Justin","Terry","Gerald","Keith","Samuel","Willie","Ralph","Lawrence","Nicholas","Roy","Benjamin","Bruce","Brandon","Adam","Harry","Fred","Wayne","Billy","Steve","Louis","Jeremy","Aaron","Randy","Howard","Eugene","Carlos","Russell","Bobby","Victor","Martin","Ernest","Phillip","Todd","Jesse","Craig","Alan","Shawn","Clarence","Sean","Philip","Chris","Johnny","Earl","Jimmy","Antonio" }
local nameFemale = { "Mary","Patricia","Linda","Barbara","Elizabeth","Jennifer","Maria","Susan","Margaret","Dorothy","Lisa","Nancy","Karen","Betty","Helen","Sandra","Donna","Carol","Ruth","Sharon","Michelle","Laura","Sarah","Kimberly","Deborah","Jessica","Shirley","Cynthia","Angela","Melissa","Brenda","Amy","Anna","Rebecca","Virginia","Kathleen","Pamela","Martha","Debra","Amanda","Stephanie","Carolyn","Christine","Marie","Janet","Catherine","Frances","Ann","Joyce","Diane","Alice","Julie","Heather","Teresa","Doris","Gloria","Evelyn","Jean","Cheryl","Mildred","Katherine","Joan","Ashley","Judith","Rose","Janice","Kelly","Nicole","Judy","Christina","Kathy","Theresa","Beverly","Denise","Tammy","Irene","Jane","Lori","Rachel","Marilyn","Andrea","Kathryn","Louise","Sara","Anne","Jacqueline","Wanda","Bonnie","Julia","Ruby","Lois","Tina","Phyllis","Norma","Paula","Diana","Annie","Lillian","Emily","Robin" }
local userName2 = { "Smith","Johnson","Williams","Jones","Brown","Davis","Miller","Wilson","Moore","Taylor","Anderson","Thomas","Jackson","White","Harris","Martin","Thompson","Garcia","Martinez","Robinson","Clark","Rodriguez","Lewis","Lee","Walker","Hall","Allen","Young","Hernandez","King","Wright","Lopez","Hill","Scott","Green","Adams","Baker","Gonzalez","Nelson","Carter","Mitchell","Perez","Roberts","Turner","Phillips","Campbell","Parker","Evans","Edwards","Collins","Stewart","Sanchez","Morris","Rogers","Reed","Cook","Morgan","Bell","Murphy","Bailey","Rivera","Cooper","Richardson","Cox","Howard","Ward","Torres","Peterson","Gray","Ramirez","James","Watson","Brooks","Kelly","Sanders","Price","Bennett","Wood","Barnes","Ross","Henderson","Coleman","Jenkins","Perry","Powell","Long","Patterson","Hughes","Flores","Washington","Butler","Simmons","Foster","Gonzales","Bryant","Alexander","Russell","Griffin","Diaz","Hayes" }
local userLocate = { "Sul","Norte" }
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTPERM
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.requestPerm(shopType)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getFines(user_id) > 0 then
			TriggerClientEvent("Notify",source,"amarelo","Multas pendentes encontradas.",3000)
			return false
		end

		if exports["hud"]:Wanted(user_id,source) then
			return false
		end

		if shops[shopType]["perm"] ~= nil then
			if not vRP.hasGroup(user_id,shops[shopType]["perm"]) then
				return false
			end
		end
		return true
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.requestShop(name)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local shopSlots = 20
		local inventoryShop = {}
		for k,v in pairs(shops[name]["list"]) do
			table.insert(inventoryShop,{ key = k, price = parseInt(v), name = itemName(k), index = itemIndex(k), peso = itemWeight(k), type = itemType(k), max = itemMaxAmount(k), desc = itemDescription(k) })
		end

		local inventoryUser = {}
		local inventory = vRP.userInventory(user_id)
		for k,v in pairs(inventory) do
			v["amount"] = parseInt(v["amount"])
			v["name"] = itemName(v["item"])
			v["peso"] = itemWeight(v["item"])
			v["index"] = itemIndex(v["item"])
			v["max"] = itemMaxAmount(v["item"])
			v["type"] = itemType(v["item"])
			v["desc"] = itemDescription(v["item"])
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

		if parseInt(#inventoryShop) > 20 then
			shopSlots = parseInt(#inventoryShop)
		end

		return inventoryShop,inventoryUser,vRP.inventoryWeight(user_id),vRP.getWeight(user_id),shopSlots
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPRA POR COINS 
-----------------------------------------------------------------------------------------------------------------------------------------

vRP._prepare('uf/getCoins',           'SELECT coins FROM summerz_characters WHERE id = @user_id') 
vRP._prepare('uf/removeCoins',        'UPDATE summerz_characters SET coins = coins - @coins WHERE id = @user_id')
vRP._prepare('uf/adicionarCoins',        'UPDATE summerz_characters SET coins = coins + @coins WHERE id = @user_id')

function cRP.getCoinsNew()
    local source = source 
    local user_id = vRP.getUserId(source)
    local coins = 0 
    local rows,affected = vRP.query("uf/getCoins",{ user_id = user_id })
    if #rows > 0 then 
      coins = rows[1].coins
    end
    return coins
  end

  function pagamentoCoins(coins)
    local retorna = false
    local source = source 
    local user_id = vRP.getUserId(source)
    local rows,affected = vRP.query("uf/getCoins",{ user_id = user_id })
    if #rows > 0 then 
       local userCoins = rows[1].coins
       if  userCoins >= coins then 
         vRP._execute('uf/removeCoins',{user_id = user_id, coins = coins})
         TriggerClientEvent("Notify", "sucesso", '-'..coins..' para o usuário '..user_id)
         retorna = true
       else 
          TriggerClientEvent("Notify", "sucesso", '-'..coins..' para o usuário '..user_id) -- msg de erro 
       end 
    end
    return retorna
  end

  function recebimentoCoins(coins)
    local retorna = false
    local source = source 
    local user_id = vRP.getUserId(source)
    vRP._execute('uf/adicionarCoins',{user_id = user_id, coins = coins})
    TriggerClientEvent("Notify", "sucesso", '-'..coins..' para o usuário '..user_id)
  end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETSHOPTYPE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.getShopType(name)
    return shops[name]["mode"]
end---------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.functionShops(shopType,shopItem,shopAmount,slot)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shops[shopType] then
			if shopAmount == nil then shopAmount = 1 end
			if shopAmount <= 0 then shopAmount = 1 end

			local inventory = vRP.userInventory(user_id)
			if (inventory[tostring(slot)] and inventory[tostring(slot)]["item"] == shopItem) or inventory[tostring(slot)] == nil then
				if shops[shopType]["mode"] == "Buy" then
					if vRP.checkMaxItens(user_id,shopItem,shopAmount) then
						TriggerClientEvent("Notify",source,"amarelo","Limite atingido.",3000)
						vCLIENT.updateShops(source,"requestShop")
						return
					end

					if (vRP.inventoryWeight(user_id) + (itemWeight(shopItem) * parseInt(shopAmount))) <= vRP.getWeight(user_id) then
						if shops[shopType]["type"] == "Cash" then
							if shops[shopType]["list"][shopItem] then
								if shopType == "mechanicTools" then
									local mecAmount = vRP.getUsersByPermission("Mechanic")
									if parseInt(#mecAmount) > 0 then
										TriggerClientEvent("Notify",source,"vermelho","Existem mecanicos em serviço!",5000)
										return
									end
								end
								if vRP.paymentFull(user_id,shops[shopType]["list"][shopItem] * shopAmount) then
									if shopItem == "identity" or string.sub(shopItem,1,5) == "badge" then
										vRP.generateItem(user_id,shopItem.."-"..user_id,parseInt(shopAmount),false,slot)
									elseif shopItem == "fidentity" then
										local identity = vRP.userIdentity(user_id)
										if identity then
											if identity["sex"] == "M" then
												vRP.execute("fidentity/newIdentity",{ name = nameMale[math.random(#nameMale)], name2 = userName2[math.random(#userName2)], locate = userLocate[math.random(#userLocate)], blood = math.random(4) })
											else
												vRP.execute("fidentity/newIdentity",{ name = nameFemale[math.random(#nameFemale)], name2 = userName2[math.random(#userName2)], locate = userLocate[math.random(#userLocate)], blood = math.random(4) })
											end

											local identity = vRP.userIdentity(user_id)
											local consult = vRP.query("fidentity/lastIdentity")
											if consult[1] then
												vRP.generateItem(user_id,shopItem.."-"..consult[1]["id"],parseInt(shopAmount),false,slot)
											end
										end
									else
										vRP.generateItem(user_id,shopItem,parseInt(shopAmount),false,slot)
									end

									TriggerClientEvent("sounds:source",source,"cash",0.1)
								else
									TriggerClientEvent("Notify",source,"vermelho","<b>Dólares</b> insuficientes.",5000)
								end
							end
						elseif shops[shopType]["type"] == "Consume" then
							if vRP.tryGetInventoryItem(user_id,shops[shopType]["item"],parseInt(shops[shopType]["list"][shopItem] * shopAmount)) then
								vRP.generateItem(user_id,shopItem,parseInt(shopAmount),false,slot)
								TriggerClientEvent("sounds:source",source,"cash",0.1)
							else
								TriggerClientEvent("Notify",source,"vermelho","<b>"..itemName(shops[shopType]["item"]).."</b> insuficiente.",5000)
							end
						elseif shops[shopType]["type"] == "Premium" then
							if vRP.paymentGems(user_id,shops[shopType]["list"][shopItem] * shopAmount) then
								TriggerClientEvent("sounds:source",source,"cash",0.1)
								vRP.generateItem(user_id,shopItem,parseInt(shopAmount),false,slot)
								TriggerClientEvent("Notify",source,"verde","Comprou <b>"..parseFormat(shopAmount).."x "..itemName(shopItem).."</b> por <b>"..parseFormat(shops[shopType]["list"][shopItem] * shopAmount).." Gemas</b>.",5000)
							else
								TriggerClientEvent("Notify",source,"vermelho","<b>Gemas</b> insuficientes.",5000)
							end
						end
					else
						TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
					end
				elseif shops[shopType]["mode"] == "Sell" then
					local splitName = splitString(shopItem,"-")

					if shops[shopType]["list"][splitName[1]] then
						local itemPrice = shops[shopType]["list"][splitName[1]]

						if itemPrice > 0 then
							if vRP.checkBroken(shopItem) then
								TriggerClientEvent("Notify",source,"vermelho","Itens quebrados não podem ser vendidos.",5000)
								vCLIENT.updateShops(source,"requestShop")
								return
							end
						end

						if shops[shopType]["type"] == "Cash" then
							if vRP.tryGetInventoryItem(user_id,shopItem,parseInt(shopAmount),true,slot) then
								if itemPrice > 0 then
									vRP.generateItem(user_id,"dollars",parseInt(itemPrice * shopAmount),false)
									TriggerClientEvent("sounds:source",source,"cash",0.1)
								end
							end
						elseif shops[shopType]["type"] == "Consume" then
							if vRP.tryGetInventoryItem(user_id,shopItem,parseInt(shopAmount),true,slot) then
								if itemPrice > 0 then
									vRP.generateItem(user_id,shops[shopType]["item"],parseInt(itemPrice * shopAmount),false)
									TriggerClientEvent("sounds:source",source,"cash",0.1)
								end
							end
						end
					end
				elseif shops[shopType]["mode"] == "CoinBuy" then
					if vRP.checkMaxItens(user_id,shopItem,shopAmount) then
						TriggerClientEvent("Notify",source,"amarelo","Limite atingido.",3000)
						vCLIENT.updateShops(source,"requestShop")
						return
					end

					if (vRP.inventoryWeight(user_id) + (itemWeight(shopItem) * parseInt(shopAmount))) <= vRP.getWeight(user_id) then
						if shops[shopType]["type"] == "Coins" then
							if shops[shopType]["list"][shopItem] then
								if shopType == "mechanicTools" then
									local mecAmount = vRP.getUsersByPermission("Mechanic")
									if parseInt(#mecAmount) > 0 then
										TriggerClientEvent("Notify",source,"vermelho","Existem mecanicos em serviço!",5000)
										return
									end
								end
								if pagamento(user_id,shops[shopType]["list"][shopItem] * shopAmount) then
									if shopItem == "identity" or string.sub(shopItem,1,5) == "badge" then
										vRP.generateItem(user_id,shopItem.."-"..user_id,parseInt(shopAmount),false,slot)
									elseif shopItem == "fidentity" then
										local identity = vRP.userIdentity(user_id)
										if identity then
											if identity["sex"] == "M" then
												vRP.execute("fidentity/newIdentity",{ name = nameMale[math.random(#nameMale)], name2 = userName2[math.random(#userName2)], locate = userLocate[math.random(#userLocate)], blood = math.random(4) })
											else
												vRP.execute("fidentity/newIdentity",{ name = nameFemale[math.random(#nameFemale)], name2 = userName2[math.random(#userName2)], locate = userLocate[math.random(#userLocate)], blood = math.random(4) })
											end

											local identity = vRP.userIdentity(user_id)
											local consult = vRP.query("fidentity/lastIdentity")
											if consult[1] then
												vRP.generateItem(user_id,shopItem.."-"..consult[1]["id"],parseInt(shopAmount),false,slot)
											end
										end
									else
										vRP.generateItem(user_id,shopItem,parseInt(shopAmount),false,slot)
									end

									TriggerClientEvent("sounds:source",source,"cash",0.1)
								else
									TriggerClientEvent("Notify",source,"vermelho","<b>Dólares</b> insuficientes.",5000)
								end
							end
						elseif shops[shopType]["type"] == "Consume" then
							if vRP.tryGetInventoryItem(user_id,shops[shopType]["item"],parseInt(shops[shopType]["list"][shopItem] * shopAmount)) then
								vRP.generateItem(user_id,shopItem,parseInt(shopAmount),false,slot)
								TriggerClientEvent("sounds:source",source,"cash",0.1)
							else
								TriggerClientEvent("Notify",source,"vermelho","<b>"..itemName(shops[shopType]["item"]).."</b> insuficiente.",5000)
							end
						elseif shops[shopType]["type"] == "Premium" then
							if vRP.paymentGems(user_id,shops[shopType]["list"][shopItem] * shopAmount) then
								TriggerClientEvent("sounds:source",source,"cash",0.1)
								vRP.generateItem(user_id,shopItem,parseInt(shopAmount),false,slot)
								TriggerClientEvent("Notify",source,"verde","Comprou <b>"..parseFormat(shopAmount).."x "..itemName(shopItem).."</b> por <b>"..parseFormat(shops[shopType]["list"][shopItem] * shopAmount).." Gemas</b>.",5000)
							else
								TriggerClientEvent("Notify",source,"vermelho","<b>Gemas</b> insuficientes.",5000)
							end
						end
					else
						TriggerClientEvent("Notify",source,"vermelho","Mochila cheia.",5000)
					end
				elseif shops[shopType]["mode"] == "CoinsSell" then
					local splitName = splitString(shopItem,"-")

					if shops[shopType]["list"][splitName[1]] then
						local itemPrice = shops[shopType]["list"][splitName[1]]

						if itemPrice > 0 then
							if vRP.checkBroken(shopItem) then
								TriggerClientEvent("Notify",source,"vermelho","Itens quebrados não podem ser vendidos.",5000)
								vCLIENT.updateShops(source,"requestShop")
								return
							end
						end

						if shops[shopType]["type"] == "Coins" then
							if vRP.tryGetInventoryItem(user_id,shopItem,parseInt(shopAmount),true,slot) then
								if itemPrice > 0 then
									recebimentoCoins(parseInt(itemPrice * shopAmount))
									TriggerClientEvent("sounds:source",source,"cash",0.1)
									TriggerClientEvent("Notify",source,"verde","Foi inserido "..parseInt(itemPrice * shopAmount) .." coins em seu /loja",5000)
								end
							end
						end
					end
				end
			end
		else
			print(shopType,shopItem,shopAmount,slot)
		end

		vCLIENT.updateShops(source,"requestShop")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("shops:populateSlot")
AddEventHandler("shops:populateSlot",function(nameItem,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		if vRP.tryGetInventoryItem(user_id,nameItem,amount,false,slot) then
			vRP.giveInventoryItem(user_id,nameItem,amount,false,target)
			vCLIENT.updateShops(source,"requestShop")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("shops:updateSlot")
AddEventHandler("shops:updateSlot",function(nameItem,slot,target,amount)
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

		vCLIENT.updateShops(source,"requestShop")
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:DIVINGSUIT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("shops:divingSuit")
AddEventHandler("shops:divingSuit",function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.request(source,"Comprar <b>Roupa de Mergulho</b> por <b>$2000</b>?") then
			if vRP.paymentFull(user_id,2000) then
				vRP.generateItem(user_id,"divingsuit",1,true)
			else
				TriggerClientEvent("Notify",source,"vermelho","<b>Dólares</b> insuficientes.",5000)
			end
		end
	end
end)