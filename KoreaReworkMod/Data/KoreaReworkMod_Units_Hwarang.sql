﻿-- KoreaReworkMod_Units_Hwarang
-- Author: Bluehill
-- DateCreated: 2023-09-17 오후 8:43:03
--------------------------------------------------------------

INSERT INTO Types (Type, Kind) VALUES ('TRAIT_LEADER_UNIT_KOREAN_HWARANG', 'KIND_TRAIT'), ('UNIT_KOREAN_HWARANG', 'KIND_UNIT'), ('ABILITY_POST_COMBAT_CULTURE', 'KIND_ABILITY'), ('ABILITY_POST_COMBAT_FAITH', 'KIND_ABILITY');
INSERT INTO Tags (Tag, Vocabulary) VALUES ('CLASS_HWARANG', 'ABILITY_CLASS');

INSERT INTO TypeTags (Type, Tag)
SELECT 'UNIT_KOREAN_HWARANG', Tag
FROM TypeTags WHERE Type = 'UNIT_SWORDSMAN';

INSERT INTO TypeTags (Type, Tag) VALUES ('UNIT_KOREAN_HWARANG', 'CLASS_HWARANG'), ('ABILITY_POST_COMBAT_CULTURE', 'CLASS_HWARANG'), ('ABILITY_POST_COMBAT_FAITH', 'CLASS_HWARANG');
INSERT INTO Traits (TraitType, Name, Description) VALUES ('TRAIT_LEADER_UNIT_KOREAN_HWARANG', 'LOC_UNIT_KOREAN_HWARANG_NAME',  'LOC_UNIT_KOREAN_HWARANG_DESCRIPTION');
INSERT INTO LeaderTraits (LeaderType, TraitType) VALUES ('LEADER_SEONDEOK', 'TRAIT_LEADER_UNIT_KOREAN_HWARANG');

INSERT INTO Units (UnitType, Name, Description, TraitType, Combat, BaseMoves, Cost, AdvisorType, BaseSightRange, ZoneOfControl, Domain, FormationClass, PurchaseYield, PromotionClass, Maintenance, MandatoryObsoleteTech, StrategicResource, PrereqTech)
SELECT 'UNIT_KOREAN_HWARANG', 'LOC_UNIT_KOREAN_HWARANG_NAME', 'LOC_UNIT_KOREAN_HWARANG_DESCRIPTION', 'TRAIT_LEADER_UNIT_KOREAN_HWARANG', Combat, BaseMoves, Cost, AdvisorType, BaseSightRange, ZoneOfControl, Domain, FormationClass, PurchaseYield, PromotionClass, Maintenance, MandatoryObsoleteTech, StrategicResource, PrereqTech
FROM Units WHERE UnitType = 'UNIT_SWORDSMAN';

INSERT INTO Units_XP2 (UnitType, ResourceCost) VALUES ('UNIT_KOREAN_HWARANG', '10');

INSERT INTO UnitUpgrades (Unit, UpgradeUnit)
SELECT 'UNIT_KOREAN_HWARANG', UpgradeUnit
FROM UnitUpgrades WHERE Unit = 'UNIT_SWORDSMAN';

INSERT INTO UnitAiInfos (UnitType, AiType)
SELECT 'UNIT_KOREAN_HWARANG', AiType
FROM UnitAiInfos WHERE UnitType = 'UNIT_SWORDSMAN';

INSERT INTO UnitReplaces (CivUniqueUnitType, ReplacesUnitType) VALUES ('UNIT_KOREAN_HWARANG', 'UNIT_SWORDSMAN');
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description) VALUES ('ABILITY_POST_COMBAT_CULTURE', 'LOC_ABILITY_POST_COMBAT_CULTURE_NAME', 'LOC_ABILITY_POST_COMBAT_CULTURE_DESCRIPTION'), ('ABILITY_POST_COMBAT_FAITH', 'LOC_ABILITY_POST_COMBAT_FAITH_NAME', 'LOC_ABILITY_POST_COMBAT_FAITH_DESCRIPTION');
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('ABILITY_POST_COMBAT_CULTURE', 'DEFEATED_CULTURE'), ('ABILITY_POST_COMBAT_FAITH', 'DEFEATED_FAITH');
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('DEFEATED_CULTURE', 'MODIFIER_UNIT_ADJUST_POST_COMBAT_YIELD'), ('DEFEATED_FAITH', 'MODIFIER_UNIT_ADJUST_POST_COMBAT_YIELD');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('DEFEATED_CULTURE', 'PercentDefeatedStrength', '50'), ('DEFEATED_CULTURE', 'YieldType', 'YIELD_CULTURE'), ('DEFEATED_FAITH', 'PercentDefeatedStrength', '100'), ('DEFEATED_FAITH', 'YieldType', 'YIELD_FAITH');
INSERT INTO MomentIllustrations (MomentIllustrationType, MomentDataType, GameDataType, Texture) VALUES	('MOMENT_ILLUSTRATION_UNIQUE_UNIT', 'MOMENT_DATA_UNIT', 'UNIT_KOREAN_HWARANG', 'Moment_UniqueUnit_Ant_Hwarang.dds');
