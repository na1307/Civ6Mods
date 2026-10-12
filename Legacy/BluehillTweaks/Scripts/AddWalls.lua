function PlaceBuildingInCityCenter(pCity, iBuilding, bRepairPillaged)
	local bFixIfPillaged = ((bRepairPillaged ~= nil) and bRepairPillaged or false)
	local iCityPlotIndex = Map.GetPlot(pCity:GetX(), pCity:GetY()):GetIndex()

	if not pCity:GetBuildings():HasBuilding(iBuilding) then
		pCity:GetBuildQueue():CreateIncompleteBuilding(iBuilding, iCityPlotIndex, 100);
	else
		if (bFixIfPillaged == true) then
			if pCity:GetBuildings():IsPillaged(iBuilding) then
				pCity:GetBuildings():SetPillaged(iBuilding, false)
			end
		end
	end
end

function AddWallsToCity( iPlayer, pCity )
	local iAncientWalls = GameInfo.Buildings["BUILDING_WALLS"].Index;
	local iMedievalWalls = GameInfo.Buildings["BUILDING_CASTLE"].Index;
	local iRenaissanceWalls = GameInfo.Buildings["BUILDING_STAR_FORT"].Index;

	PlaceBuildingInCityCenter(pCity, iAncientWalls, true);
	PlaceBuildingInCityCenter(pCity, iMedievalWalls, true);

	if (PlayerConfigurations[iPlayer]:GetCivilizationTypeName() == "CIVILIZATION_GEORGIA") then
		PlaceBuildingInCityCenter(pCity, GameInfo.Buildings["BUILDING_TSIKHE"].Index, true);
	else
		PlaceBuildingInCityCenter(pCity, iRenaissanceWalls, true);
	end
end

function OnResearchCompleted( ePlayer, eTech )
	local iSteel = GameInfo.Technologies["TECH_STEEL"].Index;

	if (eTech == iSteel and ePlayer == 0) then
		table.insert(ExposedMembers.SteelResearched, tostring(ePlayer));

		for i, city in Players[ePlayer]:GetCities():Members() do
			AddWallsToCity(ePlayer, city);
		end
	end
end

function OnCityBuilt( playerID, cityID, cityX, cityY )
	if next(ExposedMembers.SteelResearched) ~= nil then
		for index, value in ipairs(ExposedMembers.SteelResearched) do
			if value == tostring(playerID) then
				local pCity = CityManager.GetCityAt(cityX, cityY);

				AddWallsToCity(playerID, pCity);
			end
		end
	end
end

function OnCityConquered( newPlayerID, oldPlayerID, newCityID, iCityX, iCityY )
	if next(ExposedMembers.SteelResearched) ~= nil then
		for index, value in ipairs(ExposedMembers.SteelResearched) do
			if value == tostring(newPlayerID) then
				local pCity = CityManager.GetCityAt(iCityX, iCityY);

				AddWallsToCity(newPlayerID, pCity);
			end
		end
	end
end

ExposedMembers.SteelResearched = {};
Events.ResearchCompleted.Add(OnResearchCompleted);
GameEvents.CityBuilt.Add(OnCityBuilt);
GameEvents.CityConquered.Add(OnCityConquered)
