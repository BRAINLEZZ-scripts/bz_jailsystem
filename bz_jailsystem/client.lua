local isInJail = false

RegisterNetEvent('jailPlayer')
AddEventHandler('jailPlayer', function(time)
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, Config.JailLocation)
    isInJail = true
    local endTime = GetGameTimer() + (time * 1000)
    
    Citizen.CreateThread(function()
        while isInJail do
            Citizen.Wait(1000)
            local remainingTime = math.floor((endTime - GetGameTimer()) / 1000)
            if remainingTime <= 0 then
                isInJail = false
                SetEntityCoords(playerPed, Config.ReleaseLocation)
            else
                SendNUIMessage({
                    type = "updateTimer",
                    time = remainingTime
                })
            end
        end
        SendNUIMessage({ type = "hideTimer" })
    end)
end)

if Config.EnableJailCommand then
    TriggerEvent('chat:addSuggestion', '/'..Config.JailCommand, 'send a player to jail', {
        { name = 'playerId', help = 'The ID of the player to jail' },
        { name = 'time', help = 'Time in seconds for jail duration' }
    })
end