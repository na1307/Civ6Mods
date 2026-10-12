local comandantes = {}

for row in GameInfo.GreatPersonIndividuals() do
    if row.GreatPersonClassType == "GREAT_PERSON_CLASS_COMANDANTE_GENERAL" then
        table.insert(comandantes, row.Hash)
    end
end

local function cpc(playerID, cityID, iConstructionType, unitType, bCancelled)
    if bCancelled then
        return
    end

    if iConstructionType ~= 0 then
        return
    end

    if unitType ~= GameInfo.Units["UNIT_COMANDANTE_GENERAL"].Index then
        return
    end

    local player = Players[playerID]

    if player == nil then
        return
    end

    local city = CityManager.GetCity(playerID, cityID)

    if city == nil then
        return
    end

    local plot = city:GetPlot()

    if plot == nil then
        return
    end

    local plotunits = Units.GetUnitsInPlot(plot)

    for i = #plotunits, 1, -1 do
        local v = plotunits[i]

        if v:GetType() == GameInfo.Units["UNIT_COMANDANTE_GENERAL"].Index then
            local ggp = Game.GetGreatPeople()
            local tindex = Game.GetRandNum(#comandantes, "Comandante") + 1

            ggp:CreatePerson(playerID, comandantes[tindex], plot:GetX(), plot:GetY())
            UnitManager.Kill(v)

            return
        end
    end
end

Events.CityProductionCompleted.Add(cpc)