print("^1--------------------------------------")
print("")
print("")
print("")
print("^3zLocation created by ^4!zixos#8062")
print("^2Help : https://discord.gg/54q6Xr5xwG")
print("")
print("")
print("")
print("^1--------------------------------------")

RegisterServerEvent('zixos:achat')
AddEventHandler('zixos:achat', function(model, price, spawn, heading)
    local _source = source
    local xPlayer = esx.GetPlayerFromId(_source)
    local price = price
    local spawn = spawn
    local heading = heading

    if xPlayer.getAccount('bank').money >= price then
        xPlayer.removeAccountMoney('bank', price)
        TriggerClientEvent("zixos:spawnlocation", _source, model, spawn, heading)
        xPlayer.showNotification("Achat effectuer")
    else
        xPlayer.showNotification("~r~Vous n'avez pas assez d'argent")
    end
end)