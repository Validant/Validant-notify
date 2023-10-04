if Config.Framework == "ESX" then
    ESX = exports['es_extended']:getSharedObject()
end
local display = false
--[[ ////////////////////////////////////////// ]]
if Config.Debug == true then
  RegisterCommand('notifyd', function(source, args, rawCommand)
    TriggerEvent("validant:sendMessage",args, "darkblue", 5000)
  end)

  RegisterCommand('notify', function(source, args, rawCommand)
    TriggerEvent("validant:sendMessage",args[1], args[2], 5000)
  end)

  RegisterCommand("show", function(source, args)
    setDisplay(not display)
  end)
end


function setDisplay(bool)
  display = bool
  SetNuiFocus(bool, bool)
  SendNUIMessage({
    type = "ui",
    display = bool
  })
end

exports("notify", function (message)
  TriggerEvent("validant:sendMessage",message)
    if Config.Debug == true then
     print(message)
    end
end)

-- RegisterNetEvent('validant:notifySystem')
-- AddEventHandler('validant:notifySystem', function()
--     SendNUIMessage({
--       title = "System",
--       type = "msg",
--       inline = Config.Inline,
--       round = Config.Round,
--       msg = message,
--       col = color,
--       icon = '<i class="fa-solid fa-server"></i>',
--       position = Config.Position,
--       display = true 
--     })
--   Citizen.Wait(Config.ShownTime)
--   setDisplay(false)
-- end) comes to a update. this should be a system notification like someone has join the Server or something else like.

RegisterNetEvent("validant:sendMessage")
AddEventHandler("validant:sendMessage", function(message, color)
    SendNUIMessage({
        title = Config.Title,
        type = "msg",
        inline = Config.Inline,
        round = Config.Round,
        msg = message,
        col = color,
        icon = Config.Icon,
        position = Config.Position,
        display = true 
    })
    Citizen.Wait(Config.ShownTime)
    setDisplay(false)
end)
