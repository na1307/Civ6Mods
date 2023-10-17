-- Data
-- Author: Bluehill
-- DateCreated: 2023-10-16 오후 4:40:55
--------------------------------------------------------------

DELETE FROM Government_SlotCounts;

--Tier0
INSERT INTO Government_SlotCounts (GovernmentType, GovernmentSlotType, NumSlots) VALUES ('GOVERNMENT_CHIEFDOM', 'SLOT_WILDCARD', 2);

--Tier1
INSERT INTO Government_SlotCounts (GovernmentType, GovernmentSlotType, NumSlots) SELECT GovernmentType, 'SLOT_WILDCARD', 4 FROM Governments WHERE Tier = 'Tier1';

--Tier2
INSERT INTO Government_SlotCounts (GovernmentType, GovernmentSlotType, NumSlots) SELECT GovernmentType, 'SLOT_WILDCARD', 6 FROM Governments WHERE Tier = 'Tier2';

--Tier3
INSERT INTO Government_SlotCounts (GovernmentType, GovernmentSlotType, NumSlots) SELECT GovernmentType, 'SLOT_WILDCARD', 8 FROM Governments WHERE Tier = 'Tier3';

--Tier4
INSERT INTO Government_SlotCounts (GovernmentType, GovernmentSlotType, NumSlots) SELECT GovernmentType, 'SLOT_WILDCARD', 10 FROM Governments WHERE Tier = 'Tier4';

--ModifierArguments
UPDATE ModifierArguments SET Value = 'SLOT_WILDCARD' WHERE Name = 'GovernmentSlotType';
