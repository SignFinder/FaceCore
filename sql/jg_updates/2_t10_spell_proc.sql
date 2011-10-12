DELETE FROM `spell_proc_event` WHERE `entry` IN (70799,70808,70723);
INSERT INTO `spell_proc_event`
(`entry`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`procFlags`,`procEx`,`ppmRate`,`CustomChance`,`Cooldown`) VALUES
(70799,0,6,0x00000800,0,0,0,0,0,0,0), -- Priest T10 Healer 4P Bonus
(70808,0,11,0x00000100,0,0,0,2,0,0,0), -- Shaman T10 Restoration 4P Bonus
(70723,0,7,0x00000005,0,0,0,2,0,0,0); -- Druid T10 Balance 4P Bonus