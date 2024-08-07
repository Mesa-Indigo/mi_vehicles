local loadmenu = function(type)
    local vehicles = {}
    for _, v in pairs(type) do
        vehicles[#vehicles+1] = {
            title = v.make..', '..v.model,
            description = '$'..v.cost,
            --image = v.image
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
        title = 'Compacts',
        onSelect = function()
            loadmenu(Type.Import.sport)
        end,
    },
    {
        title = 'Coupes',
        onSelect = function()
            loadmenu(Type.Import.super)
        end,
    },
}

RegisterCommand('lxm', function()
    lib.registerContext({
        id = 'shop_lxm',
        title = 'Premium Deluxe Motorsport',
        menu = 'pdm_main',
        options = options
    })

    lib.showContext('shop_lxm')
end, false)