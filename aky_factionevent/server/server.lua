ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent("aky:factionevent:startEvent")
AddEventHandler("aky:factionevent:startEvent", function (type)
    if config.blips[type] then
        local blipInfo = config.blips[type]

        for _, playerId in ipairs(GetPlayers()) do
            aky.event.triggerEvent("client", "factionevent:createBlip", playerId, blipInfo.name, blipInfo.pos)
            print("Created Blip . " .. playerId, blipInfo.name, blipInfo.pos)
        end
    end
end)

RegisterNetEvent("aky:factionevent:stopEvent")
AddEventHandler("aky:factionevent:stopEvent", function (type)
    local blipInfo = config.blips[type]

    for _, playerId in ipairs(GetPlayers()) do
        aky.event.triggerEvent("client", "factionevent:removeBlip", playerId, blipInfo.pos)
        print("Removed Blip . " .. playerId, blipInfo.pos)
    end
end)