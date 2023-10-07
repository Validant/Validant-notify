if Config.Framework == "ESX" then
  ESX = exports['es_extended']:getSharedObject()
end
local display = false
local alertDisplay = false
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
      type = "msg",
      display = bool
    })
end
function SetAlertDisplay(bool)
    alertDisplay = bool
    SendNUIMessage({
      type = "alert",
      display = bool
    })
end


exports("alert", function (message, alerttyp)
  TriggerEvent('validant:alert', message, alerttyp)
end)

exports("open", function (message)
TriggerEvent("validant:sendMessage",message)
  if Config.Debug == true then
   print(message)
  end
end)

exports("close",function()
  setDisplay(false)
end)

RegisterNetEvent('validant:alert')
AddEventHandler('validant:alert', function(message, alerttyp)

  if alerttyp == "warn" then
      col = "warn"
  elseif alerttyp == "error" then
      col = "error"
  elseif alerttyp == "info" then
      col = "info"
  end

  SendNUIMessage({
    type = "alert",
    Ainline = true,
    Around = true,
    Amsg = message,
    Acol = col,
    Aposition = "bottom-right",
    display = true
  })
  Citizen.Wait(Config.ShownTime)
  SetAlertDisplay(false, false)

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
end)
