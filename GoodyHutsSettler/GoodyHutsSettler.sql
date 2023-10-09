-- GoodyHutsSettler
-- Author: Bluehill
-- DateCreated: 2023-10-07 오후 6:08:56
--------------------------------------------------------------

UPDATE GoodyHutSubTypes SET Weight = 30 WHERE SubTypeGoodyHut = 'GOODYHUT_ADD_POP';
UPDATE GoodyHutSubTypes SET Weight = 35 WHERE SubTypeGoodyHut = 'GOODYHUT_GRANT_BUILDER';
UPDATE GoodyHutSubTypes SET Weight = 25 WHERE SubTypeGoodyHut = 'GOODYHUT_GRANT_TRADER';
UPDATE GoodyHutSubTypes SET Weight = 10 WHERE SubTypeGoodyHut = 'GOODYHUT_GRANT_SETTLER';
UPDATE Modifiers SET SubjectRequirementSetId = 'PLAYER_IS_HUMAN' WHERE ModifierId = 'GOODY_SURVIVORS_GRANT_SETTLER';
