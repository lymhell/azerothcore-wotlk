-- DB update 2017_02_03_34 -> 2017_02_03_35
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2017_02_03_34 2017_02_03_35 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1485433317271478300'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--
INSERT INTO version_db_world (`sql_rev`) VALUES ('1485433317271478300');
-- Durkot Wolfbrother -- http://wotlk.openwow.com/npc=26044
SET @MAXGUID := 911; 
SET @SCRIPTID := 12556600;
DELETE FROM `waypoint_scripts` WHERE `id` IN (@SCRIPTID+0);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES 
(@SCRIPTID+0, 2, 15, 68442, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCRIPTID+0, 10, 1, 1, 0, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCRIPTID+0, 18, 14, 68442, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1));

SET @NPC := 125566;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `delay`, `action`, `orientation`) VALUES
(@PATH, 1, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 2, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 3, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 4, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 5, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 6, 2791.75, 6244.01, 84.6092, 22000, @SCRIPTID, 0.717889),
(@PATH, 7, 2786.42, 6245.35, 84.3805, 0, 0, 2.43222),
(@PATH, 8, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 9, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 10, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 11, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 12, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 13, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 14, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 15, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 16, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 17, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 18, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 19, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 20, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 21, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 22, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 23, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 24, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 25, 2775.46, 6252.13, 83.9431, 22000, @SCRIPTID, 3.87735),
(@PATH, 26, 2780.02, 6251.43, 84.0246, 0, 0, 5.66806),
(@PATH, 27, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 28, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 29, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 30, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 31, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 32, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 33, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 34, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 35, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 36, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 37, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 38, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 39, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 40, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 41, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 42, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 43, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 44, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026),
(@PATH, 45, 2788.16, 6243.06, 84.4932, 5000, 0, 5.38473),
(@PATH, 46, 2773.72, 6258.83, 83.6357, 5000, 0, 2.29026);

UPDATE `waypoint_data` SET `action_chance`=100 WHERE `action` IN (@SCRIPTID);--
-- END UPDATING QUERIES
--
COMMIT;
END;
//
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
