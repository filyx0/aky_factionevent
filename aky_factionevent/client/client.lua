ESX = exports['es_extended']:getSharedObject()

aky.Init("Faction Event Manager")

local blips = {}

function Notify(msg, type, source)
    if notify == "aky" then
        aky.Notify(source, msg)
    elseif notify == "ox" then
        lib.notify({
            title = msg,
            type = type
        })
    elseif notify == "esx" then
        ESX.ShowNotification(msg)
    end
end

RegisterNetEvent('aky:factionevent:createBlip')
AddEventHandler('aky:factionevent:createBlip', function(name, pos)
    Notify(GetTranslation("event_started"))

    local blip = AddBlipForCoord(pos.x, pos.y, pos.z)
    SetBlipSprite(blip, 1)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 3)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(name)
    EndTextCommandSetBlipName(blip)

    table.insert(blips, blip)
end)

RegisterNetEvent('aky:factionevent:removeBlip')
AddEventHandler('aky:factionevent:removeBlip', function(pos)
    Notify(GetTranslation("event_ended"))

    for i, blip in ipairs(blips) do
        local blipPos = GetBlipCoords(blip)
        if blipPos.x == pos.x and blipPos.y == pos.y and blipPos.z == pos.z then
            RemoveBlip(blip)
            table.remove(blips, i)
            break
        end
    end
end)

RegisterCommand("event", function (source, args, rawCommand)
    local action = args[1]
    local type = args[2]

    aky.permission.checkPermission("aky.factionevent.command.event", function(allowed)
        if allowed then
            if action and type then
                if action == "start" then
                    aky.event.triggerEvent("server", "factionevent:startEvent", tonumber(type))
                elseif action == "stop" then
                    aky.event.triggerEvent("server", "factionevent:stopEvent", tonumber(type))
                end
            else
                Notify(GetTranslation("invalid_type"))
            end
        else
            Notify(GetTranslation("not_allowed"))
        end
    end)
end, false)