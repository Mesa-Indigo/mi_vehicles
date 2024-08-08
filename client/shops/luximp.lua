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
        title = 'Listed Vehicles',
        menu = 'shop_lxm',
        options = vehicles
    })
    lib.showContext('list')
end

local options = {
    {
        title = 'Sports', icon ='car-side',
        iconColor = Shop.colors.lxm,
        onSelect = function()
            loadmenu(Type.Import.sport)
        end,
    },
    {
        title = 'Supers', icon ='car-side',
        iconColor = Shop.colors.lxm,
        onSelect = function()
            loadmenu(Type.Import.super)
        end,
    },
}

RegisterCommand('lxm', function()
    lib.registerContext({
        id = 'shop_lxm',
        title = 'Luxury Imports',

        options = options
    })

    lib.showContext('shop_lxm')
end, false)