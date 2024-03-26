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
Tunnel.bindInterface("doors",cRP)
vTASKBAR = Tunnel.getInterface("taskbar")
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORS
-----------------------------------------------------------------------------------------------------------------------------------------
GlobalState["Doors"] = {

	--=== LSPD

	[1] = { x = 431.38, y = -1000.68, z = 25.55, hash = 2130672747, lock = true, text = true, distance = 20, press = 5, perm = "Police" },
	[2] = { x = 452.25, y = -1000.73, z = 25.55, hash = 2130672747, lock = true, text = true, distance = 20, press = 5, perm = "Police" },
	[3] = { x = 488.90, y = -1017.19, z = 28.50, hash = -1603817716, lock = true, text = true, distance = 20, press = 5, perm = "Police" },
	[4] = { x = 476.59, y = -1007.79, z = 26.54, hash = -53345114, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[5] = { x = 482.11, y = -1004.11, z = 26.54, hash = -53345114, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[6] = { x = 476.82, y = -1012.13, z = 26.54, hash = -53345114, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[7] = { x = 479.83, y = -1012.17, z = 26.54, hash = -53345114, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[8] = { x = 482.83, y = -1012.18, z = 26.54, hash = -53345114, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[9] = { x = 485.81, y = -1012.17, z = 26.54, hash = -53345114, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[10] = { x = 485.26, y = -1007.78, z = 26.54, hash = -53345114, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[11] = { x = 441.62, y = -977.67, z = 30.95, hash = 2888281650, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[12] = { x = 441.58, y = -986.18, z = 30.95, hash = 4198287975, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[13] = { x = 479.69, y = -998.53, z = 30.95, hash = -692649124, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[14] = { x = 486.36, y = -1000.26, z = 30.95, hash = -692649124, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[15] = { x = 467.96, y = -1014.42, z = 26.5, hash = -692649124, lock = true, text = true, distance = 10, press = 2, perm = "Police", other = 16 },
	[16] = { x = 469.06, y = -1014.41, z = 26.5, hash = -692649124, lock = true, text = true, distance = 10, press = 2, perm = "Police", other = 15 },
	[17] = { x = 441.27, y = -998.75, z = 30.95, hash = -1547307588, lock = true, text = true, distance = 10, press = 2, perm = "Police", other = 18 },
	[18] = { x = 442.43, y = -998.78, z = 30.95, hash = -1547307588, lock = true, text = true, distance = 10, press = 2, perm = "Police", other = 17 },
	[19] = { x = 457.59, y = -972.28, z = 30.95, hash = -1547307588, lock = true, text = true, distance = 10, press = 2, perm = "Police", other = 20 },
	[20] = { x = 456.43, y = -972.27, z = 30.95, hash = -1547307588, lock = true, text = true, distance = 10, press = 2, perm = "Police", other = 19 },

    --=== PRESIDIO

	[21] = { x = 1846.049, y = 2604.733, z = 45.579, hash = 741314661, lock = true, text = true, distance = 30, press = 10, perm = "Emergency" },
	[22] = { x = 1819.475, y = 2604.743, z = 45.577, hash = 741314661, lock = true, text = true, distance = 30, press = 10, perm = "Emergency" },
	[23] = { x = 1845.46, y = 2585.94, z = 45.88, hash = -1033001619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[24] = { x = 1819.28, y = 2594.40, z = 45.95, hash = -1033001619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[25] = { x = 1826.58, y = 2585.99, z = 45.95, hash = -1033001619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[26] = { x = 1828.38, y = 2584.70, z = 45.95, hash = -1033001619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[27] = { x = 1837.67, y = 2594.43, z = 45.95, hash = -1033001619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[28] = { x = 1791.00, y = 2594.46, z = 45.95, hash = 1645000677, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[29] = { x = 1791.00, y = 2593.35, z = 45.93, hash = 262839150, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[30] = { x = 1786.42, y = 2589.84, z = 45.8, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[31] = { x = 1773.72, y = 2589.99, z = 45.8, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[32] = { x = 1787.57, y = 2586.39, z = 45.8, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[33] = { x = 1787.52, y = 2582.39, z = 45.8, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[34] = { x = 1787.52, y = 2578.45, z = 45.8, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[35] = { x = 1787.56, y = 2574.53, z = 45.8, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[36] = { x = 1785.06, y = 2572.04, z = 45.8, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[37] = { x = 1772.89, y = 2572.09, z = 45.8, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[38] = { x = 1771.71, y = 2573.50, z = 45.8, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[39] = { x = 1771.68, y = 2577.38, z = 45.8, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[40] = { x = 1771.79, y = 2581.26, z = 45.8, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[41] = { x = 1771.76, y = 2585.27, z = 45.8, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[42] = { x = 1787.57, y = 2574.56, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[43] = { x = 1787.49, y = 2578.44, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[44] = { x = 1787.49, y = 2582.39, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[45] = { x = 1787.46, y = 2586.37, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[46] = { x = 1787.46, y = 2590.29, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[47] = { x = 1787.42, y = 2594.22, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[48] = { x = 1787.49, y = 2598.15, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[49] = { x = 1785.17, y = 2599.92, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[50] = { x = 1771.81, y = 2597.12, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[51] = { x = 1771.81, y = 2593.14, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[52] = { x = 1771.82, y = 2589.25, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[53] = { x = 1771.85, y = 2585.28, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[54] = { x = 1771.75, y = 2581.28, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[55] = { x = 1771.73, y = 2577.39, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[56] = { x = 1771.77, y = 2573.48, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[57] = { x = 1774.55, y = 2570.11, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[58] = { x = 1778.47, y = 2570.1 , z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[59] = { x = 1782.39, y = 2570.1 , z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[60] = { x = 1786.21, y = 2570.08, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[61] = { x = 1772.92, y = 2599.95, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[62] = { x = 1779.49, y = 2595.80, z = 50.55, hash = 1028191914, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[63] = { x = 1780.22, y = 2601.68, z = 50.55, hash = 1028191914, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[64] = { x = 1779.10, y = 2601.68, z = 50.55, hash = 1028191914, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[65] = { x = 1774.92, y = 2592.97, z = 45.8, hash = 1028191914, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[66] = { x = 1785.6, y = 2600.29, z = 45.8, hash = 262839150, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[67] = { x = 1783.86, y = 2598.36, z = 45.8, hash = 1028191914, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[68] = { x = 1786.26, y = 2621.0, z = 45.8, hash = 262839150, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[69] = { x = 1759.99, y = 2615.53, z = 45.8, hash = 1645000677, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[70] = { x = 1786.37, y = 2609.75, z = 46.1, hash = 1645000677, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[71] = { x = 1785.26, y = 2609.75, z = 46.1, hash = 262839150, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[72] = { x = 1787.64, y = 2606.92, z = 50.55, hash = 1028191914, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[73] = { x = 1764.9, y = 2607.51, z = 50.55, hash = 1028191914, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[74] = { x = 1765.22, y = 2597.02, z = 50.55, hash = 871712474, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[75] = { x = 1765.27, y = 2594.10, z = 50.55, hash = 871712474, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[76] = { x = 1765.26, y = 2591.21, z = 50.55, hash = 871712474, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[77] = { x = 1765.17, y = 2588.17, z = 50.55, hash = 871712474, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[78] = { x = 1762.88, y = 2588.39, z = 50.55, hash = 871712474, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[79] = { x = 1762.84, y = 2591.29, z = 50.55, hash = 871712474, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[80] = { x = 1762.83, y = 2594.22, z = 50.55, hash = 871712474, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[81] = { x = 1762.82, y = 2597.17, z = 50.55, hash = 871712474, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[82] = { x = 1763.91, y = 2600.3, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[83] = { x = 1767.38, y = 2606.71, z = 50.55, hash = 430324891, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[84] = { x = 1791.21, y = 2551.93, z = 45.8, hash = 262839150, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[85] = { x = 1783.18, y = 2547.79, z = 45.8, hash = 1028191914, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[86] = { x = 1776.30, y = 2552.14, z = 45.8, hash = 1645000677, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[87] = { x = 1765.53, y = 2566.74, z = 45.8, hash = 1645000677, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[88] = { x = 1785.29, y = 2566.89, z = 45.8, hash = 1028191914, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[89] = { x = 1760.31, y = 2413.01, z = 45.6, hash = -1033001619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[90] = { x = 1659.26, y = 2397.67, z = 45.6, hash = -1033001619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[91] = { x = 1543.36, y = 2470.61, z = 45.6, hash = -1033001619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[92] = { x = 1537.68, y = 2585.32, z = 45.6, hash = -1033001619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[93] = { x = 1572.11, y = 2678.58, z = 45.6, hash = -1033001619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[94] = { x = 1650.48, y = 2755.28, z = 45.6, hash = -1033001619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[95] = { x = 1772.39, y = 2759.97, z = 45.6, hash = -1033001619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[96] = { x = 1845.86, y = 2699.41, z = 45.6, hash = -1033001619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[97] = { x = 1820.79, y = 2621.52, z = 45.6, hash = -1033001619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[98] = { x = 1820.8, y = 2621.52, z = 45.6, hash = -1033001619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[99] = { x = 1849.02, y = 3693.30, z = 34.37, hash = -1491332605, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[100] = { x = 1851.94, y = 3694.98, z = 34.37, hash = -1491332605, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[101] = { x = 1856.33, y = 3696.54, z = 34.37, hash = -1491332605, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[102] = { x = 1853.76, y = 3699.85, z = 34.37, hash = -2002725619, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[103] = { x = 1847.24, y = 3688.46, z = 34.37, hash = -712085785, lock = true, text = true, distance = 10, press = 2, perm = "Police" },
	[104] = { x = 458.61, y = -989.94, z = 30.68, hash = -96679321, lock = true, text = true, distance = 10, press = 2, perm = "PoliceComando" },

    --=== PARAMEDICO

	[200] = { x = 308.03, y = -597.30, z = 43.39, hash = 854291622, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic" },
	[201] = { x = 308.20, y = -570.00, z = 43.39, hash = 854291622, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic" },
	[202] = { x = 337.25, y = -580.58, z = 43.39, hash = 854291622, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic" },
	[203] = { x = 341.87, y = -582.25, z = 43.39, hash = 854291622, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic" },
	[204] = { x = 347.87, y = -584.44, z = 43.39, hash = 854291622, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic" },
	[205] = { x = 340.13, y = -587.07, z = 43.39, hash = 854291622, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic" },
	[206] = { x = 361.60, y = -589.44, z = 43.39, hash = 854291622, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic" },
	[207] = { x = 359.86, y = -594.25, z = 43.39, hash = 854291622, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic" },
	[208] = { x = 351.75, y = -595.23, z = 43.39, hash = 854291622, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic" },
	[209] = { x = 350.39, y = -598.99, z = 43.39, hash = 854291622, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic" },
	[210] = { x = 345.96, y = -596.25, z = 43.39, hash = 854291622, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic" },
	[211] = { x = 347.32, y = -592.49, z = 43.39, hash = 854291622, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic" },
	[212] = { x = 355.68, y = -584.45, z = 43.39, hash = 854291622, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic" },
	[213] = { x = 357.04, y = -580.70, z = 43.39, hash = 854291622, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic" },
	[214] = { x = 304.40, y = -571.45, z = 43.39, hash = 854291622, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic" },
	[215] = { x = 303.60, y = -581.75, z = 43.39, hash = -434783486, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic", other = 87 },
	[216] = { x = 304.39, y = -582.05, z = 43.39, hash = -1700911976, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic", other = 86 },
	[217] = { x = 325.03, y = -589.55, z = 43.39, hash = -434783486, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic", other = 89 },
	[218] = { x = 325.81, y = -589.84, z = 43.39, hash = -1700911976, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic", other = 88 },
	[219] = { x = 312.80, y = -571.67, z = 43.39, hash = -434783486, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic", other = 91 },
	[220] = { x = 313.58, y = -571.95, z = 43.39, hash = -1700911976, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic", other = 90 },
	[221] = { x = 318.64, y = -574.08, z = 43.39, hash = -434783486, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic", other = 93 },
	[222] = { x = 319.44, y = -575.76, z = 43.39, hash = -1700911976, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic", other = 92 },
	[223] = { x = 324.04, y = -575.76, z = 43.39, hash = -434783486, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic", other = 95 },
	[224] = { x = 324.83, y = -576.04, z = 43.39, hash = -1700911976, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic", other = 94 },
	[225] = { x = -807.98, y = -1213.35, z = 7.33, hash = 854291622, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic", other = 94 },
	[226] = { x = -817.08, y = -1239.48, z = 7.33, hash = 854291622, lock = true, text = true, distance = 10, press = 2, perm = "Paramedic", other = 94 },

    --=== PLAYBOY

	[250] = { x = -1646.20, y = -1069.72, z = 13.85, hash = 855881614, lock = true, text = true, distance = 10, press = 2, perm = "Playboy" },
	[251] = { x = -1469.26, y = 68.95, z = 53.31, hash = -2125423493, lock = true, text = true, distance = 10, press = 2, perm = "Playboy" },
	[252] = { x = -1441.47, y = 172.87, z = 55.84, hash = -1859471240, lock = true, text = true, distance = 10, press = 2, perm = "Playboy" },
	[253] = { x = -1434.89, y = 235.55, z = 59.93, hash = -1859471240, lock = true, text = true, distance = 10, press = 2, perm = "Playboy" },
	[254] = { x = -1578.94, y = 152.58, z = 58.67, hash = -1859471240, lock = true, text = true, distance = 10, press = 2, perm = "Playboy" },
	[255] = { x = -1613.51, y = 77.53, z = 61.57, hash = -2125423493, lock = true, text = true, distance = 10, press = 2, perm = "Playboy" },
	[256] = { x = -1536.92, y = 130.78, z = 57.37, hash = 346577218, lock = true, text = true, distance = 10, press = 2, perm = "Playboy" },
	[257] = { x = -1537.55, y = 126.18, z = 56.78, hash = 39269536, lock = true, text = true, distance = 10, press = 2, perm = "Playboy" },
	[258] = { x = -1536.22, y = 108.28, z = 56.78, hash = 39269536, lock = true, text = true, distance = 10, press = 2, perm = "Playboy" },
	[259] = { x = -1500.68, y = 103.47, z = 55.65, hash = 346577218, lock = true, text = true, distance = 10, press = 2, perm = "Playboy" },
	[260] = { x = -1522.37, y = 143.41, z = 55.65, hash = 653721055, lock = true, text = true, distance = 10, press = 2, perm = "Playboy" },
	[261] = { x = -1537.13, y = 119.86, z = 56.78, hash = 39269536, lock = true, text = true, distance = 10, press = 2, perm = "Playboy" },

    --=== Vagos

	[300] = { x = 1332.68, y = -1654.39, z = 52.25, hash = 1173348778, lock = true, text = true, distance = 10, press = 2, perm = "Vagos" },

    --=== MECHANIC

	[320] = { x = 896.91, y = -2104.56, z = 34.88, hash = -88942360, lock = true, text = true, distance = 10, press = 2, perm = "Mechanic" },

    --=== Obey

	[330] = { x = -913.39, y = -232.08, z = 39.83, hash = 1018946149, lock = true, text = true, distance = 10, press = 2, perm = "Obey" },
	[331] = { x = -911.43, y = -233.27, z = 39.83, hash = 1018946149, lock = true, text = true, distance = 10, press = 2, perm = "Obey" },
	[332] = { x = -903.07, y = -237.37, z = 39.83, hash = 1018946149, lock = true, text = true, distance = 10, press = 2, perm = "Obey" },
	[333] = { x = -901.26, y = -238.31, z = 39.83, hash = 1018946149, lock = true, text = true, distance = 10, press = 2, perm = "Obey" },

    --=== BURGERSHOT

	[350] = { x = -1188.36, y = -896.14, z = 13.88, hash = 2010236044, lock = true, text = true, distance = 10, press = 2, perm = "Burgershot" },
	[351] = { x = -1197.69, y = -904.40, z = 13.88, hash = 1465287574, lock = true, text = true, distance = 10, press = 2, perm = "Burgershot" },

	--=== MOTOCLUB 

	[360] = { x = 2507.46, y = 4096.98, z = 38.72, hash = 782767342, lock = true, text = true, distance = 10, press = 2, perm = "Motoclub" },
	[361] = { x = 2512.59, y = 4104.65, z = 38.59, hash = -626684119, lock = true, text = true, distance = 10, press = 2, perm = "Motoclub" },
	[362] = { x = -1145.74, y = -1991.19, z = 13.18, hash = -550347177, lock = true, text = true, distance = 20, press = 5, perm = "Motoclub" },
	[363] = { x = 1174.77, y = 2645.24, z = 37.74, hash = -822900180, lock = true, text = true, distance = 20, press = 5, perm = "Motoclub" },
	[364] = { x = 1182.39, y = 2645.27, z = 37.81, hash = -822900180, lock = true, text = true, distance = 20, press = 5, perm = "Motoclub" },
	[365] = { x = 1187.78, y = 2644.99, z = 38.4, hash = 1335311341, lock = true, text = true, distance = 10, press = 2, perm = "Motoclub" },
	[366] = { x = 2521.02, y = 4123.96, z = 38.59, hash = 497665568, lock = true, text = true, distance = 20, press = 5, perm = "Motoclub" },

	--=== Vagos

	[370] = { x = 357.78, y = -2034.01, z = 25.59, hash = -1186396713, lock = true, text = true, distance = 10, press = 2, perm = "Vagos" },
	
	--=== Mafia Vinhedo

	[391] = { x = -1864.89, y = 2058.43, z = 135.44, hash = -710818483, lock = true, text = true, distance = 10, press = 2, perm = "Mafiavinhedo" },
	[392] = { x = -1860.64, y = 2058.35, z = 135.44, hash = -710818483, lock = true, text = true, distance = 10, press = 2, perm = "Mafiavinhedo" },

	--=== Yakuza

	[420] = { x = -949.08, y = -1475.18, z = 6.79, hash = -292728657, lock = true, text = true, distance = 10, press = 2, perm = "Yakuza" },
	[421] = { x = -948.44, y = -1476.88, z = 6.79, hash = -1653461382, lock = true, text = true, distance = 10, press = 2, perm = "Yakuza" },	

	--=== Bunker

	[450] = { x = 817.96, y = -3087.83, z = 5.88, hash = 572251989, lock = true, text = true, distance = 10, press = 2, perm = "Bunker" },
	[451] = { x = 965.00, y = -3207.46, z = -17.17, hash = 631614199, lock = true, text = true, distance = 10, press = 2, perm = "Bunker" },

	--=== Ballas

	[470] = { x = 125.04, y = -1956.46, z = 20.76, hash = -543490328, lock = true, text = true, distance = 10, press = 2, perm = "Ballas" },
	[471] = { x = 2452.67, y = 4969.77, z = 46.81, hash = 1413743677, lock = true, text = true, distance = 10, press = 2, perm = "Ballas" },
	[472] = { x = 2449.13, y = 4989.34, z = 46.81, hash = 1413743677, lock = true, text = true, distance = 10, press = 2, perm = "Ballas" },
	[473] = { x = 2435.94, y = 4975.51, z = 46.81, hash = 1413743677, lock = true, text = true, distance = 10, press = 2, perm = "Ballas" },	
	[474] = { x = 2440.41, y = 4982.18, z = 46.81, hash = 1413743677, lock = true, text = true, distance = 10, press = 2, perm = "Ballas" },
	[475] = { x = 2450.35, y = 4985.25, z = 51.58, hash = 1194028902, lock = true, text = true, distance = 10, press = 2, perm = "Ballas" },
	[476] = { x = 2451.26, y = 4984.45, z = 51.58, hash = 1194028902, lock = true, text = true, distance = 10, press = 2, perm = "Ballas" },
	[477] = { x = 2441.83, y = 4980.81, z = 51.56, hash = 1194028902, lock = true, text = true, distance = 10, press = 2, perm = "Ballas" },
	[478] = { x = 2442.61, y = 4980.08, z = 51.56, hash = 1194028902, lock = true, text = true, distance = 10, press = 2, perm = "Ballas" },
	[479] = { x = 2450.51, y = 4976.83, z = 51.56, hash = -5479653, lock = true, text = true, distance = 10, press = 2, perm = "Ballas" },
	[480] = { x = 2447.56, y = 4975.07, z = 51.56, hash = -5479653, lock = true, text = true, distance = 10, press = 2, perm = "Ballas" },

	[481] = { x = -3134.91, y = 794.81, z = 17.3, hash = 1286535678, lock = true, text = true, distance = 10, press = 2, perm = "Mansao1" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORSSTATISTICS
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.doorsStatistics(doorNumber,doorStatus)
	local Doors = GlobalState["Doors"]

	Doors[doorNumber]["lock"] = doorStatus

	if Doors[doorNumber]["other"] ~= nil then
		local doorSecond = Doors[doorNumber]["other"]
		Doors[doorSecond]["lock"] = doorStatus
	end

	GlobalState["Doors"] = Doors
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORSPERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.doorsPermission(doorNumber)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if GlobalState["Doors"][doorNumber]["perm"] ~= nil then
			if vRP.hasGroup(user_id,GlobalState["Doors"][doorNumber]["perm"]) then
				return true
			else
				local consultItem = vRP.getInventoryItemAmount(user_id,"lockpick2")
				if consultItem[1] >= 1 then
					if math.random(100) >= 50 then
						vRP.removeInventoryItem(user_id,consultItem[2],1,true)
						vRP.generateItem(user_id,"brokenpick",1,false)
					end

					local taskResult = vTASKBAR.taskDoors(source)
					if taskResult then
						return true
					end
				end
			end
		end
	end

	return false
end