-- vehicle
lib.callback.register('mi_veh:s:importvehicle', function(player, data)
    local vehicleData = VehicleData[data.model]
end)

lib.callback.register('mi_veh:test', function(source, model, coord, head)
    local player = Ox.GetPlayer(source)
    local vehicle = Ox.CreateVehicle({
        owner = player.charId,
        model = model,
    }, coord, head)
    return vehicle
end)


RegisterServerEvent('mi_veh:s:load:pdm')
AddEventHandler('mi_veh:s:load:pdm', function()
    TriggerClientEvent('mi_veh:c:load:pdm', 1)
    if Debug then print('loadpdm: s -> c') end
end)