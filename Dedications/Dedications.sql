-- Dedications
-- Author: Bluehill
-- DateCreated: 2023-09-20 오후 8:13:47
--------------------------------------------------------------

UPDATE CommemorationTypes SET MaximumGameEra = 'ERA_RENAISSANCE' WHERE CommemorationType = 'COMMEMORATION_SCIENTIFIC';
UPDATE CommemorationTypes SET MaximumGameEra = 'ERA_RENAISSANCE' WHERE CommemorationType = 'COMMEMORATION_CULTURAL';
UPDATE CommemorationTypes SET MaximumGameEra = 'ERA_MEDIEVAL' WHERE CommemorationType = 'COMMEMORATION_INFRASTRUCTURE';
UPDATE CommemorationTypes SET MaximumGameEra = 'ERA_MEDIEVAL' WHERE CommemorationType = 'COMMEMORATION_RELIGIOUS';
UPDATE Policies_XP1 SET MaximumGameEra = 'ERA_RENAISSANCE' WHERE PolicyType = 'POLICY_FREE_ENQUIRY';
UPDATE Policies_XP1 SET MaximumGameEra = 'ERA_RENAISSANCE' WHERE PolicyType = 'POLICY_MANDALA_STATE';
UPDATE Policies_XP1 SET MaximumGameEra = 'ERA_MEDIEVAL' WHERE PolicyType = 'POLICY_EXODUS_OF_THE_EVANGELISTS';
UPDATE Policies_XP1 SET MaximumGameEra = 'ERA_MEDIEVAL' WHERE PolicyType = 'POLICY_MONUMENTALITY';
