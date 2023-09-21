-- DistrictsBuildings
-- Author: Bluehill
-- DateCreated: 2023-09-20 오후 7:46:52
--------------------------------------------------------------

UPDATE Districts SET PrereqCivic = 'CIVIC_POLITICAL_PHILOSOPHY' WHERE DistrictType = 'DISTRICT_GOVERNMENT';
UPDATE Districts SET PrereqTech = NULL WHERE DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER';
UPDATE Districts SET PrereqCivic = 'CIVIC_CIVIL_SERVICE' WHERE DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER';
UPDATE Buildings SET PrereqTech = NULL WHERE BuildingType = 'BUILDING_CONSULATE';
UPDATE Buildings SET PrereqCivic = 'CIVIC_CIVIL_SERVICE' WHERE BuildingType = 'BUILDING_CONSULATE';
