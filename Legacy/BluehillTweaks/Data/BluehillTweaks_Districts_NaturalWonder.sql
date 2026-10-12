INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentNaturalWonder) VALUES
	('BT_NaturalWonder_Science', 'LOC_DISTRICT_BT_NATURALWONDER_SCIENCE', 'YIELD_SCIENCE', 2, 1, 1),
	('BT_NaturalWonder_Culture', 'LOC_DISTRICT_BT_NATURALWONDER_CULTURE', 'YIELD_CULTURE', 2, 1, 1),
	('BT_NaturalWonder_Production', 'LOC_DISTRICT_BT_NATURALWONDER_PRODUCTION', 'YIELD_PRODUCTION', 2, 1, 1),
	('BT_NaturalWonder_Gold', 'LOC_DISTRICT_BT_NATURALWONDER_GOLD', 'YIELD_GOLD', 2, 1, 1)
;

INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES
	('DISTRICT_CAMPUS', 'BT_NaturalWonder_Science'),
	('DISTRICT_THEATER', 'BT_NaturalWonder_Culture'),
	('DISTRICT_INDUSTRIAL_ZONE', 'BT_NaturalWonder_Production'),
	('DISTRICT_COMMERCIAL_HUB', 'BT_NaturalWonder_Gold')
;

INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) SELECT CivUniqueDistrictType, 'BT_NaturalWonder_Science' FROM DistrictReplaces WHERE ReplacesDistrictType = 'DISTRICT_CAMPUS';
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) SELECT CivUniqueDistrictType, 'BT_NaturalWonder_Culture' FROM DistrictReplaces WHERE ReplacesDistrictType = 'DISTRICT_THEATER';
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) SELECT CivUniqueDistrictType, 'BT_NaturalWonder_Production' FROM DistrictReplaces WHERE ReplacesDistrictType = 'DISTRICT_INDUSTRIAL_ZONE';
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) SELECT CivUniqueDistrictType, 'BT_NaturalWonder_Gold' FROM DistrictReplaces WHERE ReplacesDistrictType = 'DISTRICT_COMMERCIAL_HUB';

UPDATE Adjacency_YieldChanges SET YieldChange = 2 WHERE ID = 'Pamukkale_Faith';
