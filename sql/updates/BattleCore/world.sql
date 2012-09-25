/* Reload item_template and locales_item command */
DELETE FROM `command` WHERE `name` = 'reload item_template';
INSERT INTO `command` VALUES ('reload item_template', 3, 'Syntax: .reload item_template. Reload item_template and locales_item tables.');

-- Arena Spectator
DELETE FROM `command` WHERE `name` = 'spectate';        
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('spectate', 0, 'Syntax: .spectate $subcommand.\nUse .help spectate');
DELETE FROM `command` WHERE `name` = 'spectate view';    
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('spectate view', 0, 'Syntax: .spectate view #player\nAllow player to spectate arena from anotherplayer.');
DELETE FROM `command` WHERE `name` = 'spectate leave';   
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('spectate leave', 0, 'Syntax: .spectate leave\nDisable spectator mode.');	
DELETE FROM `command` WHERE `name` = 'spectate player'; 	
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('spectate player', 0, 'Syntax: .spectate player #player\nAllow to spectate player.');
DELETE FROM `command` WHERE `name` = 'spectate reset';  
INSERT INTO `command` (`name`, `security`, `help`) VALUES ('spectate reset', 0, 'Syntax: .spectate reset\nSend addon data.');	

UPDATE `gameobject_template` SET `flags` = 36 WHERE `entry` IN (185918, 185917, 183970, 183971, 183972, 183973, 183977, 183979, 183978, 183980);

/* Арена спектатор */
DELETE FROM `creature_template` WHERE entry = 190000; 
INSERT INTO `creature_template` (`entry`, `modelid1`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `Health_mod`, `Mana_mod`, `Armor_mod`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmg_multiplier`, `unit_class`, `unit_flags`, `type`, `type_flags`, `InhabitType`, `RegenHealth`, `flags_extra`, `ScriptName`) VALUES 
(190000, 29348, 'Arena Spectator', 'Use addon!', 'Speak', 50000, 71, 71, 1.56, 1.56, 1.56, 35, 35, 3, 1, 1.14286, 1.25, 1, 1, 1, 2, 7, 138936390, 3, 1, 2, 'npc_arena_spectator');

DELETE FROM `locales_creature` WHERE `entry` = 190000;
INSERT INTO `locales_creature` (`entry`, `name_loc8`, `subname_loc8`) VALUES
(190000, 'Наблюдатели Арены', 'Используйте Аддон!');

/* Запрос к моду "Возможность писать в чат, исходя из проведенного онлайна" */
DELETE FROM `trinity_string` WHERE `entry` = 11019;
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc8`) VALUES
(11019, 'Your chat is disabled. So you can write to chat, draw in the game for another %s seconds', 'Ваш чат отключен. Чтобы вы смогли написать в чат, проведите в игре еще %s секунд');

