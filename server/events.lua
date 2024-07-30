-- vehicle
lib.callback.register('miv:s:importvehicle', function(player, data)
    local vehicleData = VehicleData[data.model]
end)

local vehicle
lib.callback.register('mivehicle:test', function(source, coords, model)
    vehicle = Ox.CreateVehicle({
        model = 'winky'
    }, vec3(-219.312, -1326.697, 30.693), 223.938)
end)