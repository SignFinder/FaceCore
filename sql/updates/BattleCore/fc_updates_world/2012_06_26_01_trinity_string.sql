/* Запрос к моду "Возможность писать в чат, исходя из проведенного онлайна" */

DELETE FROM `trinity_string` WHERE `entry` = 11019;
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc8`) VALUES
(11019, 'Your chat is disabled. So you can write to chat, draw in the game for another %s seconds', 'Ваш чат отключен. Чтобы вы смогли написать в чат, проведите в игре еще %s секунд');