-- Русификация конечного эвента в Пещерах Стенаний
UPDATE `script_texts` SET `content_loc8` = 'Я должен сделать необходимые приготовления перед тем, как Ритуал Пробуждения начнется. Вы должны защитить меня!' WHERE `entry` = -1043001;
UPDATE `script_texts` SET `content_loc8` = 'Эти пещеры были когда-то храмом, который подавал надежду на возобновление растительности в Степи. Теперь это залы начных кошмаров.' WHERE `entry` = -1043002;
UPDATE `script_texts` SET `content_loc8` = 'Пошлите! Мы должны продолжать. Еще нужно сделать много дел, прежде чем мы сможем вытащить Наралекса из его кошмара.' WHERE `entry` = -1043003;
UPDATE `script_texts` SET `content_loc8` = 'В этом круге огня я должен произнести заклинание, которое должно изгнать духов, убитых Повелителями Змей.' WHERE `entry` = -1043004;
UPDATE `script_texts` SET `content_loc8` = 'Пещеры были очищены. Теперь мы идем к Наралексу!' WHERE `entry` = -1043005;
UPDATE `script_texts` SET `content_loc8` = 'Помимо кошмара, Наралекс заключен в вечный сон. Нужно разбудить его пока не стало слишком поздно!' WHERE `entry` = -1043006;
UPDATE `script_texts` SET `content_loc8` = 'Защищайте меня, Смельчаки! Я буду углубляться в Изумрудный Сон, чтобы спасти Наралекса и положить конец этому!' WHERE `entry` = -1043007;
UPDATE `script_texts` SET `content_loc8` = 'Это Мутанус Пожиратель является главной преградой пробуждения Наралекса! Без сомнений.' WHERE `entry` = -10430012;
UPDATE `script_texts` SET `content_loc8` = 'Ах, я вырвался из страшного кошмара! Я благодарю тебя, мой верный ученик, вместе с храбрым товарищами.' WHERE `entry` = -10430015;
UPDATE `script_texts` SET `content_loc8` = 'Мы должны идти и встретиться с другими учениками. Предстоит сделать много работы, прежде чем я могу сделать еще одну попытку восстановить Степи. Прощайте, Смельчаки!' WHERE `entry` = -10430016;
UPDATE `script_texts` SET `content_loc8` = 'Наконец-то! Наралекса можно пробудить! Ну помогите мне, смелые искатели приключений!' WHERE `entry` = -1043000;
UPDATE `script_texts` SET `content_loc8` = 'Наконец-то! Я пробудился!' WHERE `entry` = -1043013;
UPDATE `script_texts` SET `content_loc8` = '%S начал выполнять Ритуал по пробуждению Наралекса' WHERE `entry` = -1043008;
UPDATE `script_texts` SET `content_loc8` = '%S судорожно метается в кошмарном сне.' WHERE `entry` = -1043009;
UPDATE `script_texts` SET `content_loc8` = '%S корчится в муках. Ученик пытается ему помочь!' WHERE `entry` = -1043010;
UPDATE `script_texts` SET `content_loc8` = '%S увидел ужастное видение. Что-то шевелится под мутной воде.' WHERE `entry` = -1043011;

-- Перевод по квесту 898
UPDATE `script_texts` SET `content_loc8` = 'Будь рядом, $n. Мне понадобится твоя помощь. Возможно мне удастся вырваться отсюда. Пошли!' WHERE `entry` = -1000370;
UPDATE `script_texts` SET `content_loc8` = 'Наконец-то! Северная часовня не охраняется! Мне нужно время, чтобы отдышаться!' WHERE `entry` = -1000371;
UPDATE `script_texts` SET `content_loc8` = 'Теперь я чувствую себя лучше. Давайте вернемся к побегу. Пошли, $n.' WHERE `entry` = -1000372;
UPDATE `script_texts` SET `content_loc8` = 'Похоже, что Флибустьеры Южных морей сильно закрепились на побережье. Это может стать проблемой.' WHERE `entry` = -1000373;
UPDATE `script_texts` SET `content_loc8` = 'Помогай! $C атакуют!' WHERE `entry` = -1000374;
UPDATE `script_texts` SET `content_loc8` = 'Пришло время для мести!' WHERE `entry` = -1000375;
UPDATE `script_texts` SET `content_loc8` = '$C идет прямо на нас!' WHERE `entry` = -1000376;
UPDATE `script_texts` SET `content_loc8` = 'Получай, $C' WHERE `entry` = -1000377;
UPDATE `script_texts` SET `content_loc8` = 'Мы почти добрались! Давай ускоримся...' WHERE `entry` = -1000378;
UPDATE `script_texts` SET `content_loc8` = 'Ах, сладкий воздух побега.' WHERE `entry` = -1000379;
UPDATE `script_texts` SET `content_loc8` = 'Капитан Тало`тас Сияющий, $N помог мне сбежать! $N, я уверен, капитан вознаградит ваше мужество.' WHERE `entry` = -1000380;

-- Фикс квеста 4921 "Пропавшая без вести"
UPDATE `creature_template` SET `npcflag` = 3 WHERE `entry` = 10668;

