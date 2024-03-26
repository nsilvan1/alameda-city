-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.28-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Copiando dados para a tabela creative.rs_groups: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.rs_groups_banco: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.rs_groups_bau: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.rs_groups_users: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_bank: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_bank_invoices: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_blocks: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_calls: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_casino: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_contacts: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_gallery: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_ifood_orders: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_instagram: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_instagram_followers: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_instagram_likes: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_instagram_notifications: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_instagram_posts: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_olx: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_paypal_transactions: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_tinder: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_tinder_messages: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_tinder_rating: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_tor_messages: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_tor_payments: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_twitter_followers: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_twitter_likes: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_twitter_profiles: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_twitter_tweets: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_uber_trips: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_weazel: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_whatsapp: ~0 rows (aproximadamente)
INSERT INTO `smartphone_whatsapp` (`owner`, `avatarURL`, `read_receipts`) VALUES
	('680-880', NULL, 1);

-- Copiando dados para a tabela creative.smartphone_whatsapp_channels: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_whatsapp_groups: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_whatsapp_messages: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.smartphone_zipzap_messages: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.summerz_accounts: ~2 rows (aproximadamente)
INSERT INTO `summerz_accounts` (`whitelist`, `chars`, `gems`, `premium`, `priority`, `discord`, `steam`) VALUES
	(1, 1, 0, 0, 0, '0', '1100001376ce404'),
	(1, 1, 0, 0, 0, '0', '110000143a4653a');

-- Copiando dados para a tabela creative.summerz_bank: ~2 rows (aproximadamente)
INSERT INTO `summerz_bank` (`id`, `user_id`, `value`, `mode`, `owner`) VALUES
	(324, 324, 2000, 'Private', 1),
	(325, 325, 2000, 'Private', 1);

-- Copiando dados para a tabela creative.summerz_banneds: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.summerz_characters: ~2 rows (aproximadamente)
INSERT INTO `summerz_characters` (`id`, `steam`, `phone`, `serial`, `name`, `name2`, `locate`, `sex`, `blood`, `fines`, `garage`, `prison`, `port`, `deleted`, `paypal`, `bank`, `coins`) VALUES
	(324, '1100001376ce404', '710-667', 'IMH679', 'Bartolomeu', 'Costa', 'Sul', 'M', 3, 0, 5, 0, 0, 0, 0, 12720, 0),
	(325, '110000143a4653a', '680-880', 'EWF083', 'Marrenta', 'Boca Dura', 'Sul', 'F', 2, 0, 5, 0, 0, 0, 0, 43250, 0);

-- Copiando dados para a tabela creative.summerz_chests: ~20 rows (aproximadamente)
INSERT INTO `summerz_chests` (`id`, `name`, `weight`, `perm`, `logs`) VALUES
	(1, 'Mechanic', 250, 'Mechanic', 0),
	(2, 'Yakuza', 275, 'Yakuza', 0),
	(3, 'Chicken', 250, 'Chicken', 0),
	(4, 'Vagos', 250, 'Vagos', 0),
	(5, 'Crips', 250, 'Crips', 0),
	(6, 'Bunker', 400, 'Bunker', 0),
	(7, 'Motoclub', 425, 'Motoclub', 0),
	(8, 'Police', 500, 'Police', 0),
	(9, 'Mafiavinhedo', 250, 'Mafiavinhedo', 0),
	(10, 'Ballas', 250, 'Ballas', 0),
	(11, 'trayShot', 20, 'trayShot', 0),
	(12, 'trayPops', 20, 'trayPops', 0),
	(13, 'Burgershot', 250, 'Burgershot', 0),
	(14, 'Paramedic', 250, 'Paramedic', 0),
	(15, 'Obey', 250, 'Obey', 0),
	(16, 'BurgershotGeladeira', 225, 'Burgershot', 0),
	(17, 'Mansao1', 500, 'Mansao1', 0),
	(18, 'trayShot1', 20, 'trayShot1', 0),
	(19, 'trayShot2', 20, 'trayShot2', 0),
	(20, 'trayShot3', 20, 'trayShot3', 0);

