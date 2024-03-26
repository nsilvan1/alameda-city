-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local localPeds = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PEDLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local pedList = {
	{ -- Concessionária
		distance = 30,
		coords = { -56.76,-1098.79,26.42,17.01 },
		model = { 0x2E420A24,"csb_reporter" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Concessionária 2
		distance = 30,
		coords = { -32.99,-1100.29,26.42,65.2 },
		model = { 0xAF03DDE1,"ig_molly" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},	
	{ -- Concessionária Praia
	    distance = 30,
	    coords = { -1252.32,-349.35,36.9,124.73 },
	    model = { 0x999B00C6,"ig_paper" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Lockpick
	    distance = 30,
	    coords = { 1231.6,-214.04,75.59,5.674 },
	    model = { 0x36EA5B09,"mp_m_weapexp_01" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Obey
	    distance = 30,
	    coords = { -895.14,-233.03,39.82,153.08 },
	    model = { 0xD172497E,"a_m_m_afriamer_01" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Mechanic Recepção
	    distance = 30,
	    coords = { 875.68,-2100.1,30.48,175.75 },
	    model = { 0xA956BD9E,"s_m_m_gaffer_01" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },	
	{ -- Loja Conveniencia Praça
	    distance = 30,
	    coords = { 226.17,-910.31,30.73,328.82 },
	    model = { 0x379DDAB8,"a_f_y_vinewood_03" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Segurança Praça
	    distance = 30,
	    coords = { 219.29,-903.13,30.68,59.53 },
	    model = { 0xACCCBDB6,"u_m_m_jewelsec_01" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Segurança Concessionária2
	    distance = 30,
	    coords = { -1247.27,-363.67,36.9,28.35 },
	    model = { 0xACCCBDB6,"u_m_m_jewelsec_01" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Segurança Kart
	    distance = 30,
	    coords = { -162.46,-2148.15,16.7,116.23 },
	    model = { 0xACCCBDB6,"u_m_m_jewelsec_01" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Mineração Craft
	    distance = 30,
	    coords = { 1109.62,-2008.11,31.05,62.37 },
	    model = { 0x49EA5685,"s_m_m_gardener_01" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Cyber-Bar1
		distance = 30,
		coords = { 336.19,-907.58,29.25,0.0 },
		model = { 0xAD340F5A,"cs_orleans" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Cyber-Bar2
	    distance = 30,
	    coords = { 335.97,-915.2,29.25,192.76 },
	    model = { 0x04498DDE,"s_m_y_clown_01" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Fichas Alameda
    	distance = 30,
    	coords = { 335.85,-902.61,29.25,153.08 },
    	model = { 0x3C438CD2,"u_m_y_rsranger_01" },
    	anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Vendedor Itens
	    distance = 30,
	    coords = { 83.87,-1551.67,29.59,51.03 },
	    model = { 0x2DADF4AA,"a_m_y_downtown_01" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	-- { -- Cassino Compra 
	-- distance = 30,
	-- coords = { 1116.47,221.95,-49.44,119.06 },
	-- model = { 0x2E420A24,"csb_reporter" },
	-- anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    -- },
	-- { -- Cassino Venda
	-- 	distance = 30,
	-- 	coords = { 1116.1,218.1,-49.44,119.06 },
	-- 	model = { 0x2E420A24,"csb_reporter" },
	-- 	anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	-- },
	{ -- Contrabando Trabalho
		distance = 30,
		coords = { 	2122.63,4784.79,40.96,297.64 },
		model = {  0x570462B9,"ig_jimmydisanto" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Contrabandista 1
    	distance = 30,
    	coords = { 	-1686.47,-3149.36,13.99,252.29 },
    	model = {  0x6BD9B68C,"a_m_m_hasjew_01" },
    	anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Contrabandista 2
    	distance = 30,
    	coords = { 	-1832.12,3020.29,32.81,147.41 },
    	model = {  0x613E709B,"mp_m_forgery_01" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Contrabandista 3
    	distance = 30,
     	coords = { 	1716.37,3294.99,41.3,195.6 },
    	model = {  0x0DA1EAC6,"g_m_y_strpunk_02" },
	    antim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Jardineiro
		distance = 30,
		coords = { 	-1348.39,142.51,56.43,130.4 },
		model = { 0x5719786D,"ig_trafficwarden" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Mercado Ilegal 2
		distance = 30,
		coords = { 1391.91,-202.61,157.01,314.65 }, 
		model = { 0xD172497E,"a_m_m_afriamer_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Passaporte Falso
	    distance = 30,
	    coords = { 1351.6,-223.16,136.6,119.06 },
	    model = { 0x43595670,"cs_martinmadrazo" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Caçador
		distance = 30,
		coords = { -675.33,5829.79,17.32,136.07 },
		model = { 0x2D5DB362,"ig_mjo" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},	
	{ -- Paintball
		distance = 50,
		coords = { 211.52,-945.37,30.68,59.53 },
		model = { 0x90EF5134,"u_m_y_juggernaut_01" },
		anim = { "amb@code_human_in_car_mp_actions@gang_sign_a@bodhi@rds@base","idle_a" }
	},
	{ -- DeeJay CyberBar
		distance = 50,
		coords = { 372.74,-934.72,25.33,0.0 },
		model = { 0x806E6A1C,"ig_isldj_04" },
		anim = { "mini@strip_club@idles@dj@idle_04","idle_04" }
	},
	{ -- Segurança1	 CyberBar
		distance = 50,
		coords = { 366.74,-904.65,24.63,189.93 },
		model = { 0x55FE9B46,"s_m_m_highsec_04" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Segurança2	 CyberBar
		distance = 50,
		coords = { 380.15,-933.48,24.63,62.37 },
		model = { 0x30DB9D7B,"cs_chengsr" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Streeper1
		distance = 50,
		coords = { 366.72,-925.46,25.58,274.97 },
		model = {  0x81441B71,"csb_stripper_02" },
		anim = { "mini@strip_club@private_dance@part2","priv_dance_p2" }
	},
	{ -- Streeper2
		distance = 50,
		coords = { 382.05,-925.38,25.58,87.88 },
		model = { 0x52580019,"s_f_y_stripper_01" },
		anim = { "mini@strip_club@private_dance@part3","priv_dance_p3" }
	},
	{ -- Streeper3
		distance = 50,
		coords = { 382.15,-916.12,25.58,87.88 },
		model = {  0xAEEA76B5,"csb_stripper_01" },
		anim = { "mini@strip_club@private_dance@part1","priv_dance_p1" }
	},
	{ -- Streeper4
		distance = 50,
		coords = { 366.77,-916.12,25.58,272.13 },
		model = {  0x6E0FB794,"s_f_y_stripper_02" },
		anim = { "mini@strip_club@private_dance@part1","priv_dance_p1" }
	},
	{ -- Streeper5
		distance = 50,
		coords = { 370.88,-935.32,25.58,2.84 },
		model = {  0x81441B71,"csb_stripper_02" },
		anim = { "mini@strip_club@private_dance@part2","priv_dance_p2" }
	},
	{ -- Streeper6
		distance = 50,
		coords = { 377.16,-935.43,25.58,354.34 },
		model = { 0x52580019,"s_f_y_stripper_01" },
		anim = { "mini@strip_club@private_dance@part1","priv_dance_p1" }
	},
	{ -- Transporte de Presideário
		distance = 30,
		coords = { 1852.0,2582.25,45.66,274.97},
		model = { 0x5E3DA4A4,"s_m_y_cop_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Venda de Pneu
		distance = 30,
		coords = { 696.77,-1011.05,22.8,93.55 },
		model = { 0x62CC28E2,"s_m_y_armymech_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},		
	{ -- Loja Mecânico
		distance = 30,
		coords = { 871.19,-2116.12,30.46,272.13 },
		model = { 0x9E80D2CE,"s_m_m_lathandy_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja Mecânico2
		distance = 30,
		coords = { 819.1,-988.03,26.64,357.17 },
		model = { 0x9E80D2CE,"s_m_m_lathandy_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja Mecânico3
		distance = 100,
		coords = { -349.67,-148.78,39.01,308.98 },
		model = { 0x9E80D2CE,"s_m_m_lathandy_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja Mecânico4
		distance = 100,
		coords = { -346.66,-113.6,39.01,76.54 },
		model = { 0x9E80D2CE,"s_m_m_lathandy_01" },
		anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }
	},
	{ -- Loja Pier
		distance = 30,
		coords = { -1836.4,-1186.65,14.31,243.78 },
		model = { 0x0703F106,"csb_anita" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }		
	},
	{ -- Loja chicken
		distance = 30,
		coords = { -143.9,-258.73,43.64,252.29 },
		model = { 0x0703F106,"csb_anita" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }		
	},
	{ -- TowDriver Norte
		distance = 100,
		coords = { -273.96,6121.63,31.41,130.4 },
		model = { 0xF1E823A2,"g_m_m_armboss_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- TowDriver Meio
		distance = 100,
		coords = { 1737.95,3709.1,34.14,19.85 },
		model = { 0xF1E823A2,"g_m_m_armboss_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- TowDriver CitySul
		distance = 30,
		coords = { 409.34,-1623.21,29.28,232.45 },
		model = { 0xF1E823A2,"g_m_m_armboss_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},	
	{ -- CogumeloShop
		distance = 30,
		coords = { -1171.09,-1570.93,4.67,119.06 },
		model = { 0xE83B93B7,"g_m_y_famca_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Sniper Buy
		distance = 100,
		coords = { -277.22,2208.63,129.76,68.04 },
		model = { 0xB3F3EE34,"s_m_y_blackops_01" },
		anim = { "timetable@trevor@smoking_meth@base","base" }
    },
	{ -- Coveiro
		distance = 100,
		coords = { -1745.92,-204.83,57.39,320.32 },
		model = { 0xF1E823A2,"g_m_m_armboss_01" },
		anim = { "timetable@trevor@smoking_meth@base","base" }
	},
	{ -- Leiteiro
		distance = 100,
		coords = { 2440.58,4736.35,34.29,317.50 },
		model = { 0xFCFA9E1E,"a_c_cow" }
	},
	{ -- Leiteiro
		distance = 100,
		coords = { 2432.5,4744.58,34.31,317.50 },
		model = { 0xFCFA9E1E,"a_c_cow" }
	},
	{ -- Leiteiro
		distance = 100,
		coords = { 2424.47,4752.37,34.31,317.50 },
		model = { 0xFCFA9E1E,"a_c_cow" }
	},
	{ -- Leiteiro
		distance = 100,
		coords = { 2416.28,4760.8,34.31,317.50 },
		model = { 0xFCFA9E1E,"a_c_cow" }
	},
	{ -- Leiteiro
		distance = 100,
		coords = { 2408.6,4768.88,34.31,317.50 },
		model = { 0xFCFA9E1E,"a_c_cow" }
	},
	{ -- Leiteiro
		distance = 100,
		coords = { 2400.32,4777.48,34.53,317.50 },
		model = { 0xFCFA9E1E,"a_c_cow" }
	},
	{ -- Leiteiro
		distance = 100,
		coords = { 2432.46,4802.66,34.83,137.50 },
		model = { 0xFCFA9E1E,"a_c_cow" }
	},
	{ -- Leiteiro
		distance = 100,
		coords = { 2440.62,4794.22,34.66,137.50 },
		model = { 0xFCFA9E1E,"a_c_cow" }
	},
	{ -- Leiteiro
		distance = 100,
		coords = { 2448.65,4786.57,34.64,137.50 },
		model = { 0xFCFA9E1E,"a_c_cow" }
	},
	{ -- Leiteiro
		distance = 100,
		coords = { 2456.88,4778.08,34.49,137.50 },
		model = { 0xFCFA9E1E,"a_c_cow" }
	},
	{ -- Leiteiro
		distance = 100,
		coords = { 2464.53,4770.04,34.37,137.50 },
		model = { 0xFCFA9E1E,"a_c_cow" }
	},
	{ -- Leiteiro
		distance = 100,
		coords = { 2473.38,4760.98,34.31,137.50 },
		model = { 0xFCFA9E1E,"a_c_cow" }
	},
	{ -- Leiteiro
		distance = 100,
		coords = { 2495.03,4762.77,34.37,137.50 },
		model = { 0xFCFA9E1E,"a_c_cow" }
	},
	{ -- Leiteiro
		distance = 100,
		coords = { 2503.13,4754.08,34.31,137.50 },
		model = { 0xFCFA9E1E,"a_c_cow" }
	},
	{ -- Leiteiro
		distance = 100,
		coords = { 2511.34,4746.04,34.31,137.50 },
		model = { 0xFCFA9E1E,"a_c_cow" }
	},
	{ -- Leiteiro
		distance = 100,
		coords = { 2519.56,4737.35,34.29,137.50 },
		model = { 0xFCFA9E1E,"a_c_cow" }
	},
	{ -- Agricultor
		distance = 100,
		coords = { 2301.09,5064.78,45.81,170.08 },
		model = { 0x1536D95A,"a_m_o_ktown_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Salary
		distance = 30,
		coords = { -110.16,6468.93,31.63,133.23 },
		model = { 0x5D71A46F,"s_f_y_airhostess_01" }
	},
	{ -- Salary
		distance = 30,
		coords = { -111.21,6469.98,31.63,133.23 },
		model = { 0x5D71A46F,"s_f_y_airhostess_01" }
	},
	{ -- Salary
		distance = 30,
		coords = { -112.25,6471.08,31.63,133.23 },
		model = { 0x5D71A46F,"s_f_y_airhostess_01" }
	},
	{ -- Salary
		distance = 30,
		coords = { 254.05,222.73,106.30,158.75 },
		model = { 0x5D71A46F,"s_f_y_airhostess_01" }
	},
	{ -- Salary
		distance = 30,
		coords = { 252.26,223.39,106.30,158.75 },
		model = { 0x5D71A46F,"s_f_y_airhostess_01" }
	},
	{ -- Salary
		distance = 30,
		coords = { 248.95,224.59,106.30,158.75 },
		model = { 0x5D71A46F,"s_f_y_airhostess_01" }
	},
	{ -- Salary
		distance = 30,
		coords = { 247.15,225.25,106.30,158.75 },
		model = { 0x5D71A46F,"s_f_y_airhostess_01" }
	},
	{ -- Salary
		distance = 30,
		coords = { 243.82,226.46,106.30,158.75 },
		model = { 0x5D71A46F,"s_f_y_airhostess_01" }
	},
	{ -- Salary
		distance = 30,
		coords = { 242.02,227.11,106.30,158.75 },
		model = { 0x5D71A46F,"s_f_y_airhostess_01" }
	},
	{ -- Prefeitura
		distance = 30,
		coords = { -551.1,-191.07,38.22,221.11 },
		model = { 0x2F8845A3,"ig_barry" },
		anim = { "anim@heists@prison_heistig1_p1_guard_checks_bus","loop" }
	},
	{ -- Prefeitura
		distance = 30,
		coords = { -553.3,-192.34,38.22,206.93 },
		model = { 0x2F8845A3,"ig_barry" },
		anim = { "anim@heists@prison_heistig1_p1_guard_checks_bus","loop" }
	},
	-- { -- Loja Burgershot
	-- 	distance = 20,
	-- 	coords = { -1196.18,-892.73,13.99,308.98 },
	-- 	model = { 0x8B7D3766,"u_m_y_burgerdrug_01" },
	-- 	anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }		
	-- },
	{ -- Troféu de Vencedor
		distance = 40,
		coords = { 3829.2,4441.03,2.8,189.93 },
		model = { 0xF63DE8E1,"s_m_m_pilot_02" },
		anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }
	},
	{ -- Lavagem Dinheiro
		distance = 40,
		coords = { 1196.21,-147.57,61.38,297.64 },
		model = { 0x5F2113A1,"s_m_y_prismuscl_01" },
		anim = { "timetable@ron@ig_3_couch","base" }
    },
	{ -- Armas e Minição
		distance = 20,
		coords = { 1234.01,-236.1,77.85,189.93 },
		model = { 0x13AEF042,"a_m_m_genfat_02" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }	
	},
	{ -- Colete e Algemas
		distance = 20,
		coords = { 1232.66,-236.29,77.85,187.09 },
		model = { 0x13AEF042,"a_m_m_genfat_02" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }	
	},
	{ -- Drogas
		distance = 20,
		coords = { 	1231.34,-199.83,75.57,90.71 },
		model = { 0x23B88069,"g_m_y_ballasout_01" },
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }	
	},
	{ -- Mesa de Drogas
		distance = 20,
		coords = { 	1225.32,-199.35,75.6,277.8 },
		model = { 0x231AF63F,"g_m_y_ballaorig_01" },
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }	
	},
	{ -- Black Market
		distance = 20,
		coords = { 2431.09,4970.72,42.34,42.52 },
		model = { 0x158C439C,"g_f_y_ballas_01" },
		anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }
	},
	{ -- Black Market
		distance = 20,
		coords = { 2436.08,4965.39,42.34,226.78 },
		model = { 0x158C439C,"g_f_y_ballas_01" },
		anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }
	},
	{ -- Black Market
		distance = 20,
		coords = { 2434.4,4963.8,42.34,229.61 },
		model = { 0x158C439C,"g_f_y_ballas_01" },
		anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }
	},
	{ -- Black Market
		distance = 20,
		coords = { 2432.44,4964.06,42.34,178.59 },
		model = { 0x158C439C,"g_f_y_ballas_01" },
		anim = { "amb@world_human_bum_wash@male@high@base","base" }
	},
	{ -- Black Market
		distance = 20,
		coords = { 2431.57,4965.22,42.34,124.73 },
		model = { 0x158C439C,"g_f_y_ballas_01" },
		anim = { "amb@world_human_bum_wash@male@high@base","base" }
	},
	{ -- Black Market
		distance = 20,
		coords = { 2428.67,4969.51,42.34,133.23 },
		model = { 0x158C439C,"g_f_y_ballas_01" },
		anim = { "anim@amb@business@coc@coc_packing_hi@","full_cycle_v1_pressoperator" }
	},
	{ -- Black Market
		distance = 20,
		coords = { 2437.05,4967.61,42.34,317.49 },
		model = { 0x158C439C,"g_f_y_ballas_01" },
		anim = { "anim@amb@business@coc@coc_packing_hi@","full_cycle_v1_pressoperator" }
	},
	{ -- Black Market
		distance = 20,
		coords = { 2433.09,4971.51,42.34,320.32 },
		model = { 0x158C439C,"g_f_y_ballas_01" },
		anim = { "anim@amb@business@coc@coc_packing_hi@","full_cycle_v1_pressoperator" }
	},
	{ -- Black Market
		distance = 20,
		coords = { 2432.67,4970.29,42.34,226.78 },
		model = { 0x158C439C,"g_f_y_ballas_01" },
		anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }
	},
	{ -- Black Market
		distance = 20,
		coords = { 2435.28,4969.27,42.34,317.49 },
		model = { 0x158C439C,"g_f_y_ballas_01" },
		anim = { "amb@prop_human_parking_meter@female@idle_a","idle_a_female" }
	},
	{ -- Taxi
		distance = 50,
		coords = { -1039.34,-2730.8,20.2,235.28 },
		model = { 0x8674D5FC,"a_m_y_stlat_01" },
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Ilegal
		distance = 100,
		coords = { 1433.97,-285.86,177.46,331.66 },
		model = { 0xE83B93B7,"g_m_y_famca_01" },
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Ilegal Favela 1
		distance = 100,
		coords = { 1295.35,-256.7,96.26,42.52 },
		model = { 0xDB729238,"g_m_y_famdnf_01" },
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},
	{ -- Ilegal Favela 2
		distance = 100,
		coords = { 1216.29,-106.04,59.99,113.39 },
		model = { 0xCDE955D2,"a_f_m_soucentmc_01" },
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},	
	{ -- Ilegal Favela 3
		distance = 100,
		coords = { 1424.92,-215.85,172.86,36.86 },
		model = { 0xCDE955D2,"a_f_m_soucentmc_01" },
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
    },	
	{ -- Ilegal Favela 4
		distance = 100,
		coords = { 1203.06,-177.0,64.25,11.34 },
		model = { 0x35FFA54A,"ig_englishdave_02" },
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
    },	
	{ -- Ilegal Favela 5
		distance = 100,
		coords = { 1228.9,-74.13,61.08,291.97 },
		model = { 0xDC59940D,"u_m_y_pogo_01" },
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
    },	
	{ -- Ilegal Favela 6
		distance = 100,
		coords = { -2165.81,5197.6,16.88,93.55 },
		model = { 0x5442C66B,"a_m_m_acult_01" },
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
    },	
	{ -- Paramedictratamento_CUF
		distance = 100,
		coords = { -812.63,-1237.55,7.33,320.32 },
		model = { 0x4117D39B,"s_m_m_scientist_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Paramedictratamento_CUF
	    distance = 100,
	    coords = { -816.46,-1237.7,7.33,51.03 },
	    model = { 0x4117D39B,"s_m_m_scientist_01" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Paramedictratamento
	    distance = 100,
	    coords = { -255.48,6330.28,32.42,274.97 },
	    model = { 0x4117D39B,"s_m_m_scientist_01" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Paramedictratamento_NORTE
	    distance = 100,
	    coords = { 1832.76,3676.4,34.27,249.45 },
	    model = { 0x4117D39B,"s_m_m_scientist_01" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Departament Store 1
		distance = 10,
		coords = { 24.1,-1345.92,29.49,272.13 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 2
		distance = 10,
		coords = { 2555.99,380.91,108.61,5.67 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 3
		distance = 10,
		coords = { 1164.82,-323.65,69.2,96.38 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 4
		distance = 10,
		coords = { -706.15,-914.53,19.21,85.04 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 5
		distance = 10,
		coords = { -47.38,-1758.68,29.42,42.52 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 6
		distance = 10,
		coords = { 372.78,327.24,103.56,255.12 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 7
		distance = 6,
		coords = { -3242.7,999.93,12.82,0.0 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 8
		distance = 6,
		coords = { 1728.27,6416.01,35.03,240.95 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 9
		distance = 10,
		coords = { 549.2,2670.59,42.16,93.55 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 10
		distance = 6,
		coords = { 1959.7,3740.75,32.33,294.81 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 11
		distance = 6,
		coords = { 2676.99,3280.0,55.23,320.32 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 12
		distance = 6,
		coords = { 1697.31,4923.49,42.06,325.99 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 13
		distance = 6,
		coords = { -1819.52,793.48,138.08,127.56 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 14
		distance = 6,
		coords = { 1391.69,3605.97,34.98,198.43 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 15
		distance = 10,
		coords = { -2966.41,391.55,15.05,85.04 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 16
		distance = 10,
		coords = { -3039.49,584.27,7.9,14.18},
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 17
		distance = 10,
		coords = { 1134.33,-983.11,46.4,274.97 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 18
		distance = 10,
		coords = { 1165.28,2710.77,38.15,175.75 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 19
		distance = 10,
		coords = { -1486.72,-377.55,40.15,130.4 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 20
		distance = 10,
		coords = { -1220.95,-907.59,12.32,28.35 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 21
		distance = 10,
		coords = { 161.19,6642.24,31.69,221.11},
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Store 22
		distance = 10,
		coords = { 291.99,-1272.61,29.52,354.34 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Departament Vagos
		distance = 10,
		coords = { 	1335.28,-1651.5,52.25,31.19 },
		model = { 0x18CE57D0,"mp_m_shopkeep_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},	

	{ -- Ammu-Nation Store 1
		distance = 12,
		coords = { 1695.26,3760.94,34.69,130.4},
		model = { 0x441405EC,"s_m_y_xmech_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store 2
		distance = 12,
		coords = { 250.12,-51.56,69.94,28.35 },
		model = { 0x441405EC,"s_m_y_xmech_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store 3
		distance = 12,
		coords = { 840.19,-1032.14,28.19,317.49 },
		model = { 0x441405EC,"s_m_y_xmech_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store 4
		distance = 12,
		coords = { -327.81,6084.3,31.46,175.75 },
		model = { 0x441405EC,"s_m_y_xmech_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store 5
		distance = 12,
		coords = { -660.05,-936.71,21.82,138.9 },
		model = { 0x441405EC,"s_m_y_xmech_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store 6
		distance = 12,
		coords = { -1307.72,-396.02,36.7,34.02},
		model = { 0x441405EC,"s_m_y_xmech_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store 7
		distance = 12,
		coords = { -1115.16,2698.94,18.55,175.75},
		model = { 0x441405EC,"s_m_y_xmech_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store 8
		distance = 12,
		coords = { 2565.72,295.73,108.73,317.49 },
		model = { 0x441405EC,"s_m_y_xmech_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store 9
		distance = 12,
		coords = { -3169.76,1089.16,20.84,204.1 },
		model = { 0x441405EC,"s_m_y_xmech_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store 10
		distance = 12,
		coords = { 22.54,-1105.54,29.79,155.91},
		model = { 0x441405EC,"s_m_y_xmech_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Ammu-Nation Store 11
		distance = 12,
		coords = { 810.26,-2159.02,29.62,354.34 },
		model = { 0x441405EC,"s_m_y_xmech_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Barberia 01
		distance = 12,
		coords = { -815.61,-182.07,37.56,209.77 },
		model = { 0x0DE9A30A,"s_m_m_ammucountry" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Barberia 02
		distance = 12,
		coords = { 139.24,-1709.16,29.3,42.52 },
		model = { 0x0DE9A30A,"s_m_m_ammucountry" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Barberia 03
		distance = 12,
		coords = { -1281.99,-1119.81,6.99,348.67 },
		model = { 0x0DE9A30A,"s_m_m_ammucountry" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Barberia 04
		distance = 12,
		coords = { 1933.53,3732.15,32.86,113.39 },
		model = { 0x0DE9A30A,"s_m_m_ammucountry" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Barberia 05
		distance = 12,
		coords = { 1212.48,-475.47,66.22,345.83  },
		model = { 0x0DE9A30A,"s_m_m_ammucountry" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Barberia 06
		distance = 12,
		coords = { -35.47,-152.38,57.09,249.45  },
		model = { 0x0DE9A30A,"s_m_m_ammucountry" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Barberia 07
		distance = 12,
		coords = { -279.33,6225.82,31.69,317.49  },
		model = { 0x0DE9A30A,"s_m_m_ammucountry" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Life Invader
		distance = 20,
		coords = { -1083.15,-245.88,37.76,209.77 },
		model = { 0x2F8845A3,"ig_barry" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pharmacy Store
	    distance = 30,
	    coords = { 91.88,-230.91,54.66,337.33 },
	    model = { 0x5244247D,"u_m_y_baygor" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Pharmacy Store
		distance = 30,
		coords = { -177.65,6384.43,31.49,226.78 },
		model = { 0x5244247D,"u_m_y_baygor" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pharmacy Store
		distance = 30,
		coords = { 1690.07,3581.68,35.62,212.6 },
		model = { 0x5244247D,"u_m_y_baygor" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pharmacy Store
		distance = 15,
		coords = { 326.5,-1074.43,29.47,0.0 },
		model = { 0x5244247D,"u_m_y_baygor" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Mercado Central Deserto
		distance = 50,
		coords = { 2749.06,3482.96,55.67,59.53 },
		model = { 0xE6631195,"ig_cletus" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Mercado Central Centro
		distance = 50,
		coords = { 46.15,-1749.28,29.64,51.03 },
		model = { 0xCD777AAA,"ig_tomepsilon" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Mercado Crafting Deserto
		distance = 50,
		coords = { 2727.54,3488.62,55.67,252.29 },
		model = { 0x3521A8D2,"a_m_y_genstreet_02" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Obey Imobiliária
		distance = 50,
		coords = { -908.83,-222.34,40.02,150.24 },
		model = { 0x7CCBE17A,"g_m_y_korlieut_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Recycling Sell
		distance = 50,
		coords = { -428.54,-1728.29,19.78,70.87 },
		model = { 0xEE75A00F,"s_m_y_garbage" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Bar
		distance = 15,
		coords = { 129.71,-1284.65,29.27,119.06 },
		model = { 0x780C01BD,"s_f_y_bartender_01" },
		anim = { "amb@prop_human_bum_shopping_cart@male@base","base" }
	},
	{ -- Arcade
		distance = 25,
		coords = { -1653.78,-1062.18,12.15,138.9 },
		model = { 0,"s" },
		anim = { "amb@prop_human_bum_shopping_cart@male@base","base" }
	},
	{ -- Bar
		distance = 15,
		coords = { -561.75,286.7,82.18,266.46 },
		model = { 0xE11A9FB4,"ig_josef" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Bar do Pier
		distance = 15,
		coords = { -1586.05,-994.06,13.08,51.03 },
		model = { 0xE11A9FB4,"ig_josef" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},	
	{ -- Jewelry
		distance = 15,
		coords = { -628.79,-238.7,38.05,311.82 },
		model = { 0xC314F727,"cs_gurk" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Oxy Store
		distance = 30,
		coords = { -1636.74,-1092.17,13.08,320.32 },
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Moto Club
		distance = 12,
		coords = { 987.46,-95.61,74.85,226.78 },
		model = { 0x6CCFE08A,"ig_clay" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Moto Club
		distance = 30,
		coords = { 2512.3,4098.11,38.59,243.78 },
		model = { 0x6CCFE08A,"ig_clay" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Transportador
		distance = 30,
		coords = { 354.14,270.56,103.02,345.83 },
		model = { 0xE0FA2554,"ig_casey" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Lenhador
		distance = 30,
		coords = { -840.64,5398.94,34.61,303.31 },
		model = { 0x1536D95A,"a_m_o_ktown_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Minerador
		distance = 30,
		coords = { 1050.77,-1958.17,31.04,184.26 },
		model = { 0xD7DA9E99,"s_m_y_construct_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Mergulhador
		distance = 20,
		coords = { 1520.67,3780.06,34.46,280.63 },
		model = { 0xC79F6928,"a_f_y_beach_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Colheita
		distance = 30,
		coords = { 406.08,6526.17,27.75,87.88 },
		model = { 0x94562DD7,"a_m_m_farmer_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Motorista
		distance = 30,
		coords = { 452.97,-607.75,28.59,266.46 },
		model = { 0x2A797197,"u_m_m_edtoh" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Lixeiro
		distance = 50,
		coords = { -347.09,-1576.81,25.22,328.82 },
		model = { 0xEE75A00F,"s_m_y_garbage" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas 1
		distance = 20,
		coords = { 80.43,-1387.68,29.37,172.92 },
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas 2
		distance = 20,
		coords = { -708.92,-151.85,37.41,116.23 },
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas 3
		distance = 20,
		coords = { -164.96,-303.08,39.73,246.62 },
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas 4
		distance = 20,
		coords = { -815.47,-1075.25,11.32,107.72 },
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas 5
		distance = 20,
		coords = { -1193.16,-766.48,17.3,218.27 },
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas 6
		distance = 20,
		coords = { -1448.83,-237.87,49.81,51.03 },
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas 7
		distance = 20,
		coords = { -2.33,6512.48,31.88,306.15 },
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas 8
		distance = 20,
		coords = { 1689.59,4817.02,42.06},
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas 9
		distance = 20,
		coords = { 126.61,-225.19,54.56,70.87 },
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas 10
		distance = 20,
		coords = { 612.89,2763.71,42.09,272.13},
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas 11
		distance = 20,
		coords = { 1201.9,2705.06,38.22,87.88 },
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas 12
		distance = 20,
		coords = { -3169.85,1042.26,20.86,62.37 },
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas 13
		distance = 20,
		coords = { -1094.34,2710.46,19.11,121.89 },
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas 14
		distance = 20,
		coords = { 420.74,-811.47,29.49,354.34 },
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas 15
		distance = 20,
		coords = { 1944.74,3767.12,32.59,294.81},
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Roupas 17
		distance = 20,
		coords = { -804.76,-593.73,30.28,235.28},
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Tatuagem
		distance = 6,
		coords = { 1324.38,-1650.09,52.27,127.56 },
		model = { 0x1475B827,"a_f_y_hippie_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Tatuagem
		distance = 6,
		coords = { -1152.27,-1423.81,4.95,124.73 },
		model = { 0x1475B827,"a_f_y_hippie_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Tatuagem
		distance = 6,
		coords = { 319.84,180.89,103.58,246.62 },
		model = { 0x1475B827,"a_f_y_hippie_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Tatuagem
		distance = 6,
		coords = { -3170.41,1073.06,20.83,334.49 },
		model = { 0x1475B827,"a_f_y_hippie_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Tatuagem
		distance = 6,
		coords = { 1862.58,3748.52,33.03,28.35 },
		model = { 0x1475B827,"a_f_y_hippie_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Loja de Tatuagem
		distance = 6,
		coords = { -292.02,6199.72,31.49,223.94 },
		model = { 0x1475B827,"a_f_y_hippie_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Taxista
		distance = 50,
		coords = { 894.9,-179.15,74.7,240.95 },
		model = { 0x8674D5FC,"a_m_y_stlat_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Taxista
		distance = 50,
		coords = { 1696.19,4785.25,42.02,93.55 },
		model = { 0x8674D5FC,"a_m_y_stlat_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Caçador
		distance = 10,
		coords = { -679.13,5839.52,17.32,226.78 },
		model = { 0xCE1324DE,"ig_hunter" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Caçador
		distance = 50,
		coords = { -695.56,5802.12,17.32,65.2 },
		model = { 0x1536D95A,"a_m_o_ktown_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Animal Park
		distance = 15,
		coords = { 563.19,2752.92,42.87,187.09 },
		model = { 0x51C03FA4,"a_f_y_eastsa_03" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Pescador
		distance = 30,
		coords = { 1524.77,3783.84,34.49,187.09 },
		model = { 0x51C03FA4,"a_f_y_eastsa_03" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Taxi Aério
        distance = 50,
        coords = { -1120.41,-2841.3,13.93,147.41 },
        model = { 0x3AE4A33B,"ig_fbisuit_01" },
        anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Trucker
        distance = 50,
        coords = { 1239.96,-3257.19,7.09,269.3 },
        model = { 0x1475B827,"a_f_y_hippie_01" },
        anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Açougue
        distance = 50,
        coords = { 967.26,-2187.63,30.04,0.0 },
        model = { 0x4163A158,"s_m_y_factory_01" },
        anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Combo Burgershot
	    distance = 50,
   	    coords = { -1177.01,-904.31,13.6,36.86 },
	    model = { 0xAD4C724C,"s_m_y_waiter_01" },
	    anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Corda
        distance = 50,
        coords = { 244.49,374.31,105.73,164.41 },
        model = { 0x61D201B3,"a_m_m_fatlatin_01" },
        anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },	
	{ -- Corda 2
		distance = 100,
		coords = { 1400.56,-162.11,162.87,124.73 },
		model = { 0xFD1C49BB,"g_m_y_strpunk_01" },
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
	},	
	{ -- Attach
	    distance = 100,
	    coords = { 1421.97,-258.69,177.46,73.71 },
	    model = { 0x278C8CB7,"g_m_y_salvagoon_01" },
	    anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }
    },	
	{ -- Cogumelo
		distance = 100,
		coords = { 2487.34,3760.36,42.24,53.86 },
		model = { 0x4705974A,"u_m_y_militarybum" },
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }	
	},	
	{ -- Minerio Refinado
		distance = 100,
		coords = { 	-652.93,-266.84,35.99,116.23  },
		model = { 0x799E61F6,"ig_jackie" },
		anim = { "amb@lo_res_idles@","world_human_lean_male_foot_up_lo_res_base" }	
    },	
	{ -- Leiteiro Venda
		distance = 100,
		coords = { 	2461.71,4744.49,34.31,42.52  },
		model = { 0x94562DD7,"a_m_m_farmer_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },	
	{ -- Emprego de Coletor de Esterco
		distance = 100,
		coords = { 	2407.73,4796.0,35.23,226.78  },
		model = { 0x94562DD7,"a_m_m_farmer_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },	
	{ -- Pão Craftar
		distance = 100,
		coords = { 	2450.64,4764.27,34.31,223.94  },
		model = { 0x94562DD7,"a_m_m_farmer_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },	
	{ -- Cassino Roleta
		distance = 100,
		coords = { 	1109.49,229.47,-49.58,189.93  },
		model = { 0x4BBA84D9,"cs_movpremf_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },	
	{ -- Cassino Bar
		distance = 100,
		coords = { 	1112.26,209.98,-49.44,0.0  },
		model = { 0xD85E6D28,"s_m_m_movprem_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Cassino Loja de Roupa
		distance = 100,
		coords = { 	1100.66,195.61,-49.44,311.82  },
		model = { 0xDB5EC400,"a_f_y_scdressy_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },
	{ -- Cassino Buy Fichas
		distance = 100,
		coords = { 	1118.13,221.16,-49.44,65.2  },
		model = { 0x5B81D86C,"u_f_y_spyactress" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Cassino Sell Fichas
		distance = 100,
		coords = { 	1118.01,219.02,-49.44,110.56  },
		model = { 0xC314F727,"cs_gurk" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Cassino Recepção 1
		distance = 100,
		coords = { 	930.28,35.94,81.1,0.0  },
		model = { 0x36DF2D5D,"a_f_y_bevhills_04" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },	
	{ -- Cassino Recepção 2
		distance = 100,
		coords = { 	1087.64,221.15,-49.2,189.93  },
		model = { 0x36DF2D5D,"a_f_y_bevhills_04" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },	
	{ -- Cassino Segurança 1
		distance = 100,
		coords = { 	922.25,42.62,81.1,53.86  },
		model = { 0x3AE4A33B,"ig_fbisuit_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
    },	
	{ -- Cassino Segurança 2
		distance = 100,
		coords = { 	927.34,50.47,81.1,53.86  },
		model = { 0x585C0B52,"cs_fbisuit_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Cassino Segurança 3
		distance = 100,
		coords = { 	1087.6,206.11,-49.0,357.17  },
		model = { 0x585C0B52,"cs_fbisuit_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Cassino Segurança 4
		distance = 100,
		coords = { 	1094.22,223.09,-49.0,246.62  },
		model = { 0x585C0B52,"cs_fbisuit_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	},
	{ -- Entregador
		distance = 50,
		coords = { 158.93,-2946.4,7.23,277.8 },
		model = { 0x689C2A80,"a_f_y_epsilon_01" },
		anim = { "anim@heists@heist_corona@single_team","single_team_loop_boss" }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADPEDLIST
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)

		for k,v in pairs(pedList) do
			local distance = #(coords - vector3(v["coords"][1],v["coords"][2],v["coords"][3]))
			if distance <= v["distance"] then
				if localPeds[k] == nil then
					local mHash = GetHashKey(v["model"][2])

					RequestModel(mHash)
					while not HasModelLoaded(mHash) do
						Citizen.Wait(1)
					end

					if HasModelLoaded(mHash) then
						localPeds[k] = CreatePed(4,v["model"][1],v["coords"][1],v["coords"][2],v["coords"][3] - 1,v["coords"][4],false,false)
						SetPedArmour(localPeds[k],100)
						SetEntityInvincible(localPeds[k],true)
						FreezeEntityPosition(localPeds[k],true)
						SetBlockingOfNonTemporaryEvents(localPeds[k],true)

						SetModelAsNoLongerNeeded(mHash)

						if v["anim"] ~= nil then
							RequestAnimDict(v["anim"][1])
							while not HasAnimDictLoaded(v["anim"][1]) do
								Citizen.Wait(1)
							end

							TaskPlayAnim(localPeds[k],v["anim"][1],v["anim"][2],8.0,0.0,-1,1,0,0,0,0)
						end
					end
				end
			else
				if localPeds[k] then
					DeleteEntity(localPeds[k])
					localPeds[k] = nil
				end
			end
		end

		Citizen.Wait(1000)
	end
end)