function nearVehicle(radius)
	local vehList = {};
	local vehReturn = {};
	local ped = PlayerPedId();
	local coords = GetEntityCoords(ped);
	local _next, _vehicle = FindFirstVehicle();
	if _vehicle then
		table.insert(vehList, _vehicle);
	end;
	repeat
		local _nextVehicle, _vehicle = FindNextVehicle(_next);
		if _nextVehicle and _vehicle then
			table.insert(vehList, _vehicle);
		end;
	until not _nextVehicle;
	EndFindVehicle(_next);
	for k, v in pairs(vehList) do
		local uCoords = GetEntityCoords(v);
		local distance = #(coords - uCoords);
		if distance <= radius then
			vehReturn[v] = distance;
		end;
	end;
	return vehReturn;
end;
function tvRP.nearVehicle(radius)
	local vehSelect = false;
	local minRadius = radius + 0;
	local vehList = nearVehicle(radius);
	for _vehicle, _distance in pairs(vehList) do
		if _distance <= minRadius then
			minRadius = _distance;
			vehSelect = _vehicle;
		end;
	end;
	return vehSelect;
end;
function tvRP.inVehicle()
	local ped = PlayerPedId();
	return IsPedInAnyVehicle(ped);
end;
local vehList = {
	[1033245328] = {
		"dinghy",
		true
	},
	[276773164] = {
		"dinghy2",
		false
	},
	[509498602] = {
		"dinghy3",
		false
	},
	[867467158] = {
		"dinghy4",
		false
	},
	[861409633] = {
		"jetmax",
		true
	},
	[-1043459709] = {
		"marquis",
		true
	},
	[-1030275036] = {
		"seashark",
		true
	},
	[-616331036] = {
		"seashark2",
		false
	},
	[-311022263] = {
		"seashark3",
		false
	},
	[231083307] = {
		"speeder",
		true
	},
	[437538602] = {
		"speeder2",
		false
	},
	[400514754] = {
		"squalo",
		true
	},
	[771711535] = {
		"submersible",
		false
	},
	[-1066334226] = {
		"submersible2",
		false
	},
	[-282946103] = {
		"suntrap",
		true
	},
	[1070967343] = {
		"toro",
		true
	},
	[908897389] = {
		"toro2",
		false
	},
	[290013743] = {
		"tropic",
		true
	},
	[1448677353] = {
		"tropic2",
		false
	},
	[-2100640717] = {
		"tug",
		false
	},
	[2053223216] = {
		"benson",
		false
	},
	[850991848] = {
		"biff",
		false
	},
	[-801550069] = {
		"cerberus",
		false
	},
	[679453769] = {
		"cerberus2",
		false
	},
	[1909700336] = {
		"cerberus3",
		false
	},
	[1518533038] = {
		"hauler",
		false
	},
	[387748548] = {
		"hauler2",
		false
	},
	[904750859] = {
		"mule",
		false
	},
	[-1050465301] = {
		"mule2",
		false
	},
	[-2052737935] = {
		"mule3",
		false
	},
	[1945374990] = {
		"mule4",
		false
	},
	[569305213] = {
		"packer",
		true
	},
	[-2137348917] = {
		"phantom",
		false
	},
	[-1649536104] = {
		"phantom2",
		false
	},
	[177270108] = {
		"phantom3",
		false
	},
	[2112052861] = {
		"pounder",
		false
	},
	[1653666139] = {
		"pounder2",
		false
	},
	[1747439474] = {
		"stockade",
		false
	},
	[-214455498] = {
		"stockade3",
		false
	},
	[-1988428699] = {
		"terbyte",
		false
	},
	[-344943009] = {
		"blista",
		false
	},
	[1549126457] = {
		"brioso",
		false
	},
	[-1130810103] = {
		"dilettante",
		false
	},
	[1682114128] = {
		"dilettante2",
		false
	},
	[-1177863319] = {
		"issi2",
		false
	},
	[931280609] = {
		"issi3",
		false
	},
	[628003514] = {
		"issi4",
		false
	},
	[1537277726] = {
		"issi5",
		false
	},
	[1239571361] = {
		"issi6",
		false
	},
	[-431692672] = {
		"panto",
		false
	},
	[-1450650718] = {
		"prairie",
		false
	},
	[841808271] = {
		"rhapsody",
		false
	},
	[330661258] = {
		"cogcabrio",
		false
	},
	[-5153954] = {
		"exemplar",
		false
	},
	[-591610296] = {
		"f620",
		false
	},
	[-391594584] = {
		"felon",
		false
	},
	[-89291282] = {
		"felon2",
		false
	},
	[-624529134] = {
		"jackal",
		false
	},
	[1348744438] = {
		"oracle",
		false
	},
	[-511601230] = {
		"oracle2",
		false
	},
	[1349725314] = {
		"sentinel",
		false
	},
	[873639469] = {
		"sentinel2",
		false
	},
	[1581459400] = {
		"windsor",
		false
	},
	[-1930048799] = {
		"windsor2",
		false
	},
	[-1122289213] = {
		"zion",
		false
	},
	[-1193103848] = {
		"zion2",
		false
	},
	[1131912276] = {
		"bmx",
		true
	},
	[448402357] = {
		"cruiser",
		true
	},
	[-836512833] = {
		"fixter",
		true
	},
	[-186537451] = {
		"scorcher",
		true
	},
	[1127861609] = {
		"tribike",
		true
	},
	[-1233807380] = {
		"tribike2",
		true
	},
	[-400295096] = {
		"tribike3",
		true
	},
	[1171614426] = {
		"ambulance",
		false
	},
	[1127131465] = {
		"fbi",
		true
	},
	[-1647941228] = {
		"fbi2",
		true
	},
	[1938952078] = {
		"firetruk",
		true
	},
	[469291905] = {
		"lguard",
		true
	},
	[-2007026063] = {
		"pbus",
		true
	},
	[2046537925] = {
		"police",
		true
	},
	[-1627000575] = {
		"police2",
		true
	},
	[1912215274] = {
		"police3",
		true
	},
	[-1973172295] = {
		"police4",
		false
	},
	[-34623805] = {
		"policeb",
		true
	},
	[353883353] = {
		"polmav",
		true
	},
	[-1536924937] = {
		"policeold1",
		true
	},
	[-1779120616] = {
		"policeold2",
		true
	},
	[456714581] = {
		"policet",
		true
	},
	[741586030] = {
		"pranger",
		true
	},
	[-488123221] = {
		"predator",
		true
	},
	[-1205689942] = {
		"riot",
		true
	},
	[-1693015116] = {
		"riot2",
		true
	},
	[-1683328900] = {
		"sheriff",
		true
	},
	[1922257928] = {
		"sheriff2",
		true
	},
	[1181327175] = {
		"akula",
		false
	},
	[837858166] = {
		"annihilator",
		false
	},
	[788747387] = {
		"buzzard",
		false
	},
	[745926877] = {
		"buzzard2",
		false
	},
	[-50547061] = {
		"cargobob",
		false
	},
	[1621617168] = {
		"cargobob2",
		false
	},
	[1394036463] = {
		"cargobob3",
		false
	},
	[2025593404] = {
		"cargobob4",
		false
	},
	[744705981] = {
		"frogger",
		false
	},
	[1949211328] = {
		"frogger2",
		false
	},
	[-1984275979] = {
		"havok",
		false
	},
	[-42959138] = {
		"hunter",
		false
	},
	[-1660661558] = {
		"maverick",
		false
	},
	[347619240] = {
		"maverick2",
		true
	},
	[-82626025] = {
		"savage",
		false
	},
	[-726768679] = {
		"seasparrow",
		false
	},
	[1044954915] = {
		"skylift",
		false
	},
	[710198397] = {
		"supervolito",
		true
	},
	[-1671539132] = {
		"supervolito2",
		false
	},
	[-339587598] = {
		"swift",
		false
	},
	[1075432268] = {
		"swift2",
		false
	},
	[-1600252419] = {
		"valkyrie",
		false
	},
	[1543134283] = {
		"valkyrie2",
		false
	},
	[-1845487887] = {
		"volatus",
		false
	},
	[1886712733] = {
		"bulldozer",
		false
	},
	[-1006919392] = {
		"cutter",
		false
	},
	[-2130482718] = {
		"dump",
		false
	},
	[1353720154] = {
		"flatbed",
		true
	},
	[-2107990196] = {
		"guardian",
		false
	},
	[444583674] = {
		"handler",
		false
	},
	[-784816453] = {
		"mixer",
		false
	},
	[475220373] = {
		"mixer2",
		false
	},
	[-1705304628] = {
		"rubble",
		false
	},
	[48339065] = {
		"tiptruck",
		false
	},
	[-947761570] = {
		"tiptruck2",
		false
	},
	[562680400] = {
		"apc",
		false
	},
	[-823509173] = {
		"barracks",
		false
	},
	[1074326203] = {
		"barracks2",
		false
	},
	[630371791] = {
		"barracks3",
		false
	},
	[-212993243] = {
		"barrage",
		false
	},
	[-692292317] = {
		"chernobog",
		false
	},
	[321739290] = {
		"crusader",
		false
	},
	[-32236122] = {
		"halftrack",
		false
	},
	[-1435527158] = {
		"khanjali",
		false
	},
	[782665360] = {
		"rhino",
		false
	},
	[-1146969353] = {
		"scarab",
		false
	},
	[1542143200] = {
		"scarab2",
		false
	},
	[-579747861] = {
		"scarab3",
		false
	},
	[1489874736] = {
		"thruster",
		false
	},
	[-1881846085] = {
		"trailersmall2",
		false
	},
	[1672195559] = {
		"akuma",
		false
	},
	[-2115793025] = {
		"avarus",
		false
	},
	[-2140431165] = {
		"bagger",
		false
	},
	[-114291515] = {
		"bati",
		false
	},
	[-891462355] = {
		"bati2",
		false
	},
	[86520421] = {
		"bf400",
		false
	},
	[11251904] = {
		"carbonrs",
		false
	},
	[6774487] = {
		"chimera",
		false
	},
	[390201602] = {
		"cliffhanger",
		false
	},
	[2006142190] = {
		"daemon",
		false
	},
	[-1404136503] = {
		"daemon2",
		false
	},
	[822018448] = {
		"defiler",
		false
	},
	[-27326686] = {
		"deathbike",
		false
	},
	[-1812949672] = {
		"deathbike2",
		false
	},
	[-1374500452] = {
		"deathbike3",
		false
	},
	[-239841468] = {
		"diablous",
		false
	},
	[1790834270] = {
		"diablous2",
		false
	},
	[-1670998136] = {
		"double",
		false
	},
	[1753414259] = {
		"enduro",
		false
	},
	[2035069708] = {
		"esskey",
		false
	},
	[-1842748181] = {
		"faggio",
		false
	},
	[55628203] = {
		"faggio2",
		false
	},
	[-1289178744] = {
		"faggio3",
		false
	},
	[627535535] = {
		"fcr",
		false
	},
	[-757735410] = {
		"fcr2",
		false
	},
	[741090084] = {
		"gargoyle",
		false
	},
	[1265391242] = {
		"hakuchou",
		false
	},
	[-255678177] = {
		"hakuchou2",
		false
	},
	-- [301427732] = {
	-- 	"hexer",
	-- 	false
	-- },
	[-159126838] = {
		"innovation",
		false
	},
	[640818791] = {
		"lectro",
		false
	},
	[-1523428744] = {
		"manchez",
		false
	},
	[-634879114] = {
		"nemesis",
		false
	},
	[-1606187161] = {
		"nightblade",
		false
	},
	[884483972] = {
		"oppressor",
		false
	},
	[2069146067] = {
		"oppressor2",
		false
	},
	[-909201658] = {
		"pcj",
		false
	},
	[1873600305] = {
		"ratbike",
		false
	},
	[-893578776] = {
		"ruffian",
		false
	},
	[788045382] = {
		"sanchez",
		false
	},
	[-1453280962] = {
		"sanchez2",
		false
	},
	[1491277511] = {
		"sanctus",
		false
	},
	[-405626514] = {
		"shotaro",
		false
	},
	[743478836] = {
		"sovereign",
		false
	},
	[1836027715] = {
		"thrust",
		false
	},
	[-140902153] = {
		"vader",
		false
	},
	[-1353081087] = {
		"vindicator",
		false
	},
	[-609625092] = {
		"vortex",
		false
	},
	[-618617997] = {
		"wolfsbane",
		false
	},
	[-1009268949] = {
		"zombiea",
		false
	},
	[-570033273] = {
		"zombieb",
		false
	},
	[-1205801634] = {
		"blade",
		false
	},
	[-682211828] = {
		"buccaneer",
		false
	},
	[-1013450936] = {
		"buccaneer2",
		false
	},
	[349605904] = {
		"chino",
		false
	},
	[-1361687965] = {
		"chino2",
		false
	},
	[-1566607184] = {
		"clique",
		false
	},
	[784565758] = {
		"coquette3",
		false
	},
	[1279262537] = {
		"deviant",
		false
	},
	[80636076] = {
		"dominator",
		false
	},
	[-915704871] = {
		"dominator2",
		false
	},
	[-986944621] = {
		"dominator3",
		false
	},
	[-688189648] = {
		"dominator4",
		false
	},
	[-1375060657] = {
		"dominator5",
		false
	},
	[-1293924613] = {
		"dominator6",
		false
	},
	[723973206] = {
		"dukes",
		false
	},
	[-326143852] = {
		"dukes2",
		false
	},
	[-2119578145] = {
		"faction",
		false
	},
	[-1790546981] = {
		"faction2",
		false
	},
	[-2039755226] = {
		"faction3",
		false
	},
	[-1267543371] = {
		"ellie",
		false
	},
	[-1800170043] = {
		"gauntlet",
		false
	},
	[349315417] = {
		"gauntlet2",
		false
	},
	[15219735] = {
		"hermes",
		false
	},
	[37348240] = {
		"hotknife",
		false
	},
	[600450546] = {
		"hustler",
		false
	},
	[-2096690334] = {
		"impaler",
		false
	},
	[1009171724] = {
		"impaler2",
		false
	},
	[-1924800695] = {
		"impaler3",
		false
	},
	[-1744505657] = {
		"impaler4",
		false
	},
	[444994115] = {
		"imperator",
		false
	},
	[1637620610] = {
		"imperator2",
		false
	},
	[-755532233] = {
		"imperator3",
		false
	},
	[2068293287] = {
		"lurcher",
		false
	},
	[525509695] = {
		"moonbeam",
		false
	},
	[1896491931] = {
		"moonbeam2",
		false
	},
	[-1943285540] = {
		"nightshade",
		false
	},
	[-2095439403] = {
		"phoenix",
		false
	},
	[1507916787] = {
		"picador",
		false
	},
	[-667151410] = {
		"ratloader",
		false
	},
	[-589178377] = {
		"ratloader2",
		false
	},
	[-227741703] = {
		"ruiner",
		false
	},
	[941494461] = {
		"ruiner2",
		false
	},
	[777714999] = {
		"ruiner3",
		false
	},
	[-1685021548] = {
		"sabregt",
		false
	},
	[223258115] = {
		"sabregt2",
		false
	},
	[729783779] = {
		"slamvan",
		false
	},
	[833469436] = {
		"slamvan2",
		false
	},
	[1119641113] = {
		"slamvan3",
		false
	},
	[-2061049099] = {
		"slamvan4",
		false
	},
	[373261600] = {
		"slamvan5",
		false
	},
	[1742022738] = {
		"slamvan6",
		false
	},
	[1923400478] = {
		"stalion",
		false
	},
	[-401643538] = {
		"stalion2",
		false
	},
	[972671128] = {
		"tampa",
		false
	},
	[-1210451983] = {
		"tampa3",
		false
	},
	[1456744817] = {
		"tulip",
		false
	},
	[-49115651] = {
		"vamos",
		false
	},
	[-825837129] = {
		"vigero",
		false
	},
	[-498054846] = {
		"virgo",
		false
	},
	[-899509638] = {
		"virgo2",
		false
	},
	[16646064] = {
		"virgo3",
		false
	},
	[2006667053] = {
		"voodoo",
		false
	},
	[523724515] = {
		"voodoo2",
		false
	},
	[1871995513] = {
		"yosemite",
		false
	},
	[1126868326] = {
		"bfinjection",
		false
	},
	[-349601129] = {
		"bifta",
		false
	},
	[-2128233223] = {
		"blazer",
		false
	},
	[-48031959] = {
		"blazer2",
		true
	},
	[-1269889662] = {
		"blazer3",
		false
	},
	[-440768424] = {
		"blazer4",
		false
	},
	[-1590337689] = {
		"blazer5",
		false
	},
	[-1435919434] = {
		"bodhi2",
		false
	},
	[-1479664699] = {
		"brawler",
		false
	},
	[668439077] = {
		"bruiser",
		false
	},
	[-1694081890] = {
		"bruiser2",
		false
	},
	[-2042350822] = {
		"bruiser3",
		false
	},
	[2139203625] = {
		"brutus",
		false
	},
	[-1890996696] = {
		"brutus2",
		false
	},
	[2038858402] = {
		"brutus3",
		false
	},
	[1254014755] = {
		"caracara",
		false
	},
	[1770332643] = {
		"dloader",
		false
	},
	[-1237253773] = {
		"dubsta3",
		false
	},
	[-1661854193] = {
		"dune",
		false
	},
	[534258863] = {
		"dune2",
		false
	},
	[1897744184] = {
		"dune3",
		false
	},
	[-827162039] = {
		"dune4",
		false
	},
	[-312295511] = {
		"dune5",
		false
	},
	[-54332285] = {
		"freecrawler",
		false
	},
	[-1860900134] = {
		"insurgent",
		false
	},
	[2071877360] = {
		"insurgent2",
		false
	},
	[-1924433270] = {
		"insurgent3",
		false
	},
	[92612664] = {
		"kalahari",
		false
	},
	[-121446169] = {
		"kamacho",
		false
	},
	[1233534620] = {
		"marshall",
		false
	},
	[-2064372143] = {
		"mesa3",
		false
	},
	[-845961253] = {
		"monster",
		false
	},
	[1721676810] = {
		"monster3",
		false
	},
	[840387324] = {
		"monster4",
		false
	},
	[-715746948] = {
		"monster5",
		false
	},
	[2044532910] = {
		"menacer",
		false
	},
	[433954513] = {
		"nightshark",
		false
	},
	[1645267888] = {
		"rancherxl",
		false
	},
	[1933662059] = {
		"rancherxl2",
		false
	},
	[-1207771834] = {
		"rebel",
		false
	},
	[-2045594037] = {
		"rebel2",
		false
	},
	[-286046740] = {
		"rcbandito",
		false
	},
	[-1532697517] = {
		"riata",
		false
	},
	[-1189015600] = {
		"sandking",
		false
	},
	[989381445] = {
		"sandking2",
		false
	},
	[-2096818938] = {
		"technical",
		false
	},
	[1180875963] = {
		"technical2",
		false
	},
	[1356124575] = {
		"technical3",
		false
	},
	[101905590] = {
		"trophytruck",
		false
	},
	[-663299102] = {
		"trophytruck2",
		false
	},
	[-1523619738] = {
		"alphaz1",
		false
	},
	[-2118308144] = {
		"avenger",
		false
	},
	[408970549] = {
		"avenger2",
		false
	},
	[1824333165] = {
		"besra",
		false
	},
	[-150975354] = {
		"blimp",
		false
	},
	[-613725916] = {
		"blimp2",
		false
	},
	[-307958377] = {
		"blimp3",
		false
	},
	[-32878452] = {
		"bombushka",
		false
	},
	[368211810] = {
		"cargoplane",
		false
	},
	[-644710429] = {
		"cuban800",
		false
	},
	[-901163259] = {
		"dodo",
		false
	},
	[970356638] = {
		"duster",
		false
	},
	[-1007528109] = {
		"howard",
		false
	},
	[970385471] = {
		"hydra",
		false
	},
	[1058115860] = {
		"jet",
		false
	},
	[-1281684762] = {
		"lazer",
		false
	},
	[621481054] = {
		"luxor",
		false
	},
	[-1214293858] = {
		"luxor2",
		false
	},
	[-1746576111] = {
		"mammatus",
		false
	},
	[-1763555241] = {
		"microlight",
		false
	},
	[165154707] = {
		"miljet",
		false
	},
	[-749299473] = {
		"mogul",
		false
	},
	[1565978651] = {
		"molotok",
		false
	},
	[-1295027632] = {
		"nimbus",
		false
	},
	[1036591958] = {
		"nokota",
		false
	},
	[-1386191424] = {
		"pyro",
		false
	},
	[-975345305] = {
		"rogue",
		false
	},
	[-392675425] = {
		"seabreeze",
		false
	},
	[-1214505995] = {
		"shamal",
		false
	},
	[-1700874274] = {
		"starling",
		false
	},
	[1692272545] = {
		"strikeforce",
		false
	},
	[-2122757008] = {
		"stunt",
		false
	},
	[1981688531] = {
		"titan",
		false
	},
	[1043222410] = {
		"tula",
		false
	},
	[-1673356438] = {
		"velum",
		false
	},
	[1077420264] = {
		"velum2",
		false
	},
	[1341619767] = {
		"vestra",
		false
	},
	[447548909] = {
		"volatol",
		false
	},
	[-808831384] = {
		"baller",
		false
	},
	[142944341] = {
		"baller2",
		false
	},
	[1878062887] = {
		"baller3",
		false
	},
	[634118882] = {
		"baller4",
		false
	},
	[470404958] = {
		"baller5",
		false
	},
	[666166960] = {
		"baller6",
		false
	},
	[850565707] = {
		"bjxl",
		false
	},
	[2006918058] = {
		"cavalcade",
		false
	},
	[-789894171] = {
		"cavalcade2",
		false
	},
	[683047626] = {
		"contender",
		false
	},
	[1177543287] = {
		"dubsta",
		false
	},
	[-394074634] = {
		"dubsta2",
		false
	},
	[-1137532101] = {
		"fq2",
		false
	},
	[-1775728740] = {
		"granger",
		false
	},
	[-1543762099] = {
		"gresley",
		false
	},
	[884422927] = {
		"habanero",
		false
	},
	[486987393] = {
		"huntley",
		false
	},
	[1269098716] = {
		"landstalker",
		false
	},
	[914654722] = {
		"mesa",
		false
	},
	[-748008636] = {
		"mesa2",
		false
	},
	[-808457413] = {
		"patriot",
		false
	},
	[-420911112] = {
		"patriot2",
		false
	},
	[-1651067813] = {
		"radi",
		false
	},
	[2136773105] = {
		"rocoto",
		false
	},
	[1221512915] = {
		"seminole",
		false
	},
	[1337041428] = {
		"serrano",
		false
	},
	[-1168952148] = {
		"toros",
		false
	},
	[1203490606] = {
		"xls",
		false
	},
	[-432008408] = {
		"xls2",
		false
	},
	[-1809822327] = {
		"asea",
		false
	},
	[-1807623979] = {
		"asea2",
		false
	},
	[-1903012613] = {
		"asterope",
		false
	},
	[906642318] = {
		"cog55",
		false
	},
	[704435172] = {
		"cog552",
		false
	},
	[-2030171296] = {
		"cognoscenti",
		false
	},
	[-604842630] = {
		"cognoscenti2",
		false
	},
	[-685276541] = {
		"emperor",
		false
	},
	[-1883002148] = {
		"emperor2",
		false
	},
	[-1241712818] = {
		"emperor3",
		false
	},
	[1909141499] = {
		"fugitive",
		false
	},
	[75131841] = {
		"glendale",
		false
	},
	[-1289722222] = {
		"ingot",
		false
	},
	[886934177] = {
		"intruder",
		false
	},
	[-114627507] = {
		"limo2",
		false
	},
	[-1883869285] = {
		"premier",
		false
	},
	[-1150599089] = {
		"primo",
		false
	},
	[-2040426790] = {
		"primo2",
		false
	},
	[-14495224] = {
		"regina",
		false
	},
	[627094268] = {
		"romero",
		false
	},
	[-1255452397] = {
		"schafter2",
		false
	},
	[-888242983] = {
		"schafter5",
		false
	},
	[321186144] = {
		"stafford",
		false 
	},
	[-1477580979] = {
		"stanier",
		false
	},
	[1723137093] = {
		"stratum",
		false
	},
	[-1961627517] = {
		"stretch",
		false
	},
	[1123216662] = {
		"superd",
		false
	},
	-- [-1894894188] = {
	-- 	"surge",
	-- 	false
	-- },
	[-1008861746] = {
		"tailgater",
		false
	},
	[1373123368] = {
		"warrener",
		false
	},
	[1777363799] = {
		"washington",
		false
	},
	[1283517198] = {
		"airbus",
		false
	},
	[-305727417] = {
		"brickade",
		false
	},
	[-713569950] = {
		"bus",
		true
	},
	[-2072933068] = {
		"coach",
		false
	},
	[345756458] = {
		"pbus2",
		false
	},
	[-2103821244] = {
		"rallytruck",
		false
	},
	[-1098802077] = {
		"rentalbus",
		false
	},
	[-956048545] = {
		"taxi",
		true
	},
	[1941029835] = {
		"tourbus",
		false
	},
	[1917016601] = {
		"trash",
		false
	},
	[-1255698084] = {
		"trash2",
		false
	},
	[-1912017790] = {
		"wastelander",
		false
	},
	[767087018] = {
		"alpha",
		false
	},
	[-1041692462] = {
		"banshee",
		false
	},
	[1274868363] = {
		"bestiagts",
		false
	},
	[1039032026] = {
		"blista2",
		false
	},
	[-591651781] = {
		"blista3",
		false
	},
	[-304802106] = {
		"buffalo",
		false
	},
	[736902334] = {
		"buffalo2",
		false
	},
	[237764926] = {
		"buffalo3",
		false
	},
	[2072687711] = {
		"carbonizzare",
		false
	},
	[-1045541610] = {
		"comet2",
		false
	},
	[-2022483795] = {
		"comet3",
		false
	},
	[1561920505] = {
		"comet4",
		false
	},
	[661493923] = {
		"comet5",
		false
	},
	[108773431] = {
		"coquette",
		false
	},
	[1591739866] = {
		"deveste",
		false
	},
	[196747873] = {
		"elegy",
		false
	},
	[-566387422] = {
		"elegy2",
		false
	},
	[-1995326987] = {
		"feltzer2",
		false
	},
	[-1259134696] = {
		"flashgt",
		false
	},
	[-1089039904] = {
		"furoregt",
		false
	},
	[499169875] = {
		"fusilade",
		false
	},
	[2016857647] = {
		"futo",
		false
	},
	[1909189272] = {
		"gb200",
		false
	},
	[1115909093] = {
		"hotring",
		false
	},
	[-331467772] = {
		"italigto",
		false
	},
	[-1297672541] = {
		"jester",
		false
	},
	[-1106353882] = {
		"jester2",
		false
	},
	[-214906006] = {
		"jester3",
		false
	},
	-- [544021352] = {
	-- 	"khamelion",
	-- 	false
	-- },
	[-1372848492] = {
		"kuruma",
		false
	},
	[410882957] = {
		"kuruma2",
		false
	},
	[482197771] = {
		"lynx",
		false
	},
	[-142942670] = {
		"massacro",
		false
	},
	[-631760477] = {
		"massacro2",
		false
	},
	[-1848994066] = {
		"neon",
		false
	},
	[1032823388] = {
		"ninef",
		false
	},
	[-1461482751] = {
		"ninef2",
		false
	},
	[-777172681] = {
		"omnis",
		false
	},
	[867799010] = {
		"pariah",
		false
	},
	[-377465520] = {
		"penumbra",
		false
	},
	[-1529242755] = {
		"raiden",
		false
	},
	[-1934452204] = {
		"rapidgt",
		false
	},
	[1737773231] = {
		"rapidgt2",
		false
	},
	[-674927303] = {
		"raptor",
		false
	},
	[-410205223] = {
		"revolter",
		false
	},
	[719660200] = {
		"ruston",
		false
	},
	[-1485523546] = {
		"schafter3",
		false
	},
	[1489967196] = {
		"schafter4",
		false
	},
	[-888242983] = {
		"schafter5",
		false
	},
	[1922255844] = {
		"schafter6",
		false
	},
	[-507495760] = {
		"schlagen",
		false
	},
	[-746882698] = {
		"schwarzer",
		false
	},
	[1104234922] = {
		"sentinel3",
		false
	},
	[-1757836725] = {
		"seven70",
		false
	},
	[1886268224] = {
		"specter",
		false
	},
	[1074745671] = {
		"specter2",
		false
	},
	[1741861769] = {
		"streiter",
		false
	},
	[970598228] = {
		"sultan",
		false
	},
	[384071873] = {
		"surano",
		false
	},
	[-1071380347] = {
		"tampa2",
		false
	},
	[1887331236] = {
		"tropos",
		false
	},
	[1102544804] = {
		"verlierer2",
		false
	},
	[540101442] = {
		"zr380",
		false
	},
	[-1106120762] = {
		"zr3802",
		false
	},
	[-1478704292] = {
		"zr3803",
		false
	},
	[159274291] = {
		"ardent",
		false
	},
	[117401876] = {
		"btype",
		false
	},
	[-831834716] = {
		"btype2",
		false
	},
	[-602287871] = {
		"btype3",
		false
	},
	[941800958] = {
		"casco",
		false
	},
	[223240013] = {
		"cheetah2",
		false
	},
	[1011753235] = {
		"coquette2",
		false
	},
	[1483171323] = {
		"deluxo",
		false
	},
	[1617472902] = {
		"fagaloa",
		false
	},
	[-1566741232] = {
		"feltzer3",
		false
	},
	[-2079788230] = {
		"gt500",
		false
	},
	[-1405937764] = {
		"infernus2",
		false
	},
	[1051415893] = {
		"jb700",
		false
	},
	[-1660945322] = {
		"mamba",
		false
	},
	[-2124201592] = {
		"manana",
		false
	},
	[1046206681] = {
		"michelli",
		false
	},
	[-433375717] = {
		"monroe",
		false
	},
	[1830407356] = {
		"peyote",
		false
	},
	[1078682497] = {
		"pigalle",
		false
	},
	[2049897956] = {
		"rapidgt3",
		false
	},
	[1841130506] = {
		"retinue",
		false
	},
	[903794909] = {
		"savestra",
		false
	},
	[1545842587] = {
		"stinger",
		false
	},
	[-2098947590] = {
		"stingergt",
		false
	},
	[886810209] = {
		"stromberg",
		false
	},
	[500482303] = {
		"swinger",
		false
	},
	[1504306544] = {
		"torero",
		false
	},
	[464687292] = {
		"tornado",
		false
	},
	[1531094468] = {
		"tornado2",
		false
	},
	[1762279763] = {
		"tornado3",
		false
	},
	[-2033222435] = {
		"tornado4",
		false
	},
	[-1797613329] = {
		"tornado5",
		false
	},
	[-1558399629] = {
		"tornado6",
		false
	},
	[-982130927] = {
		"turismo2",
		false
	},
	[-391595372] = {
		"viseris",
		false
	},
	[838982985] = {
		"z190",
		false
	},
	[758895617] = {
		"ztype",
		false
	},
	[-988501280] = {
		"cheburek",
		false
	},
	[-1216765807] = {
		"adder",
		false
	},
	[-313185164] = {
		"autarch",
		false
	},
	[633712403] = {
		"banshee2",
		false
	},
	[-1696146015] = {
		"bullet",
		false
	},
	[-1311154784] = {
		"cheetah",
		false
	},
	[1392481335] = {
		"cyclone",
		false
	},
	[-2120700196] = {
		"entity2",
		false
	},
	[-1291952903] = {
		"entityxf",
		false
	},
	[1426219628] = {
		"fmj",
		false
	},
	[1234311532] = {
		"gp1",
		false
	},
	[418536135] = {
		"infernus",
		false
	},
	[-2048333973] = {
		"italigtb",
		false
	},
	[-482719877] = {
		"italigtb2",
		false
	},
	[-1232836011] = {
		"le7b",
		false
	},
	[1034187331] = {
		"nero",
		false
	},
	[1093792632] = {
		"nero2",
		false
	},
	[1987142870] = {
		"osiris",
		false
	},
	[-1758137366] = {
		"penetrator",
		false
	},
	[-1829802492] = {
		"pfister811",
		false
	},
	[2123327359] = {
		"prototipo",
		false
	},
	[234062309] = {
		"reaper",
		false
	},
	[1352136073] = {
		"sc1",
		false
	},
	[-638562243] = {
		"scramjet",
		false
	},
	[819197656] = {
		"sheava",
		false
	},
	[-295689028] = {
		"sultanrs",
		false
	},
	[1663218586] = {
		"t20",
		false
	},
	[-1134706562] = {
		"taipan",
		false
	},
	[272929391] = {
		"tempesta",
		false
	},
	[1031562256] = {
		"tezeract",
		false
	},
	[408192225] = {
		"turismor",
		false
	},
	[-376434238] = {
		"tyrant",
		false
	},
	[2067820283] = {
		"tyrus",
		false
	},
	[338562499] = {
		"vacca",
		false
	},
	[1939284556] = {
		"vagner",
		false
	},
	[-1242608589] = {
		"vigilante",
		false
	},
	[-998177792] = {
		"visione",
		false
	},
	-- [-1622444098] = {
	-- 	"voltic",
	-- 	false
	-- },
	[989294410] = {
		"voltic2",
		false
	},
	[917809321] = {
		"xa21",
		false
	},
	[-1403128555] = {
		"zentorno",
		false
	},
	[-1207431159] = {
		"armytanker",
		true
	},
	[-1476447243] = {
		"armytrailer",
		true
	},
	[-1637149482] = {
		"armytrailer2",
		true
	},
	[-399841706] = {
		"baletrailer",
		true
	},
	[524108981] = {
		"boattrailer",
		true
	},
	[-960289747] = {
		"cablecar",
		true
	},
	[-2140210194] = {
		"docktrailer",
		true
	},
	[-777275802] = {
		"freighttrailer",
		true
	},
	[1019737494] = {
		"graintrailer",
		true
	},
	[356391690] = {
		"proptrailer",
		true
	},
	[390902130] = {
		"raketrailer",
		true
	},
	[2078290630] = {
		"tr2",
		true
	},
	[1784254509] = {
		"tr3",
		true
	},
	[2091594960] = {
		"tr4",
		true
	},
	[-1352468814] = {
		"trflat",
		true
	},
	[-1770643266] = {
		"tvtrailer",
		true
	},
	[-730904777] = {
		"tanker",
		true
	},
	[1956216962] = {
		"tanker2",
		true
	},
	[1502869817] = {
		"trailerlarge",
		true
	},
	[2016027501] = {
		"trailerlogs",
		true
	},
	[712162987] = {
		"trailersmall",
		true
	},
	[-877478386] = {
		"trailers",
		true
	},
	[-1579533167] = {
		"trailers2",
		true
	},
	[-2058878099] = {
		"trailers3",
		true
	},
	[-1100548694] = {
		"trailers4",
		true
	},
	[1030400667] = {
		"freight",
		true
	},
	[184361638] = {
		"freightcar",
		true
	},
	[920453016] = {
		"freightcont1",
		true
	},
	[240201337] = {
		"freightcont2",
		true
	},
	[642617954] = {
		"freightgrain",
		true
	},
	[868868440] = {
		"metrotrain",
		true
	},
	[586013744] = {
		"tankercar",
		true
	},
	[1560980623] = {
		"airtug",
		false
	},
	[1147287684] = {
		"caddy",
		false
	},
	[-537896628] = {
		"caddy2",
		false
	},
	[-769147461] = {
		"caddy3",
		false
	},
	[-884690486] = {
		"docktug",
		false
	},
	[1491375716] = {
		"forklift",
		false
	},
	[1783355638] = {
		"mower",
		false
	},
	[-845979911] = {
		"ripley",
		false
	},
	[-599568815] = {
		"sadler",
		false
	},
	[734217681] = {
		"sadler2",
		false
	},
	[-1700801569] = {
		"scrap",
		false
	},
	[-1323100960] = {
		"towtruck",
		true
	},
	[-442313018] = {
		"towtruck2",
		true
	},
	[1641462412] = {
		"tractor",
		false
	},
	[-2076478498] = {
		"tractor2",
		false
	},
	[1445631933] = {
		"tractor3",
		false
	},
	[516990260] = {
		"utillitruck",
		false
	},
	[887537515] = {
		"utillitruck2",
		false
	},
	[2132890591] = {
		"utillitruck3",
		false
	},
	[-16948145] = {
		"bison",
		false
	},
	[2072156101] = {
		"bison2",
		false
	},
	[1739845664] = {
		"bison3",
		false
	},
	[1069929536] = {
		"bobcatxl",
		false
	},
	[-1987130134] = {
		"boxville",
		false
	},
	[-233098306] = {
		"boxville2",
		false
	},
	[121658888] = {
		"boxville3",
		false
	},
	[444171386] = {
		"boxville4",
		false
	},
	[682434785] = {
		"boxville5",
		false
	},
	[-1346687836] = {
		"burrito",
		false
	},
	[-907477130] = {
		"burrito2",
		false
	},
	[-1743316013] = {
		"burrito3",
		false
	},
	[893081117] = {
		"burrito4",
		false
	},
	[1132262048] = {
		"burrito5",
		false
	},
	[1876516712] = {
		"camper",
		false
	},
	[-1745203402] = {
		"gburrito",
		false
	},
	[296357396] = {
		"gburrito2",
		false
	},
	[-120287622] = {
		"journey",
		false
	},
	[-310465116] = {
		"minivan",
		false
	},
	[-1126264336] = {
		"minivan2",
		false
	},
	[1488164764] = {
		"paradise",
		false
	},
	[-119658072] = {
		"pony",
		false
	},
	[943752001] = {
		"pony2",
		false
	},
	[1162065741] = {
		"rumpo",
		false
	},
	[-1776615689] = {
		"rumpo2",
		false
	},
	[1475773103] = {
		"rumpo3",
		false
	},
	[-810318068] = {
		"speedo",
		false
	},
	[728614474] = {
		"speedo2",
		false
	},
	[219613597] = {
		"speedo4",
		false
	},
	[699456151] = {
		"surfer",
		false
	},
	[-1311240698] = {
		"surfer2",
		false
	},
	[1951180813] = {
		"taco",
		false
	},
	[65402552] = {
		"youga",
		false
	},
	[1026149675] = {
		"youga2",
		false
	},
	[1118611807] = {
		"asbo",
		false
	},
	[409049982] = {
		"kanjo",
		false
	},
	[-1254331310] = {
		"minitank",
		false
	},
	[1693751655] = {
		"yosemite2",
		false
	},
	[-1349095620] = {
		"caracara2",
		false
	},
	[-1756021720] = {
		"everon",
		false
	},
	[83136452] = {
		"rebla",
		false
	},
	[-834353991] = {
		"komoda",
		false
	},
	[-1132721664] = {
		"imorgon",
		false
	},
	[1456336509] = {
		"vstr",
		false
	},
	[-2098954619] = {
		"club",
		false
	},
	[2134119907] = {
		"dukes3",
		false
	},
	[-2122646867] = {
		"gauntlet5",
		false
	},
	[67753863] = {
		"yosemite3",
		false
	},
	[1492612435] = {
		"openwheel1",
		false
	},
	[1181339704] = {
		"openwheel2",
		false
	},
	[-838099166] = {
		"landstalker2",
		false
	},
	[-1810806490] = {
		"seminole2",
		false
	},
	[-913589546] = {
		"glendale2",
		false
	},
	[-1728685474] = {
		"coquette4",
		false
	},
	[-631322662] = {
		"penumbra2",
		false
	},
	[1717532765] = {
		"manana2",
		false
	},
	[1107404867] = {
		"peyote3",
		false
	},
	[-1358197432] = {
		"tigon",
		false
	},
	[1802742206] = {
		"youga3",
		false
	},
	[301304410] = {
		"stryder",
		false
	},
	[722226637] = {
		"gauntlet3",
		false
	},
	[1934384720] = {
		"gauntlet4",
		false
	},
	[-1804415708] = {
		"peyote2",
		false
	},
	[-362150785] = {
		"hellion",
		false
	},
	[408825843] = {
		"outlaw",
		false
	},
	[740289177] = {
		"vagrant",
		false
	},
	[1284356689] = {
		"zhaba",
		false
	},
	[340154634] = {
		"formula",
		false
	},
	[-1960756985] = {
		"formula2",
		false
	},
	[-1829436850] = {
		"novak",
		false
	},
	[686471183] = {
		"drafter",
		false
	},
	[1854776567] = {
		"issi7",
		false
	},
	[-208911803] = {
		"jugular",
		false
	},
	[-941272559] = {
		"locust",
		false
	},
	[-1620126302] = {
		"neo",
		false
	},
	[-447711397] = {
		"paragon",
		false
	},
	[1416466158] = {
		"paragon2",
		false
	},
	[987469656] = {
		"sugoi",
		false
	},
	[872704284] = {
		"sultan2",
		false
	},
	[310284501] = {
		"dynasty",
		false
	},
	[394110044] = {
		"jb7002",
		false
	},
	[-882629065] = {
		"nebula",
		false
	},
	[2031587082] = {
		"retinue2",
		false
	},
	[1862507111] = {
		"zion3",
		false
	},
	[1323778901] = {
		"emerus",
		false
	},
	[960812448] = {
		"furia",
		false
	},
	[-664141241] = {
		"krieger",
		false
	},
	[-324618589] = {
		"s80",
		false
	},
	[1044193113] = {
		"thrax",
		false
	},
	[-682108547] = {
		"zorrusso",
		false
	},
	[-1706603682] = {
		"avisa",
		false
	},
	[-980573366] = {
		"dinghy5",
		false
	},
	[1336872304] = {
		"kosatka",
		false
	},
	[1861786828] = {
		"longfin",
		false
	},
	[-276744698] = {
		"patrolboat",
		false
	},
	[1429622905] = {
		"brioso2",
		false
	},
	[1644055914] = {
		"weevil",
		false
	},
	[295054921] = {
		"annihilator2",
		false
	},
	[1229411063] = {
		"seasparrow2",
		false
	},
	[1593933419] = {
		"seasparrow3",
		false
	},
	[2014313426] = {
		"vetir",
		false
	},
	[1086534307] = {
		"manchez2",
		false
	},
	[298565713] = {
		"verus",
		false
	},
	[-210308634] = {
		"winky",
		false
	},
	[-365873403] = {
		"alkonost",
		false
	},
	[-102335483] = {
		"squaddie",
		false
	},
	[-1149725334] = {
		"italirsx",
		false
	},
	[-857356038] = {
		"veto",
		true
	},
	[-1492917079] = {
		"veto2",
		true
	},
	[1455990255] = {
		"toreador",
		false
	},
	[-1045911276] = {
		"slamtruck",
		false
	},
	[426742808] = {
		"dominator7",
		false
	},
	[-1244461404] = {
		"tailgater2",
		false
	},
	[-1858654120] = {
		"zr350",
		false
	},
	[-1193912403] = {
		"calito",
		false
	},
	[-1507230520] = {
		"futo2",
		false
	},
	[2038480341] = {
		"euros",
		false
	},
	[-1582061455] = {
		"jester4",
		false
	},
	[1377217886] = {
		"remus",
		false
	},
	[-1726022652] = {
		"comet6",
		false
	},
	[1304459735] = {
		"growler",
		false
	},
	[-1540373595] = {
		"vectre",
		false
	},
	[1755697647] = {
		"cypher",
		false
	},
	[-291021213] = {
		"sultan3",
		false
	},
	[-452604007] = {
		"rt3000",
		false
	},
	[1416471345] = {
		"previon",
		false
	},
	[1799969023] = {
		"crownvictoria",
		false
	},
	[-402863496] = {
		"dodgecharger2014",
		false
	},
	[-1022830589] = {
		"fordexplorer",
		false
	},
	[-390261695] = {
		"fordraptor",
		false
	},
	[998676702] = {
		"fordtaurus",
		false
	},
	[1106910537] = {
		"fordmustanggt",
		false
	},
	[1833236016] = {
		"corvette",
		false
	},
	[1685324829] = {
		"challenger",
		false
	},
	[-884764669] = {
		"hondanc700",
		true
	},
	[-1294827283] = {
		"bmwr1200",
		true
	},
	[-1540353819] = {
		"bmwi8",
		false
	},
	[-13524981] = {
		"bmwm4gts",
		false
	},
	[2004548589] = {
		"civictyper",
		false
	},
	[1601422646] = {
		"dodgechargersrt",
		false
	},
	[-322014905] = {
		"ferrari812",
		false
	},
	[-1151600959] = {
		"ferrarif12",
		false
	},
	[-1173768715] = {
		"ferrariitalia",
		false
	},
	[1537663698] = {
		"dodgecharger1970",
		false
	},
	[-1573350092] = {
		"fordmustang",
		false
	},
	[1114244595] = {
		"lamborghinihuracan",
		false
	},
	[1978088379] = {
		"lancerevolutionx",
		false
	},
	[-133349447] = {
		"lancerevolution9",
		false
	},
	[2034235290] = {
		"mazdarx7",
		false
	},
	[1578851380] = {
		"mazdarx72",
		false
	},
	[-1561625274] = {
		"mclarensenna",
		false
	},
	[-418486680] = {
		"mercedesgt63",
		false
	},
	[-567034757] = {
		"mustangfast",
		false
	},
	[-60313827] = {
		"nissangtr",
		false
	},
	[520007028] = {
		"nissangtr2",
		false
	},
	[682475730] = {
		"nissangtr3",
		false
	},
	[670022011] = {
		"nissangtrnismo",
		false
	},
	[-783406593] = {
		"skyliner34",
		false
	},
	[-1198210135] = {
		"skyliner342",
		false
	},
	[-941271649] = {
		"subaruimpreza",
		false
	},
	[-1055230633] = {
		"subarubrz",
		false
	},
	[723779872] = {
		"toyotasupra",
		false
	},
	[-369887950] = {
		"toyotasupra2",
		false
	},
	[1097072074] = {
		"acuransx",
		false
	},
	[-2019386221] = {
		"golfgti",
		false
	},
	[-1545541884] = {
		"escaladegt900",
		false
	},
	[-2079844462] = {
		"escalade2021",
		false
	},
	[-14947719] = {
		"golfmk7",
		false
	},
	[1939826804] = {
		"jeepcherokee",
		false
	},
	[59283201] = {
		"porsche911",
		false
	},
	[147177933] = {
		"350z",
		false
	},
	[1252481339] = {
		"urbandevil",
		false
	},
	[2088515150] = {
		"bloodline",
		false
	},
	[1724037436] = {
		"shelbygt500",
		false
	},
	[1306282923] = {
		"bmwm1wb",
		false
	},
	[2033687168] = {
		"lamborghinihuracanlw",
		false
	},
	[1146389448] = {
		"panameramansory",
		false
	},
	[-1178021069] = {
		"wheelchair",
		true
	},
	[-1794431517] = {
		"ferrarif40",
		false
	},
	[1298902545] = {
		"astonmartindbs",
		false
	},
	[648600366] = {
		"nissangtr50",
		false
	},
	[1635976772] = {
		"mercedesamg63",
		false
	},
	[1474015055] = {
		"r1",
		false
	},
	[-188978926] = {
		"r6",
		false
	},
	[436874758] = {
		"s1000rr",
		false
	},
	[-180834407] = {
		"mustang1969",
		false
	},
	[-739058151] = {
		"audir8",
		false
	},
	[1676738519] = {
		"audirs6",
		false
	},
	[796209239] = {
		"m8competition",
		false
	},
	[-214867514] = {
		"rangerover",
		false
	},
	[1890188937] = {
		"aventador",
		false
	},
	[-635957277] = {
		"bentleybacalar",
		false
	},
	[236531810] = {
		"bugattiatlantic",
		false
	},
	[-986071517] = {
		"corvettec7",
		false
	},
	[-1805585679] = {
		"mercedesg65",
		false
	},
	[1996710514] = {
		"dog_R1250baby",
		false
	},
	[1945094768] = {
		"f450s",
		false
	},
	[991407206] = {
		"r1250",
		false
	},
	[-1426938578] = {
		"silvia",
		false
	},
	[1119951808] = {
		"720ss",
		false
	},
	[-1331336397] = {
		"bdivo",
		false
	},
	[-688419137] = {
		"hayabusa",
		false
	},
	[-1659548258] = {
		"sianr",
		false
	},
	[-429774847] = {
		"teslax",
		false
	},
	[1744543800] = {
		"z1000",
		false
	},
	[-714386060] = {
		"zx10r",
		false
	},
	[1843114610] = {
		"mbbs20",
		false
	},
	[836213613] = {
		"18performante",
		false
	},
	[117352684] = {
		"dodgetrx",
		false
	},
	[99671692] = {
		"mercxclass",
		false
	},
	[-1176586871] = {
		"miniaranha",
		false
	},
	[1113807501] = {
		"minipepa",
		false
	},
	[1937961905] = {
		"m135iwb",
		false
	},
	[-2033141190] = {
		"rmodbiposto",
		false
	},
	[1784428761] = {
		"rmodjesko",
		false
	},
	[-1273288675] = {
		"rmodlp670",
		false
	},
	[1934093517] = {
		"rmodm5e34",
		false
	},
	[GetHashKey("fmss")] = {
		"fmss",
		false
	},
	[GetHashKey("s1000rr2020")] = {
		"s1000rr2020",
		false
	},
	[GetHashKey("jesko")] = {
		"jesko",
		false
	},
	[GetHashKey("taycan")] = {
		"taycan",
		false
	},
	[GetHashKey("pm19")] = {
		"pm19",
		false
	},
	[GetHashKey("fusca")] = {
		"fusca",
		false
	},
	[GetHashKey("Rpounder")] = {
		"Rpounder",
		false
	},

	-- [GetHashKey("amarokpolicia")] = {
	-- 	"amarokpolicia",
	-- 	false
	-- },
	-- [GetHashKey("amg45")] = {
	-- 	"amg45",
	-- 	false
	-- },
	-- [GetHashKey("mercedesgt")] = {
	-- 	"mercedesgt",
	-- 	false
	-- },
	-- [GetHashKey("mustang19")] = {
	-- 	"mustang19",
	-- 	false
	-- },
	-- [GetHashKey("VRdm1200")] = {
	-- 	"VRdm1200",
	-- 	false
	-- },
	[GetHashKey("rctoystory")] = {
		"rctoystory",
		false
	},
	[GetHashKey("R1200GS")] = {
		"R1200GS",
		false
	},
	[GetHashKey("srad")] = {
		"srad",
		false
	},
	[GetHashKey("z1000")] = {
		"z1000",
		false
	},
	[GetHashKey("formulae19")] = {
		"formulae19",
		false
	},
	[GetHashKey("punto")] = {
		"punto",
		false
	},
	[GetHashKey("cfmotoz10")] = {
		"cfmotoz10",
		false
	},
	[GetHashKey("sf90")] = {
		"sf90",
		false
	},
	[GetHashKey("16challenger")] = {
		"16challenger",
		false
	},
	[GetHashKey("18performante")] = {
		"18performante",
		false
	},
	[GetHashKey("rctoystory")] = {
		"rctoystory",
		false
	},
	[GetHashKey("720ss")] = {
		"720ss",
		false
	},
	[GetHashKey("bdivo")] = {
		"bdivo",
		false
	},
	[GetHashKey("r1250")] = {
		"r1250",
		false
	},
	[GetHashKey("s1000rr2020")] = {
		"s1000rr2020",
		false
	},
	[GetHashKey("dodgetrx")] = {
		"dodgetrx",
		false
	},
	[GetHashKey("fk8hr")] = {
		"fk8hr",
		false
	},
	[GetHashKey("fusca")] = {
		"fusca",
		false
	},
	[GetHashKey("jesko")] = {
		"jesko",
		false
	},
	[GetHashKey("pm19")] = {
		"pm19",
		false
	},
	[GetHashKey("mbbs20")] = {
		"mbbs20",
		false
	},
	[GetHashKey("mercxclass")] = {
		"mercxclass",
		false
	},
	[GetHashKey("miniaranha")] = {
		"miniaranha",
		false
	},
	[GetHashKey("minipepa")] = {
		"minipepa",
		false
	},
	[GetHashKey("fmss")] = {
		"fmss",
		false
	},
	[GetHashKey("pistas")] = {
		"pistas",
		false
	},
	[GetHashKey("taycan")] = {
		"taycan",
		false
	},
	[GetHashKey("q8prior")] = {
		"q8prior",
		false
	},
	[GetHashKey("dog_R1250baby")] = {
		"dog_R1250baby",
		false
	},
	[GetHashKey("pitbull")] = {
		"pitbull",
		false
	},
	[GetHashKey("rmod240sx")] = {
		"rmod240sx",
		false
	},
	[GetHashKey("rmodbiposto")] = {
		"rmodbiposto",
		false
	},
	[GetHashKey("rmodbiposto2")] = {
		"rmodbiposto2",
		false
	},
	[GetHashKey("rmodbolide")] = {
		"rmodbolide",
		false
	},
	[GetHashKey("rmodlp670")] = {
		"rmodlp670",
		false
	},
	[GetHashKey("rmodm5e34")] = {
		"rmodm5e34",
		false
	},
	[GetHashKey("sianr")] = {
		"sianr",
		false
	},
	[GetHashKey("silvia")] = {
		"silvia",
		false
	},
	[GetHashKey("teslax")] = {
		"teslax",
		false
	},
	[GetHashKey("zx10r")] = {
		"zx10r",
		false
	},
	[GetHashKey("ldsv")] = {
		"ldsv",
		false
	},
	[GetHashKey("urus")] = {
		"urus",
		false
	},
	[GetHashKey("rmodmustang")] = {
		"rmodmustang",
		false
	},
	[GetHashKey("emsnspeedo")] = {
		"emsnspeedo",
		false
	},
	[GetHashKey("emsroamer")] = {
		"emsroamer",
		false
	},
	[GetHashKey("f131")] = {
		"f131",
		false
	},
	[GetHashKey("v4sf")] = {
		"v4sf",
		false
	},
	[GetHashKey("mt07")] = {
		"mt07",
		false
	},
	[GetHashKey("mr53")] = {
		"mr53",
		false
	},
	[GetHashKey("r8spyder20")] = {
		"r8spyder20",
		false
	},
	[GetHashKey("rsetrongt21")] = {
		"rsetrongt21",
		false
	},
	[GetHashKey("hotwee")] = {
		"hotwee",
		false
	},
	[GetHashKey("chg")] = {
		"chg",
		false
	},
	[GetHashKey("cb650r")] = {
		"cb650r",
		false
	},
	-- [GetHashKey("gt1967")] = {
	-- 	"gt1967",
	-- 	false
	-- },
	[GetHashKey("oycdefender")] = {
		"oycdefender",
		false
	},
	[GetHashKey("lpchopper")] = {
		"lpchopper",
		false
	},
	[GetHashKey("krust")] = {
		"krust",
		false
	},
	[GetHashKey("lpbagger")] = {
		"lpbagger",
		false
	},
	[GetHashKey("templar")] = {
		"templar",
		false
	},
	[GetHashKey("saltflat")] = {
		"saltflat",
		false
	},
	[GetHashKey("chimerac")] = {
		"chimerac",
		false
	},
	[GetHashKey("overdose")] = {
		"overdose",
		false
	},
	[GetHashKey("bcatctx")] = {
		"bcatctx",
		false
	},
	[GetHashKey("mk1rabbit")] = {
		"mk1rabbit",
		false
	},
	[GetHashKey("nightblade2")] = {
		"nightblade2",
		false
	},
	[GetHashKey("sombrero")] = {
		"sombrero",
		false
	},
	[GetHashKey("hexer2")] = {
		"hexer2",
		false
	},
	[GetHashKey("flhxs_streetglide_special18")] = {
		"flhxs_streetglide_special18",
		false
	},
	[GetHashKey("mvso")] = {
		"mvso",
		false
	},
	[GetHashKey("rmode63s")] = {
		"rmode63s",
		false
	},
	[GetHashKey("Y1700MAX")] = {
		"Y1700MAX",
		false
	},
	[GetHashKey("diavel")] = {
		"diavel",
		false
	},
	[GetHashKey("velociraptor")] = {
		"velociraptor",
		false
	},
	[GetHashKey("vwpasat")] = {
		"vwpasat",
		false
	},
	[GetHashKey("Imola")] = {
		"Imola",
		false
	},		
	[GetHashKey("4runner")] = {
		"4runner",
		false
	},
	[GetHashKey("19ftype")] = {
		"19ftype",
		false
	},
	[GetHashKey("africa")] = {
		"africa",
		false
	},
	[GetHashKey("bnr34")] = {
		"bnr34",
		false
	},
	[GetHashKey("cbb")] = {
		"cbb",
		false
	},
	[GetHashKey("corvettec8")] = {
		"corvettec8",
		false
	},
	[GetHashKey("dm1200_02")] = {
		"dm1200_02",
		false
	},
	[GetHashKey("fxxkevo")] = {
		"fxxkevo",
		false
	},
	[GetHashKey("giuliagta")] = {
		"giuliagta",
		false
	},
	[GetHashKey("h2carb")] = {
		"h2carb",
		false
	},
	[GetHashKey("harleydavidsonfx")] = {
		"harleydavidsonfx",
		false
	},
	[GetHashKey("harleydavidsonrg")] = {
		"harleydavidsonrg",
		false
	},
	-- [GetHashKey("l200")] = {
	-- 	"l200",
	-- 	false
	-- },
	[GetHashKey("bm422pxx2ncs")] = {
		"bm422pxx2ncs",
		false
	},
	[GetHashKey("paredao")] = {
		"paredao",
		false
	},
	[GetHashKey("rmodessenza")] = {
		"rmodessenza",
		false
	},
	[GetHashKey("rmodporsche918")] = {
		"rmodporsche918",
		false
	},
	[GetHashKey("rmodx6")] = {
		"rmodx6",
		false
	},
	[GetHashKey("s10")] = {
		"s10",
		false
	},
	[GetHashKey("patty")] = {
		"patty",
		false
	},
	[GetHashKey("nspeedo")] = {
		"nspeedo",
		false
	},
	[GetHashKey("s10hc")] = {
		"s10hc",
		false
	},
	[GetHashKey("sr1")] = {
		"sr1",
		false
	},
	[GetHashKey("EMSRS6")] = {
		"EMSRS6",
		false
	},	
	[GetHashKey("tenere1200")] = {
		"tenere1200",
		false
	},
	[GetHashKey("tiger1200")] = {
		"tiger1200",
		false
	},
	[GetHashKey("ttrsr19")] = {
		"ttrsr19",
		false
	},
	[GetHashKey("veneno")] = {
		"veneno",
		false
	},
	[GetHashKey("xt660vip")] = {
		"xt660vip",
		false
	},
	[GetHashKey("mercedesclasx")] = {
		"mercedesclasx",
		false
	},
	[GetHashKey("g7cross")] = {
		"g7cross",
		false
	},
	[GetHashKey("amarokreb")] = {
		"amarokreb",
		false
	},
	[1604450211] = {
		"vwtouareg",
		false
	},

	-- Carros Velozes e Furiosos

	[GetHashKey("2f2fmle7")] = {
		"2f2fmle7",
		false
	},
	[GetHashKey("2f2fgts")] = {
		"2f2fgts",
		false
	},	
	[GetHashKey("2f2fgtr34")] = {
		"2f2fgtr34",
		false
	},
	[GetHashKey("fnfrx7")] = {
		"fnfrx7",
		false
	},		
	[GetHashKey("fnfmk4")] = {
		"fnfmk4",
		false
	},
	[GetHashKey("fnfmits")] = {
		"fnfmits",
		false
	},	
	[GetHashKey("ff4wrx")] = {
		"ff4wrx",
		false
	},
	[GetHashKey("fnflan")] = {
		"fnflan",
		false
	},			

	-- Carros Police

	[GetHashKey("WRfrogger")] = {
		"WRfrogger",
		false
	},	
	[GetHashKey("WRflatbed")] = {
		"WRflatbed",
		false
	},	
	[GetHashKey("WRgtr50")] = {
		"WRgtr50",
		false
	},	
	[GetHashKey("WRa45")] = {
		"WRa45",
		false
	},	
	[GetHashKey("WRc7")] = {
		"WRc7",
		false
	},
	[GetHashKey("WRcla")] = {
		"WRcla",
		false
	},
	[GetHashKey("VRxclass")] = {
		"VRxclass",
		false
	},
	[GetHashKey("WRTiger900")] = {
		"WRTiger900",
		false
	},
	[GetHashKey("WRr1200")] = {
		"WRr1200",
		false
	}
};

