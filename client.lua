Citizen.CreateThread(function()
    local vehicleModels = {
        "akula",
        "ambulance",
        "avenger",
        "avenger2",
        "barrage",
        "barracks",
        "barracks2",
        "barracks3",
        "besra",
        "blimp",
        "bombushka",
        "buzzard",
        "cargobob",
        "cargobob2",
        "cargobob3",
        "cargobob4",
        "cargoplane",
        "chernobog",
        "dune2",
        "firetruk",
        "hydra",
        "hunt",
        "khanjali",
        "lazer",
        "menacer",
        "molotok",
        "nokota",
        "police",
        "police2",
        "police3",
        "police4",
        "policet",
        "policeb",
        "riot",
        "rhino",
        "savage",
        "scarab2",
        "scarab3",
        "starling",
        "strikeforce",
        "titan",
        "tula",
        "technical",
        "technical2",
        "technical3",
        "trailersmall2",
        "volatol",
        "valkyrie",
        "valkyrie2",
        "vigilante"
    }

    local pedModels = {
        "s_m_m_marine_01",
        "s_m_m_marine_02",
        "s_m_y_cop_01",
        "s_m_y_cop_02",
        "s_m_y_fireman_01",
        "s_m_y_hwaycop_01",
        "s_m_y_marine_01",
        "s_m_y_marine_02",
        "s_m_y_marine_03",
        "s_m_y_pilot_01",
        "s_m_y_swat_01"
    }

    local suppressedVehicleHashes = {}
    local suppressedPedHashes = {}

    for _, modelName in ipairs(vehicleModels) do
        table.insert(suppressedVehicleHashes, GetHashKey(modelName))
    end

    for _, modelName in ipairs(pedModels) do
        table.insert(suppressedPedHashes, GetHashKey(modelName))
    end

    for _, modelHash in ipairs(suppressedVehicleHashes) do
        SetVehicleModelIsSuppressed(modelHash, true)
    end

    for _, modelHash in ipairs(suppressedPedHashes) do
        SetPedModelIsSuppressed(modelHash, true)
    end

    while true do
        Citizen.Wait(1250)

        local playerPed = GetPlayerPed(-1)
        local playerLocalisation = GetEntityCoords(playerPed)
        ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)

        local vehicles = GetGamePool("CVehicle")
        for i = 1, #vehicles do
            local vehicle = vehicles[i]
            local model = GetEntityModel(vehicle)

            if table.contains(suppressedVehicleHashes, model) then
                SetEntityAsMissionEntity(vehicle, true, true)
                DeleteVehicle(vehicle)
            end
        end

        local peds = GetGamePool("CPed")
        for i = 1, #peds do
            local ped = peds[i]
            local model = GetEntityModel(ped)

            if table.contains(suppressedPedHashes, model) then
                SetEntityAsMissionEntity(ped, true, true)
                DeletePed(ped)
            end
        end

        SetPedDensityMultiplierThisFrame(1.0)
        SetScenarioPedDensityMultiplierThisFrame(1.0, 1.0)
        SetVehicleDensityMultiplierThisFrame(1.0)
        SetRandomVehicleDensityMultiplierThisFrame(1.0)
        SetParkedVehicleDensityMultiplierThisFrame(1.0)
        SetScenarioTypeEnabled("DRIVE", true)
        SetScenarioTypeEnabled("WALK", true)
    end
end)

function table.contains(table, element)
    for _, value in ipairs(table) do
        if value == element then
            return true
        end
    end
    return false
end
