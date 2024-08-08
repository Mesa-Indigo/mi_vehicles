-- vehicle
lib.callback.register('mi_veh:s:importvehicle', function(player, data)
    local vehicleData = VehicleData[data.model]
end)

local vehicle
lib.callback.register('mi_veh:test', function(source, coords, model)
    vehicle = Ox.CreateVehicle({
        model = 'winky'
    }, vec3(-219.312, -1326.697, 30.693), 223.938)
end)


RegisterServerEvent('mi_veh:s:load:pdm')
AddEventHandler('mi_veh:s:load:pdm', function()
    TriggerClientEvent('mi_veh:c:load:pdm', 1)
    if Debug then print('loadpdm: s - c') end
end)