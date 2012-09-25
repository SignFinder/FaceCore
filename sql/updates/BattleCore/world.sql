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

/* ����� ��������� */
DELETE FROM `creature_template` WHERE entry = 190000; 
INSERT INTO `creature_template` (`entry`, `modelid1`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `Health_mod`, `Mana_mod`, `Armor_mod`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmg_multiplier`, `unit_class`, `unit_flags`, `type`, `type_flags`, `InhabitType`, `RegenHealth`, `flags_extra`, `ScriptName`) VALUES 
(190000, 29348, 'Arena Spectator', 'Use addon!', 'Speak', 50000, 71, 71, 1.56, 1.56, 1.56, 35, 35, 3, 1, 1.14286, 1.25, 1, 1, 1, 2, 7, 138936390, 3, 1, 2, 'npc_arena_spectator');

DELETE FROM `locales_creature` WHERE `entry` = 190000;
INSERT INTO `locales_creature` (`entry`, `name_loc8`, `subname_loc8`) VALUES
(190000, '����������� �����', '����������� �����!');

/* ������ � ���� "����������� ������ � ���, ������ �� ������������ �������" */
DELETE FROM `trinity_string` WHERE `entry` = 11019;
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc8`) VALUES
(11019, 'Your chat is disabled. So you can write to chat, draw in the game for another %s seconds', '��� ��� ��������. ����� �� ������ �������� � ���, ��������� � ���� ��� %s ������');

-- ����������� ��������� ������ � ������� ��������
UPDATE `script_texts` SET `content_loc8` = '� ������ ������� ����������� ������������� ����� ���, ��� ������ ����������� ��������. �� ������ �������� ����!' WHERE `entry` = -1043001;
UPDATE `script_texts` SET `content_loc8` = '��� ������ ���� �����-�� ������, ������� ������� ������� �� ������������� �������������� � �����. ������ ��� ���� ������ ��������.' WHERE `entry` = -1043002;
UPDATE `script_texts` SET `content_loc8` = '�������! �� ������ ����������. ��� ����� ������� ����� ���, ������ ��� �� ������ �������� ��������� �� ��� �������.' WHERE `entry` = -1043003;
UPDATE `script_texts` SET `content_loc8` = '� ���� ����� ���� � ������ ���������� ����������, ������� ������ ������� �����, ������ ������������ ����.' WHERE `entry` = -1043004;
UPDATE `script_texts` SET `content_loc8` = '������ ���� �������. ������ �� ���� � ���������!' WHERE `entry` = -1043005;
UPDATE `script_texts` SET `content_loc8` = '������ �������, �������� �������� � ������ ���. ����� ��������� ��� ���� �� ����� ������� ������!' WHERE `entry` = -1043006;
UPDATE `script_texts` SET `content_loc8` = '��������� ����, ���������! � ���� ����������� � ���������� ���, ����� ������ ��������� � �������� ����� �����!' WHERE `entry` = -1043007;
UPDATE `script_texts` SET `content_loc8` = '��� ������� ���������� �������� ������� ��������� ����������� ���������! ��� ��������.' WHERE `entry` = -10430012;
UPDATE `script_texts` SET `content_loc8` = '��, � �������� �� ��������� �������! � ��������� ����, ��� ������ ������, ������ � ������� ����������.' WHERE `entry` = -10430015;
UPDATE `script_texts` SET `content_loc8` = '�� ������ ���� � ����������� � ������� ���������. ��������� ������� ����� ������, ������ ��� � ���� ������� ��� ���� ������� ������������ �����. ��������, ���������!' WHERE `entry` = -10430016;
UPDATE `script_texts` SET `content_loc8` = '�������-��! ��������� ����� ���������! �� �������� ���, ������ �������� �����������!' WHERE `entry` = -1043000;
UPDATE `script_texts` SET `content_loc8` = '�������-��! � ����������!' WHERE `entry` = -1043013;
UPDATE `script_texts` SET `content_loc8` = '%S ����� ��������� ������ �� ����������� ���������' WHERE `entry` = -1043008;
UPDATE `script_texts` SET `content_loc8` = '%S ��������� �������� � ��������� ���.' WHERE `entry` = -1043009;
UPDATE `script_texts` SET `content_loc8` = '%S �������� � �����. ������ �������� ��� ������!' WHERE `entry` = -1043010;
UPDATE `script_texts` SET `content_loc8` = '%S ������ �������� �������. ���-�� ��������� ��� ������ ����.' WHERE `entry` = -1043011;

