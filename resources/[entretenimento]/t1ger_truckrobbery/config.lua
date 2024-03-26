

Config = {} -- CONVERTIDO POR : Dogz1m#4597   CONHEÇA MEU DISCORD : discord.gg/dogz1m

Config.progressBars 	= false 					

Config.TruckRobbery = {

	cooldown = 240,						-- set cooldown time in minutes, before a player can start a job again

	police = {	                        -- police settings
		minCops = 6,					-- required police online for players to do jobs
		notify = true,					-- Notify Cops on blowing the truck
		blip = {						-- Alert Blip:
			show = true,				-- Show Blip:
			time = 30,					-- Miliseconds that blip is active on map (this value is multiplied with 4 in the script)
			radius = 50.0,				-- Radius of the alert blip
			alpha = 250,				-- Alpha of the alert blip
			color = 5					-- Blip color
		}
	},

	computer = {                                             -- job settings (where u start the job)
		pos = {1275.68, -1710.32, 54.77, 302.12},		     -- pos for computer to hack
		blip = {enable = true, sprite = 47, display = 4, scale = 0.65, color = 5, label = 'Truck Robbery Job'},
		draw = {text = Lang['job_draw_text'], dist = 3.0},   -- draw text and distance to draw 
		mHacking = {enable = true, blocks = 4, seconds = 40, duration = 3.5},	-- mhacking enable, amount of blocks, seconds to hack, and progBar wait timer
		keybind = 38,									     -- Key to interact with computer - DEFAULT [E]
		fees = {amount = 100, bankMoney = true},		     -- fees amount and use bankMoney or not?
		anim = {dict = 'mp_fbi_heist', lib = 'loop'},	     -- anim for computer interaction
		item = 'pendrive2',
		itemExplose = 'c4',
		dropitem = false 
	},

	truckBlip = {sprite = 477, color = 5, display = 2, scale = 0.60, label = 'Carro Forte'},	-- blip for the spawned truck entity

	rob = {
		detonateTimer = 20, 					-- time until bomb is detonated
		takeLootTimer = 12, 					-- time spent to loot the truck
		bag_prop = 'prop_cs_heist_bag_02',		-- prop name for bag prop.
		enableMoneyBag = true					-- Enable or disable player wearing a 'heist money bag' after the robbery:
	},

	reward = {
		money = {dirty = true, min = 300000, max = 450000}, -- dirty money or cash, min amunt and max amount of cash.
		items = {
			enable = true,			-- enable/disable item rewards
			list = {
				[1] = {item = 'goldbar', min = 50, max = 100, chance = 30},
				-- [2] = {item = 'dollars2', min = 1, max = 3, chance = 75},
				-- add more items here or change the existing ones. Make sure to add items into database!!!
			}
		}
	}

}

-- Truck Spawn Locations:
Config.TruckSpawns = {
	[1] = {
		pos = {-1327.479736328,-86.045326232910,49.31},
		inUse = false,
		security = {
			[1] = {ped = 'mp_s_m_armoured_01', seat = -1, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[2] = {ped = 's_m_m_armoured_01', seat = 0, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[3] = {ped = 's_m_m_armoured_02', seat = 3, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[4] = {ped = 'mp_s_m_armoured_01', seat = 4, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[5] = {ped = 's_m_m_armoured_01', seat = 5, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[6] = {ped = 'mp_s_m_armoured_01', seat = 6, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
		},
	},
	[2] = {
		pos = {-2075.888183593,-233.73908996580,21.10},
		inUse = false,
		security = {
			[1] = {ped = 'mp_s_m_armoured_01', seat = -1, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[2] = {ped = 's_m_m_armoured_01', seat = 0, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[3] = {ped = 's_m_m_armoured_02', seat = 3, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[4] = {ped = 'mp_s_m_armoured_01', seat = 4, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[5] = {ped = 's_m_m_armoured_01', seat = 5, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[6] = {ped = 'mp_s_m_armoured_01', seat = 6, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
		},
	},
	[3] = {
		pos = {-972.1781616210,-1530.9045410150,4.890},
		inUse = false,
		security = {
			[1] = {ped = 'mp_s_m_armoured_01', seat = -1, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[2] = {ped = 's_m_m_armoured_01', seat = 0, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[3] = {ped = 's_m_m_armoured_02', seat = 3, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[4] = {ped = 'mp_s_m_armoured_01', seat = 4, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[5] = {ped = 's_m_m_armoured_01', seat = 5, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[6] = {ped = 'mp_s_m_armoured_01', seat = 6, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
		},
	},
	[4] = {
		pos = {798.184265136720,-1799.8173828125,29.33},
		inUse = false,
		security = {
			[1] = {ped = 'mp_s_m_armoured_01', seat = -1, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[2] = {ped = 's_m_m_armoured_01', seat = 0, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[3] = {ped = 's_m_m_armoured_02', seat = 3, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[4] = {ped = 'mp_s_m_armoured_01', seat = 4, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[5] = {ped = 's_m_m_armoured_01', seat = 5, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[6] = {ped = 'mp_s_m_armoured_01', seat = 6, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
		},
	},
	[5] = {
		pos = {1247.0718994141,-344.65634155273,69.08},
		inUse = false,
		security = {
			[1] = {ped = 'mp_s_m_armoured_01', seat = -1, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[2] = {ped = 's_m_m_armoured_01', seat = 0, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[3] = {ped = 's_m_m_armoured_02', seat = 3, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[4] = {ped = 'mp_s_m_armoured_01', seat = 4, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[5] = {ped = 's_m_m_armoured_01', seat = 5, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
			[6] = {ped = 'mp_s_m_armoured_01', seat = 6, weapon = 'WEAPON_SPECIALCARBINE_MK2'},
		},
	},
}

