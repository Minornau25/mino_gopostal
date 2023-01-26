ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('mino_gopostal:PayMoney')
AddEventHandler('mino_gopostal:PayMoney', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    PlayerJob = xPlayer.getJob()

    xPlayer.addMoney(Config.Money)
end)