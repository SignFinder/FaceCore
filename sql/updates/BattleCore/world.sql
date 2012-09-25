/* Reload item_template and locales_item command */
DELETE FROM `command` WHERE `name` = 'reload item_template';
INSERT INTO `command` VALUES ('reload item_template', 3, 'Syntax: .reload item_template. Reload item_template and locales_item tables.');