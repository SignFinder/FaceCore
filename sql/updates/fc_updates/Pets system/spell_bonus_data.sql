-- Spell bonus data

DELETE FROM `spell_bonus_data` WHERE entry IN (51963);
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
    -- Gargoyle Strike
    (51963, 0, 0, 0.33, 0,'Gargoyle Strike');

DELETE FROM `spell_bonus_data` WHERE `entry` IN (47468, 47481);
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
    (47468, 0, 0, 1.5, 0, 'Claw (Rank 1) - DK pet'),
    (47481, 0, 0, 0.12, 0, 'Gnaw (Rank 1) - DK pet');

DELETE FROM `spell_bonus_data` WHERE `entry` IN (34889,58604,24640,24844,50519,55749,59881,56626,50274,61193,35387,54644,57386,50541,50479,50871,54706,50271,50245,26090,50256,17253,16827,49966,24423,54680,35290,50518,50433);
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `comments`) VALUES
    -- Hunter Pet Ability AP scaling
    (34889, 0, 0, 0.0143, 'Hunter Pet - Fire breath'),
    (58604, 0, 0, 0.0429, 'Hunter Pet - Lava breath'),
    (24640, 0, 0, 0.0143, 'Hunter Pet - Scorpid poison'),
    (24844, 0, 0, 0.0429, 'Hunter Pet - Lightning Breath'),
    (50519, 0, 0, 0.0429, 'Hunter Pet - Sonic Blast'),
    (55749, 0, 0, 0.0429, 'Hunter Pet - Acid Spit'),
    (59881, 0, 0, 0.0175, 'Hunter Pet - Rake'),
    (56626, 0, 0, 0.049, 'Hunter Pet - Sting'),
    (50274, 0, 0, 0.0143, 'Hunter Pet - Spore Cloud'),
    (61193, 0, 0, 0.04, 'Hunter Pet - Spirit Strike'),
    (35387, 0, 0, 0.010725, 'Hunter Pet - Poison Spit'),
    (54644, 0, 0, 0.0429, 'Hunter Pet - Froststorm Breath'),
    (57386, 0, 0, 0.0429, 'Hunter Pet - Stampede'),
    (50541, 0, 0, 0.07, 'Hunter Pet - Snatch'),
    (50479, 0, 0, 0.0429, 'Hunter Pet - Nether Shock'),
    (50871, 0, 0, 0.0175, 'Hunter Pet - Savage Rend'),
    (54706, 0, 0, 0.010725, 'Hunter Pet - Venom Web Spray'),
    (50271, 0, 0, 0.0429, 'Hunter Pet - Tendon Rip'),
    (50245, 0, 0, 0.0175, 'Hunter Pet - Pin'),
    (26090, 0, 0, 0.0429, 'Hunter Pet - Thunderstomp'),
    (50256, 0, 0, 0.08, 'Hunter Pet - Swipe'),
    (17253, 0, 0, 0.08, 'Hunter Pet - Bite'),
    (16827, 0, 0, 0.08, 'Hunter Pet - Claw'),
    (49966, 0, 0, 0.08, 'Hunter Pet - Smack'),
    (24423, 0, 0, 0.08, 'Hunter Pet - Demoralizing Screech'),
    (54680, 0, 0, 0.08, 'Hunter Pet - Monstrous Bite'),
    (35290, 0, 0, 0.08, 'Hunter Pet - Gore'),
    (50518, 0, 0, 0.08, 'Hunter Pet - Ravage'),
    (50433, 0, 0, 0.08, 'Hunter Pet - Bad Attitude');