-- Data
-- Author: Bluehill
-- DateCreated: 2023-11-16 오후 1:47:54
--------------------------------------------------------------

UPDATE Districts SET Appeal = 1 WHERE DistrictType = 'DISTRICT_AQUEDUCT' OR DistrictType = 'DISTRICT_BATH' OR DistrictType = 'DISTRICT_GOVERNMENT' OR DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER';

INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) SELECT DistrictType, 'Oasis_Gold' FROM Districts WHERE DistrictType = 'DISTRICT_COMMERCIAL_HUB' OR DistrictType IN (SELECT CivUniqueDistrictType FROM DistrictReplaces WHERE ReplacesDistrictType = 'DISTRICT_COMMERCIAL_HUB');
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) SELECT DistrictType, 'LuxuryResource_Gold' FROM Districts WHERE DistrictType = 'DISTRICT_COMMERCIAL_HUB' OR DistrictType IN (SELECT CivUniqueDistrictType FROM DistrictReplaces WHERE ReplacesDistrictType = 'DISTRICT_COMMERCIAL_HUB');
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) SELECT DistrictType, 'Neighborhood_Gold' FROM Districts WHERE DistrictType = 'DISTRICT_COMMERCIAL_HUB' OR DistrictType IN (SELECT CivUniqueDistrictType FROM DistrictReplaces WHERE ReplacesDistrictType = 'DISTRICT_COMMERCIAL_HUB');
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) SELECT DistrictType, 'Mbanza_Gold' FROM Districts WHERE DistrictType = 'DISTRICT_COMMERCIAL_HUB' OR DistrictType IN (SELECT CivUniqueDistrictType FROM DistrictReplaces WHERE ReplacesDistrictType = 'DISTRICT_COMMERCIAL_HUB');

INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES ('DISTRICT_HANSA', 'Suguba_Production');

INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentFeature) VALUES ('Oasis_Gold', 'LOC_DISTRICT_OASIS_GOLD', 'YIELD_GOLD', 2, 1, 'FEATURE_OASIS');
INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentResourceClass) VALUES ('LuxuryResource_Gold', 'LOC_DISTRICT_LUXURYRESOURCE_GOLD', 'YIELD_GOLD', 1, 1, 'RESOURCECLASS_LUXURY');
INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) VALUES ('Neighborhood_Gold', 'LOC_DISTRICT_NEIGHBORHOOD_GOLD', 'YIELD_GOLD', 2, 1, 'DISTRICT_NEIGHBORHOOD');
INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) VALUES ('Mbanza_Gold', 'LOC_DISTRICT_MBANZA_GOLD', 'YIELD_GOLD', 2, 1, 'DISTRICT_MBANZA');
INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) VALUES ('Suguba_Production', 'LOC_DISTRICT_SUGUBA_PRODUCTION', 'YIELD_PRODUCTION', 2, 1, 'DISTRICT_SUGUBA');
