function IsCombatUnit(unit)
	local unitInfo = GameInfo.Units[unit:GetType()]

	-- Check if the unit has combat strength or ranged combat strength
	if unitInfo.Combat > 0 or unitInfo.RangedCombat > 0 then
		return true
	else
		return false
	end
end

function OnUnitPromoted( playerID, unitID )
	local playerConfig = PlayerConfigurations[playerID]
	local difficultyInfo = GameInfo.Difficulties[playerConfig:GetHandicapTypeID()]
	local unit = UnitManager.GetUnit(playerID, unitID)
	local unitExperience = unit:GetExperience()

	if IsCombatUnit(unit) and (difficultyInfo.DifficultyType == 'DIFFICULTY_DEITY') and not PlayerManager.GetPlayer(playerID):IsHuman() and (unitExperience:GetExperiencePoints() <= 15) then
		unitExperience:ChangeExperience(30)
	end
end

Events.UnitPromoted.Add(OnUnitPromoted)
