ESX = exports["es_extended"]:getSharedObject()

RegisterCommand(Config.JailCommand, function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
        local targetId = tonumber(args[1])
        local jailTime = tonumber(args[2])
        if targetId and jailTime then
            TriggerClientEvent('jailPlayer', targetId, jailTime)
        else
            TriggerClientEvent('chat:addMessage', source, { args = { 'System', 'Usage: /' .. Config.JailCommand .. ' [playerid] [time in seconds]' } })
        end
    else
        TriggerClientEvent('chat:addMessage', source, { args = { 'System', 'You are not authorized to use this command.' } })
    end
end, false)