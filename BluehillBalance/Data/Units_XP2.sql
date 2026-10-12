-- Mustketman
UPDATE Units_XP2
SET
    ResourceCost = 1,
    ResourceMaintenanceType = 'RESOURCE_NITER',
    ResourceMaintenanceAmount = 1
WHERE UnitType = 'UNIT_MUSKETMAN'
   OR UnitType IN (
       SELECT CivUniqueUnitType
       FROM UnitReplaces
       WHERE ReplacesUnitType = 'UNIT_MUSKETMAN'
   );

-- Line Infantry
UPDATE Units_XP2
SET
    ResourceCost = 1,
    ResourceMaintenanceType = 'RESOURCE_NITER',
    ResourceMaintenanceAmount = 1
WHERE UnitType = 'UNIT_LINE_INFANTRY'
   OR UnitType IN (
       SELECT CivUniqueUnitType
       FROM UnitReplaces
       WHERE ReplacesUnitType = 'UNIT_LINE_INFANTRY'
   );

-- Infantry
UPDATE Units
SET
    StrategicResource = 'RESOURCE_IRON'
WHERE UnitType = 'UNIT_INFANTRY';

UPDATE Units_XP2
SET
    ResourceCost = 20,
    ResourceMaintenanceType = NULL,
    ResourceMaintenanceAmount = 0
WHERE UnitType = 'UNIT_INFANTRY';

-- Machanized Infantry
UPDATE Units
SET
    StrategicResource = 'RESOURCE_ALUMINUM'
WHERE UnitType = 'UNIT_MECHANIZED_INFANTRY';

UPDATE Units_XP2
SET
    ResourceCost = 20,
    ResourceMaintenanceType = NULL,
    ResourceMaintenanceAmount = 0
WHERE UnitType = 'UNIT_MECHANIZED_INFANTRY';

-- Bombard
UPDATE Units_XP2
SET
    ResourceCost = 1,
    ResourceMaintenanceType = 'RESOURCE_NITER',
    ResourceMaintenanceAmount = 1
WHERE UnitType = 'UNIT_BOMBARD'
   OR UnitType IN (
       SELECT CivUniqueUnitType
       FROM UnitReplaces
       WHERE ReplacesUnitType = 'UNIT_BOMBARD'
   );

-- Helicopter
UPDATE Units
SET
    StrategicResource = NULL
WHERE UnitType = 'UNIT_HELICOPTER';

UPDATE Units_XP2
SET
    ResourceCost = 0,
    ResourceMaintenanceType = NULL,
    ResourceMaintenanceAmount = 0
WHERE UnitType = 'UNIT_HELICOPTER';

-- Frigate
UPDATE Units_XP2
SET
    ResourceCost = 1,
    ResourceMaintenanceType = 'RESOURCE_NITER',
    ResourceMaintenanceAmount = 1
WHERE UnitType = 'UNIT_FRIGATE'
   OR UnitType IN (
       SELECT CivUniqueUnitType
       FROM UnitReplaces
       WHERE ReplacesUnitType = 'UNIT_FRIGATE'
   );

-- Fighter
UPDATE Units_XP2
SET
    ResourceCost = 30,
    ResourceMaintenanceType = NULL,
    ResourceMaintenanceAmount = 0
WHERE UnitType = 'UNIT_FIGHTER';

UPDATE Units_XP2
SET
    ResourceCost = 15,
    ResourceMaintenanceType = NULL,
    ResourceMaintenanceAmount = 0
WHERE UnitType IN (
       SELECT CivUniqueUnitType
       FROM UnitReplaces
       WHERE ReplacesUnitType = 'UNIT_FIGHTER'
   );

-- Bomber
UPDATE Units_XP2
SET
    ResourceCost = 30,
    ResourceMaintenanceType = NULL,
    ResourceMaintenanceAmount = 0
WHERE UnitType = 'UNIT_BOMBER';

-- Jet Fighter
UPDATE Units_XP2
SET
    ResourceCost = 30,
    ResourceMaintenanceType = NULL,
    ResourceMaintenanceAmount = 0
WHERE UnitType = 'UNIT_JET_FIGHTER';

-- Jet Bomber
UPDATE Units_XP2
SET
    ResourceCost = 30,
    ResourceMaintenanceType = NULL,
    ResourceMaintenanceAmount = 0
WHERE UnitType = 'UNIT_JET_BOMBER';
