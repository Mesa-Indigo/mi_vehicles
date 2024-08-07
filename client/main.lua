
-- test for adding car to database with owner
RegisterCommand('mi_addcar', function()

end, false)


-- test for removing car to database with owner
RegisterCommand('mi_remcar', function()
    
end, false)


-- test for loading car to database with owner
RegisterCommand('mi_loadcar', function()
    
end, false)




-- testing for images
-- tp coords -213.182, -1328.416, 31.300, 74.622
RegisterCommand('testmenu', function()
    local mmenu = Type.Auto.compact
    local vehicles = {}
    for k, v in pairs(mmenu) do
        vehicles[#vehicles+1] = {
            title = v.make..', '..v.model,
            description = '$'..v.cost
        }
    end

    lib.registerContext({
        id = 'veh_compact',
        title = 'Compacts',
        menu = 'some_menu',
        options = vehicles
    })

    lib.showContext('veh_compact')
end, false)