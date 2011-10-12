-- JarGames Announce
REPLACE INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(787, '|cffffff00[|c1f4DF620GameMaster|r |c100FFFF0%s|c1f4DF620 Obwieszcza|cffffff00]:|r %s|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11000, '|cf00FF000[|c100FFFF0JarGames|cf00FF000]: |c1FFFF000%s', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(506333, '|cffffff00[|c1f4DF620Administrator|r |c100FFFF0%s|c1f4DF620 Obwieszcza|cffffff00]:|r %s|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(506334, '|cffffff00[|c1f4DF620GameMaster|r |cffff0000%s|c1f4DF620 Obwieszcza|cffffff00]:|r %s|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- JarGames Commands
INSERT INTO `command` (`name`, `security`, `help`) VALUES
('msg', 2, 'Syntax: .msg $announcement.\nSend an announcement to all online players, displaying the name of the sender.'),
('adm', 4, 'Syntax: .adm $announcement.\nSend an announcement to all online players, displaying the name of the sender.');