-- Copiando dados para a tabela creative.summerz_entitydata: ~0 rows (aproximadamente)
INSERT INTO `summerz_entitydata` (`dkey`, `dvalue`) VALUES
	('custom:324:taxi', '{"extras":[0,0,0,0,1,1,0,0,0,0,0,0],"wheeltype":3,"dashColour":0,"var":{"24":false,"23":false},"interColour":0,"colors":[88,77],"liverys":-1,"plateIndex":1,"mods":{"1":-1,"2":-1,"3":-1,"4":-1,"5":-1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":3,"12":2,"13":2,"14":-1,"15":3,"16":-1,"17":false,"18":1,"19":false,"20":false,"21":false,"22":1,"23":35,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"0":-1},"platestyle":1,"lights":[255,0,255],"neon":{"1":false,"2":false,"3":false,"0":false},"tint":1,"smokecolor":[255,255,255],"xenonColor":0,"extracolors":[5,156]}'),
	('custom:325:g7cross', '{"mods":{"1":-1,"2":-1,"3":-1,"4":-1,"5":1,"6":-1,"7":-1,"8":-1,"9":-1,"10":-1,"11":-1,"12":-1,"13":-1,"14":28,"15":-1,"16":-1,"17":false,"18":false,"19":false,"20":false,"21":false,"22":1,"23":-1,"24":-1,"25":-1,"26":-1,"27":-1,"28":-1,"29":-1,"30":-1,"31":-1,"32":-1,"33":-1,"34":-1,"35":-1,"36":-1,"37":-1,"38":-1,"39":-1,"40":-1,"41":-1,"42":-1,"43":-1,"44":-1,"45":-1,"46":-1,"47":-1,"48":-1,"0":-1},"extracolors":[117,88],"tint":3,"interColour":0,"platestyle":0,"var":{"24":false,"23":false},"dashColour":0,"plateIndex":0,"colors":[35,27],"extras":[0,0,0,0,0,0,0,0,0,0,0,0],"wheeltype":1,"lights":[255,50,100],"liverys":-1,"neon":{"1":1,"2":1,"3":1,"0":1},"xenonColor":10,"smokecolor":[255,255,255]}');

-- Copiando dados para a tabela creative.summerz_fidentity: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.summerz_playerdata: ~10 rows (aproximadamente)
INSERT INTO `summerz_playerdata` (`user_id`, `dkey`, `dvalue`) VALUES
	(324, 'Barbershop', '[0,100,24,76,0,12,0,15,21,29,60,0,0,0,0,0,0,30,10,28,3,10,28,null,2,23,0,0,0,0,0,0,0,0,0,0,0,0,0,0,19]'),
	(324, 'Clothings', '{"watch":{"texture":0,"item":-1},"backpack":{"texture":0,"item":0},"mask":{"texture":0,"item":0},"glass":{"texture":0,"item":0},"vest":{"texture":0,"item":0},"ear":{"texture":0,"item":-1},"decals":{"texture":0,"item":0},"torso":{"texture":13,"item":1},"hat":{"texture":0,"item":-1},"pants":{"texture":9,"item":87},"shoes":{"texture":12,"item":6},"tshirt":{"texture":0,"item":15},"accessory":{"texture":0,"item":0},"bracelet":{"texture":0,"item":-1},"arms":{"texture":0,"item":0}}'),
	(324, 'Datatable', '{"health":200,"inventory":{"9":{"amount":4,"item":"floppy"},"8":{"amount":1,"item":"vehkey-26VFK305"},"6":{"amount":1,"item":"ominitrix"},"5":{"amount":1,"item":"winner"},"4":{"amount":4500,"item":"dollars2"},"3":{"amount":4,"item":"credential"},"2":{"amount":1,"item":"identity-324"},"1":{"amount":103,"item":"WEAPON_PISTOL_AMMO"},"11":{"amount":3,"item":"switch"},"10":{"amount":1,"item":"vehkey-69WHY705"},"13":{"amount":5000,"item":"fichas"},"14":{"amount":1,"item":"teddy"}},"stress":0,"armour":90,"thirst":60,"hunger":60,"skin":1885233650,"experience":0,"salary":110000,"oxigen":100,"perm":{"Admin":true,"Premium":true},"weight":120,"position":{"z":29.35,"y":-996.02,"x":158.76}}'),
	(324, 'Tatuagens', '{"FM_Tat_M_001":["multiplayer_overlays"],"MP_Smuggler_Tattoo_003_M":["mpsmuggler_overlays"],"MP_LR_Tat_002_M":["mplowrider_overlays"],"MP_LR_Tat_033_M":["mplowrider_overlays"],"FM_Tat_M_036":["multiplayer_overlays"],"MP_Buis_M_Neck_000":["mpbusiness_overlays"],"MP_LR_Tat_000_M":["mplowrider2_overlays"],"MP_Buis_M_Neck_003":["mpbusiness_overlays"],"FM_Tat_M_037":["multiplayer_overlays"],"FM_Hip_M_Tat_023":["mphipster_overlays"],"MP_Xmas2_M_Tat_020":["mpchristmas2_overlays"],"MP_LR_Tat_030_M":["mplowrider2_overlays"]}'),
	(324, 'weaponAmmos', '[]'),
	(324, 'weaponAttachs', '[]'),
	(325, 'Barbershop', '[4,0,0,80,0,0,0,0,74,0,0,37,7,0,1,10,18,2,10,41,0,0,0,null,8,20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21]'),
	(325, 'Clothings', '{"hat":{"texture":0,"item":-1},"backpack":{"texture":0,"item":0},"watch":{"texture":0,"item":-1},"arms":{"texture":0,"item":0},"decals":{"texture":0,"item":0},"torso":{"texture":13,"item":1},"mask":{"texture":0,"item":0},"shoes":{"texture":10,"item":10},"vest":{"texture":0,"item":0},"tshirt":{"texture":0,"item":15},"ear":{"texture":0,"item":-1},"accessory":{"texture":0,"item":0},"glass":{"texture":0,"item":0},"pants":{"texture":9,"item":87},"bracelet":{"texture":0,"item":-1}}'),
	(325, 'Datatable', '{"hunger":99,"oxigen":100,"experience":0,"thirst":99,"skin":-1667301416,"inventory":{"1":{"item":"fichas","amount":25000},"4":{"item":"coins","amount":449},"5":{"item":"dollars2","amount":8293},"2":{"item":"pouch","amount":8},"3":{"item":"dollars","amount":13181},"8":{"item":"identity-325","amount":1},"9":{"item":"water","amount":5},"6":{"item":"cellphone-1696630939","amount":1},"7":{"item":"backpack","amount":3}},"stress":0,"perm":{"Admin":true,"Premium":true},"armour":100,"weight":30,"salary":20000,"position":{"x":-1589.78,"y":-568.25,"z":116.26},"health":200}'),
	(325, 'Tatuagens', '{"FM_Tat_F_001":["multiplayer_overlays"],"MP_LR_Tat_008_F":["mplowrider2_overlays"],"MP_MP_Stunt_tat_036_F":["mpstunt_overlays"],"MP_Christmas2017_Tattoo_004_F":["mpchristmas2017_overlays"],"MP_MP_Biker_Tat_038_F":["mpbiker_overlays"],"MP_Xmas2_F_Tat_018":["mpchristmas2_overlays"]}');

