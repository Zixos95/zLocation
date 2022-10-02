esx = nil
esxLoaded = false
TriggerEvent('esx:getSharedObject', function(obj) 
    esx = obj 
    esxLoaded = true
end)