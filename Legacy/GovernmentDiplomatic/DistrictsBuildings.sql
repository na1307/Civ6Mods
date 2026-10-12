-- DistrictsBuildings
-- Author: Bluehill
-- DateCreated: 2023-09-20 오후 7:46:52
--------------------------------------------------------------

UPDATE Districts SET PrereqCivic = 'CIVIC_POLITICAL_PHILOSOPHY' WHERE DistrictType = 'DISTRICT_GOVERNMENT';

UPDATE Districts SET PrereqTech = NULL, PrereqCivic = 'CIVIC_CIVIL_SERVICE' WHERE DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER';

UPDATE Buildings SET PrereqTech = NULL, PrereqCivic = 'CIVIC_CIVIL_SERVICE' WHERE BuildingType = 'BUILDING_CONSULATE';

UPDATE StartingBuildings SET Era = 'ERA_MODERN' WHERE Building = 'BUILDING_CONSULATE';

UPDATE Modifiers SET SubjectRequirementSetId = NULL WHERE ModifierId = 'DIPLOMATIC_QUARTER_AWARD_ONE_INFLUENCE_TOKEN';

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('CONSULATE_AWARD_ONE_INFLUENCE_TOKEN', 'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN'), ('CHANCERY_AWARD_ONE_INFLUENCE_TOKEN', 'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('CONSULATE_AWARD_ONE_INFLUENCE_TOKEN', 'Amount', '1'),  ('CHANCERY_AWARD_ONE_INFLUENCE_TOKEN', 'Amount', '1');

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_CONSULATE', 'CONSULATE_AWARD_ONE_INFLUENCE_TOKEN'), ('BUILDING_CHANCERY', 'CHANCERY_AWARD_ONE_INFLUENCE_TOKEN');

DELETE FROM Modifiers WHERE ModifierId = 'CHANCERY_COUNTERYSPY_SCIENCE';

DELETE FROM BuildingModifiers WHERE ModifierId = 'CHANCERY_COUNTERYSPY_SCIENCE';

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) SELECT 'CHANCERY_COUNTERYSPY_SCIENCE_' || substr(EraType, 5), 'MODIFIER_PLAYER_ADJUST_COUNTER_SPY_AWARD_YIELD_PER_LEVEL', 'PLAYER_AT_LEAST_' || substr(EraType, 5) || '_ERA' FROM Eras WHERE ChronologyIndex >= 4;

INSERT INTO ModifierArguments (ModifierId, Name, Value) SELECT 'CHANCERY_COUNTERYSPY_SCIENCE_' || substr(EraType, 5), 'YieldType', 'YIELD_SCIENCE' FROM Eras WHERE ChronologyIndex >= 4;
INSERT INTO ModifierArguments (ModifierId, Name, Value) SELECT 'CHANCERY_COUNTERYSPY_SCIENCE_' || substr(EraType, 5), 'Amount', '50' FROM Eras WHERE ChronologyIndex >= 4;
INSERT INTO ModifierArguments (ModifierId, Name, Value) SELECT 'CHANCERY_COUNTERYSPY_SCIENCE_' || substr(EraType, 5), 'PerXLevels', '1' FROM Eras WHERE ChronologyIndex >= 4;

INSERT INTO BuildingModifiers (BuildingType, ModifierId) SELECT 'BUILDING_CHANCERY', 'CHANCERY_COUNTERYSPY_SCIENCE_' || substr(EraType, 5) FROM Eras WHERE ChronologyIndex >= 4;

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) SELECT 'CHANCERY_COUNTERYSPY_CULTURE_' || substr(EraType, 5), 'MODIFIER_PLAYER_ADJUST_COUNTER_SPY_AWARD_YIELD_PER_LEVEL', 'PLAYER_AT_LEAST_' || substr(EraType, 5) || '_ERA' FROM Eras WHERE ChronologyIndex >= 4;

INSERT INTO ModifierArguments (ModifierId, Name, Value) SELECT 'CHANCERY_COUNTERYSPY_CULTURE_' || substr(EraType, 5), 'YieldType', 'YIELD_CULTURE' FROM Eras WHERE ChronologyIndex >= 4;
INSERT INTO ModifierArguments (ModifierId, Name, Value) SELECT 'CHANCERY_COUNTERYSPY_CULTURE_' || substr(EraType, 5), 'Amount', '50' FROM Eras WHERE ChronologyIndex >= 4;
INSERT INTO ModifierArguments (ModifierId, Name, Value) SELECT 'CHANCERY_COUNTERYSPY_CULTURE_' || substr(EraType, 5), 'PerXLevels', '1' FROM Eras WHERE ChronologyIndex >= 4;

INSERT INTO BuildingModifiers (BuildingType, ModifierId) SELECT 'BUILDING_CHANCERY', 'CHANCERY_COUNTERYSPY_CULTURE_' || substr(EraType, 5) FROM Eras WHERE ChronologyIndex >= 4;

INSERT INTO Requirements (RequirementId, RequirementType) SELECT 'REQUIRES_PLAYER_AT_LEAST_' || substr(EraType, 5) || '_ERA', 'REQUIREMENT_PLAYER_ERA_AT_LEAST' FROM Eras WHERE ChronologyIndex >= 4;

INSERT INTO RequirementArguments (RequirementId, Name, Value) SELECT 'REQUIRES_PLAYER_AT_LEAST_' || substr(EraType, 5) || '_ERA', 'EraType', EraType FROM Eras WHERE ChronologyIndex >= 4;

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) SELECT 'PLAYER_AT_LEAST_' || substr(EraType, 5) || '_ERA', 'REQUIREMENTSET_TEST_ALL' FROM Eras WHERE ChronologyIndex >= 4;

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) SELECT 'PLAYER_AT_LEAST_' || substr(EraType, 5) || '_ERA', 'REQUIRES_PLAYER_AT_LEAST_' || substr(EraType, 5) || '_ERA' FROM Eras WHERE ChronologyIndex >= 4;