-- Copiando dados para a tabela creative.summerz_prison: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.summerz_propertys: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.summerz_races: ~0 rows (aproximadamente)
INSERT INTO `summerz_races` (`id`, `raceid`, `user_id`, `name`, `vehicle`, `points`) VALUES
	(40, 1, 324, 'Bartolomeu Costa', 'Koenigsegg Jesko', 285862);

-- Copiando dados para a tabela creative.summerz_user_jobs: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.summerz_vehicles: ~10 rows (aproximadamente)
INSERT INTO `summerz_vehicles` (`user_id`, `vehicle`, `tax`, `plate`, `rental`, `rendays`, `arrest`, `engine`, `body`, `fuel`, `nitro`, `work`, `doors`, `windows`, `tyres`) VALUES
	(324, 'bifta', 1701200297, '02BSK900', 0, 0, 0, 998, 998, 77, 0, 'true', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(324, 'bmx', 1701200298, '95VTV838', 0, 0, 0, 1000, 1000, 0, 0, 'true', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":true,"2":true,"3":true,"4":false,"5":true,"6":false,"7":false,"0":false}'),
	(324, 's1000rr2020', 1701200296, '61REJ798', 1699223822, 0, 0, 1000, 1000, 95, 0, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":true,"2":true,"3":true,"4":false,"5":true,"6":false,"7":false,"0":false}'),
	(324, 'taxi', 1701200299, '45CSS279', 0, 0, 0, 1000, 1000, 56, 0, 'true', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":1,"3":1,"4":false,"5":false,"0":1}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(324, 'velum2', 1701200300, '41YRQ233', 0, 0, 0, 990, 989, 83, 0, 'true', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":false,"3":1,"4":false,"5":false,"0":1}', '{"1":true,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(325, 'bmx', 1699980897, '52WKI213', 0, 0, 0, 1000, 1000, 0, 0, 'true', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":true,"2":true,"3":true,"4":false,"5":true,"6":false,"7":false,"0":false}'),
	(325, 'g7cross', 1699980902, '87JIX190', 1699224380, 0, 0, 1000, 1000, 50, 0, 'false', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(325, 'stockade', 1699980899, '39OSS219', 0, 0, 0, 1000, 1000, 65, 0, 'true', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":false,"3":false,"4":false,"5":false,"0":1}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(325, 'supervolito2', 1697995376, '23BIW030', 0, 0, 0, 250, 100, 46, 0, 'true', '{"1":1,"2":1,"3":1,"4":false,"5":false,"0":1}', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}'),
	(325, 'velum2', 1699980900, '45DLV940', 0, 0, 0, 974, 987, 65, 0, 'true', '{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false}', '{"1":1,"2":false,"3":1,"4":false,"5":false,"0":1}', '{"1":true,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":false}');

-- Copiando dados para a tabela creative.uf_appointaments: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.uf_daily: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.uf_rankup: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.vehicles: ~0 rows (aproximadamente)

-- Copiando dados para a tabela creative.warehouse: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
