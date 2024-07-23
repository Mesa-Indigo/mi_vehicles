VehData = {}

VehData = setmetatable({}, {
    __index = function(self, index)
        local data = Ox.GetVehicleData(index)

        if data then
            data = {
                name = data.name,
				type = data.type,
				seats = data.seats,
				price = data.price,
				class = data.class,
				weapons = data.weapons,
            }
            self[index] = data
            return data
        end
    end
})