function tvRP.vehList(radius)
	local vehicle = nil;
	local ped = PlayerPedId();
	if IsPedInAnyVehicle(ped) then
		vehicle = GetVehiclePedIsUsing(ped);
	else
		vehicle = tvRP.nearVehicle(radius);
	end;
	if IsEntityAVehicle(vehicle) then
		local vehNet = VehToNet(vehicle);
		local vehModel = GetEntityModel(vehicle);
		local vehClass = GetVehicleClass(vehicle);
		local vehHealth = GetEntityHealth(vehicle);
		local vehBody = GetVehicleBodyHealth(vehicle);
		local vehEngine = GetVehicleEngineHealth(vehicle);
		local vehPlate = GetVehicleNumberPlateText(vehicle);
		return vehicle, vehNet, vehPlate, vehList[vehModel][1], vehList[vehModel][2], vehHealth, vehClass, vehBody, vehEngine;
	end;
end;
function tvRP.vehSitting()
	local ped = PlayerPedId();
	if IsPedInAnyVehicle(ped) then
		local vehicle = GetVehiclePedIsUsing(ped);
		local vehModel = GetEntityModel(vehicle);
		local vehPlate = GetVehicleNumberPlateText(vehicle);
		local vehNet = VehToNet(vehicle);
		return vehicle, vehNet, vehPlate, vehList[vehModel][1];
	end;
end;
function tvRP.vehicleName()
	local ped = PlayerPedId();
	if IsPedInAnyVehicle(ped) then
		local vehicle = GetVehiclePedIsUsing(ped);
		local vehModel = GetEntityModel(vehicle);
		return vehList[vehModel][1];
	end;
end;
function tvRP.vehicleModel(vehModel)
	return vehList[vehModel][1];
end;
function tvRP.vehicleHash()
	local ped = PlayerPedId();
	if IsPedInAnyVehicle(ped) then
		local vehicle = GetVehiclePedIsUsing(ped);
		return GetEntityModel(vehicle);
	end;
end;
function tvRP.lastVehicle(vehName)
	local ped = PlayerPedId();
	local vehHash = GetHashKey(vehName);
	local vehicle = GetLastDrivenVehicle();
	if IsVehicleModel(vehicle, vehHash) then
		return true;
	end;
	return false;
end;
