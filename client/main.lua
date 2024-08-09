
-- test for adding car to database with owner
RegisterCommand('mi_addcar', function()

end, false)


-- test for removing car to database with owner
RegisterCommand('mi_remcar', function()
    
end, false)


-- test for loading car to database with owner
RegisterCommand('mi_loadcar', function()
    
end, false)


AddEventHandler('onResourceStart', function(resourceName)
    local resource = GetCurrentResourceName()
    if resource == resourceName then
        if Shop.PDM.active then
            TriggerServerEvent('mi_veh:s:load:pdm')
        else
            if Debug then print('PDM: Inactive') end
        end
    end
end)
