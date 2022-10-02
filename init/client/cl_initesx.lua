esxLoaded = false
esx = nil

function Loadesx()
    while esx == nil do
        TriggerEvent('esx:getSharedObject', function(obj) esx = obj end)
        Citizen.Wait(0)
    end    
    
    esxLoaded = true
    print('esx STARTED')
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    Loadesx() -- @INIT esx
end)

Citizen.CreateThread(function()
    Loadesx()
end)

