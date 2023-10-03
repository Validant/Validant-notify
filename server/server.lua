if Config.Framework == "ESX" then
    ESX = exports['es_extended']:getSharedObject()
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('The resource ' .. resourceName .. ' has been started.')
end) 

exports("notify", function (message, color)
    TriggerClientEvent("valdiant:sendMessage", message)
    if Config.Debug == true then
        print(message, color)
    end
end)

function notify(message, color)
    TriggerClientEvent("valdiant:sendMessage", message)
    if Config.Debug == true then
        print(message, color)
    end
end