-- Русификация начальной зоны Рыцарей смерти.
-- Не оффлайк, перевод не точный
-- Если у кого то есть хоть какой-то перевод данной местности, просьба кинуть или в скайп, или в Request.
UPDATE `script_texts` SET `content_loc8` = 'Ты сделал большую ошибку, злодей!' WHERE `entry` = -1609000;
UPDATE `script_texts` SET `content_loc8` = 'Когда-то я был воином Света... Посмотрите, чем я стал...' WHERE `entry` = -1609001;
UPDATE `script_texts` SET `content_loc8` = 'Смерть это единственное лекарство!' WHERE `entry` = -1609016;
UPDATE `script_texts` SET `content_loc8` = 'В бой!' WHERE `entry` IN (1609012, 1609008);
UPDATE `script_texts` SET `content_loc8` = 'Я выиграю свою свободу и оставлю это проклятое место!' WHERE `entry` = -1609005;
UPDATE `script_texts` SET `content_loc8` = 'Нет спасения' WHERE `entry` = -1609080;
UPDATE `script_texts` SET `content_loc8` = 'Запомни этот день, $n, ибо это тот день, когда ты будешь повержен!' WHERE `entry` = -1609081;
UPDATE `script_texts` SET `content_loc8` = 'Не смеши меня.' WHERE `entry` = -1609083;

/* Арена топ тим нпц */
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
('100090', '0', '0', '0', '0', '0', '27164', '0', '0', '0', 'Arena TeamTop', 'wow', '', '0', '59', '61', '0', '35', '35', '1', '1.48', '1.14286', '0.0', '0', '655.0', '663.0', '0', '158', '1.0', '1500', '1900', '1', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.0', '100', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_arena_teamTop', '1');

/* Трансмогрификация */
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, Health_mod, Mana_mod, Armor_mod, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, dmg_multiplier, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, ScriptName) VALUES 
('190001', '28641', "Warpweaver", "Transmogrifier", 'Speak', '50000', 71, 71, 1.56, 1.56, 1.56, 35, 35, 3, 1, 1.14286, 1.25, 1, 1, 1, 2, 7, 138936390, 3, 1, 2, 'npc_transmogrify'); 
INSERT INTO locales_creature VALUES ('190001', '', '', '', '', '', '', '', 'Искажающий пространство', null, null, null, null, null, null, null, 'Трансмогрификатор');
INSERT INTO `gossip_menu` VALUES (51000, 51000);
INSERT INTO npc_text (ID, text0_0, em0_1) VALUES (51000, 'Put in the first slot of bag item, that you want to transmogrify. In the second slot, put item with perfect display.', 0);
INSERT INTO locales_npc_text VALUES ('51000', null, null, null, null, null, null, null, 'Положите в первый слот рюкзака предмет, который вы хотите исказить. Во второй слот предмет, модель которого будет использована для трансмогрификации.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

/* Мастер званий */
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
('100005', '0', '0', '0', '0', '0', '26725', '0', '26725', '0', 'Мастер званий', 'wow', '', '0', '59', '61', '0', '35', '35', '1', '1.48', '1.14286', '0.0', '0', '655.0', '663.0', '0', '158', '1.0', '1500', '1900', '1', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.0', '100', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_title', '1');

/* AC3 */
REPLACE INTO `command` (`name`,`security`,`help`) VALUES ('anticheat global', '2', 'Syntax: .anticheat 
global returns the total amount reports and the average. (top three players)'), ('anticheat player', '2', 
'Syntax: .anticheat player $name returns the players''s total amount of warnings, the average and the 
amount of each cheat type.'), ('anticheat handle', '2', 'Syntax: .anticheat handle [on|off] Turn on/off the 
AntiCheat-Detection .'),
('anticheat delete', '2', 'Syntax: .anticheat delete [deleteall|$name] Deletes the report records of all the players or deletes all the reports of player $name.');