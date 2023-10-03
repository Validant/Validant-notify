if Config.Framework == "ESX" then
  ESX = exports['es_extended']:getSharedObject()
end
local display = false
--[[ ////////////////////////////////////////// ]]
if Config.Debug == true then
RegisterCommand('notifyd', function(source, args, rawCommand)
  TriggerEvent("validant:sendMessage",args )
end)

RegisterCommand('notifye', function(source, args, rawCommand)
  TriggerEvent("validant:sendMessage",args )
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

RegisterNetEvent("validant:sendMessage")
AddEventHandler("validant:sendMessage", function(message)
  SendNUIMessage({
      title = Config.Title,
      type = "msg",
      inline = Config.Inline,
      round = Config.Round,
      msg = message,
      col = Config.Color,
      icon = Config.Icon,
      position = Config.Position,
      display = true 
  })
  Citizen.Wait(Config.ShownTime)
  setDisplay(false)
end)