-- ������� �� ������ 898
UPDATE `script_texts` SET `content_loc8` = '���� �����, $n. ��� ����������� ���� ������. �������� ��� ������� ��������� ������. �����!' WHERE `entry` = -1000370;
UPDATE `script_texts` SET `content_loc8` = '�������-��! �������� ������� �� ����������! ��� ����� �����, ����� ����������!' WHERE `entry` = -1000371;
UPDATE `script_texts` SET `content_loc8` = '������ � �������� ���� �����. ������� �������� � ������. �����, $n.' WHERE `entry` = -1000372;
UPDATE `script_texts` SET `content_loc8` = '������, ��� ����������� ����� ����� ������ ����������� �� ���������. ��� ����� ����� ���������.' WHERE `entry` = -1000373;
UPDATE `script_texts` SET `content_loc8` = '�������! $C �������!' WHERE `entry` = -1000374;
UPDATE `script_texts` SET `content_loc8` = '������ ����� ��� �����!' WHERE `entry` = -1000375;
UPDATE `script_texts` SET `content_loc8` = '$C ���� ����� �� ���!' WHERE `entry` = -1000376;
UPDATE `script_texts` SET `content_loc8` = '�������, $C' WHERE `entry` = -1000377;
UPDATE `script_texts` SET `content_loc8` = '�� ����� ���������! ����� ���������...' WHERE `entry` = -1000378;
UPDATE `script_texts` SET `content_loc8` = '��, ������� ������ ������.' WHERE `entry` = -1000379;
UPDATE `script_texts` SET `content_loc8` = '������� ����`��� �������, $N ����� ��� �������! $N, � ������, ������� ����������� ���� ��������.' WHERE `entry` = -1000380;

-- ���� ������ 4921 "��������� ��� �����"
UPDATE `creature_template` SET `npcflag` = 3 WHERE `entry` = 10668;

-- ����������� ��������� ���� ������� ������.
-- �� �������, ������� �� ������
-- ���� � ���� �� ���� ���� �����-�� ������� ������ ���������, ������� ������ ��� � �����, ��� � Request.
UPDATE `script_texts` SET `content_loc8` = '�� ������ ������� ������, ������!' WHERE `entry` = -1609000;
UPDATE `script_texts` SET `content_loc8` = '�����-�� � ��� ������ �����... ����������, ��� � ����...' WHERE `entry` = -1609001;
UPDATE `script_texts` SET `content_loc8` = '������ ��� ������������ ���������!' WHERE `entry` = -1609016;
UPDATE `script_texts` SET `content_loc8` = '� ���!' WHERE `entry` IN (1609012, 1609008);
UPDATE `script_texts` SET `content_loc8` = '� ������� ���� ������� � ������� ��� ��������� �����!' WHERE `entry` = -1609005;
UPDATE `script_texts` SET `content_loc8` = '��� ��������' WHERE `entry` = -1609080;
UPDATE `script_texts` SET `content_loc8` = '������� ���� ����, $n, ��� ��� ��� ����, ����� �� ������ ��������!' WHERE `entry` = -1609081;
UPDATE `script_texts` SET `content_loc8` = '�� ����� ����.' WHERE `entry` = -1609083;

/* ����� ��� ��� ��� */
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
('100090', '0', '0', '0', '0', '0', '27164', '0', '0', '0', 'Arena TeamTop', 'wow', '', '0', '59', '61', '0', '35', '35', '1', '1.48', '1.14286', '0.0', '0', '655.0', '663.0', '0', '158', '1.0', '1500', '1900', '1', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.0', '100', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_arena_teamTop', '1');

/* ����������������� */
INSERT INTO creature_template (entry, modelid1, name, subname, IconName, gossip_menu_id, minlevel, maxlevel, Health_mod, Mana_mod, Armor_mod, faction_A, faction_H, npcflag, speed_walk, speed_run, scale, rank, dmg_multiplier, unit_class, unit_flags, type, type_flags, InhabitType, RegenHealth, flags_extra, ScriptName) VALUES 
('190001', '28641', "Warpweaver", "Transmogrifier", 'Speak', '50000', 71, 71, 1.56, 1.56, 1.56, 35, 35, 3, 1, 1.14286, 1.25, 1, 1, 1, 2, 7, 138936390, 3, 1, 2, 'npc_transmogrify'); 
INSERT INTO locales_creature VALUES ('190001', '', '', '', '', '', '', '', '���������� ������������', null, null, null, null, null, null, null, '�����������������');
INSERT INTO `gossip_menu` VALUES (51000, 51000);
INSERT INTO npc_text (ID, text0_0, em0_1) VALUES (51000, 'Put in the first slot of bag item, that you want to transmogrify. In the second slot, put item with perfect display.', 0);
INSERT INTO locales_npc_text VALUES ('51000', null, null, null, null, null, null, null, '�������� � ������ ���� ������� �������, ������� �� ������ ��������. �� ������ ���� �������, ������ �������� ����� ������������ ��� �����������������.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

/* ������ ������ */
REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Health_mod`, `Mana_mod`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `WDBVerified`) VALUES
('100005', '0', '0', '0', '0', '0', '26725', '0', '26725', '0', '������ ������', 'wow', '', '0', '59', '61', '0', '35', '35', '1', '1.48', '1.14286', '0.0', '0', '655.0', '663.0', '0', '158', '1.0', '1500', '1900', '1', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.0', '100', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '1', '3', '1.0', '1.0', '1.0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', 'npc_title', '1');

/* AC3 */
REPLACE INTO `command` (`name`,`security`,`help`) VALUES ('anticheat global', '2', 'Syntax: .anticheat 
global returns the total amount reports and the average. (top three players)'), ('anticheat player', '2', 
'Syntax: .anticheat player $name returns the players''s total amount of warnings, the average and the 
amount of each cheat type.'), ('anticheat handle', '2', 'Syntax: .anticheat handle [on|off] Turn on/off the 
AntiCheat-Detection .'),
('anticheat delete', '2', 'Syntax: .anticheat delete [deleteall|$name] Deletes the report records of all the players or deletes all the reports of player $name.');