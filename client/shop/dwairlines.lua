local loadmenu = function(type)
    local vehicles = {}
    for _, v in pairs(type) do
        vehicles[#vehicles+1] = {
            title = v.make..', '..v.model,
            description = '$'..v.maxcost,
            image = v.image
        }
    end
    lib.registerContext({
        id = 'list',
        title = 'Listed Airframes',
        menu = 'shop_dwa',
        options = vehicles
    })
    lib.showContext('list')
end

local options = {
    {
        title = 'Helicopters', icon ='helicopter',
        iconColor = Shop.colors.dwa,
        onSelect = function()
            loadmenu(Type.Airframe.heli)
        end,
    },
    {
        title = 'Airplanes', icon ='plane',
        iconColor = Shop.colors.dwa,
        onSelect = function()
            loadmenu(Type.Airframe.plane)
        end,
    },
}

RegisterCommand('dwa', function()
    lib.registerContext({
        id = 'shop_dwa',
        title = 'D.W. Airlines',
        options = options
    })

    lib.showContext('shop_dwa')
end, false)