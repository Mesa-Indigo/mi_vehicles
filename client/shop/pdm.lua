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
        menu = 'shop_pdm',
        options = vehicles
    })
    lib.showContext('list')
end

local options = {
    {
        title = 'Compacts',
        onSelect = function()
            loadmenu(Type.Auto.compact)
        end,
    },
    {
        title = 'Coupes',
        onSelect = function()
            loadmenu(Type.Auto.coupe)
        end,
    },
    {
        title = 'Sedans',
        onSelect = function()
            loadmenu(Type.Auto.sedan)
        end,
    },
    {
        title = 'Suvs',
        onSelect = function()
            loadmenu(Type.Auto.suv)
        end,
    },
    {
        title = 'Trucks',
        onSelect = function()
            loadmenu(Type.Auto.truck)
        end,
    },
    {
        title = 'Vans',
        onSelect = function()
            loadmenu(Type.Auto.van)
        end,
    },
    {
        title = 'Muscle',
        onSelect = function()
            loadmenu(Type.Auto.muscle)
        end,
    },
    {
        title = 'Off-Road',
        onSelect = function()
            loadmenu(Type.Auto.offroad)
        end,
    },
}

RegisterCommand('pdm', function()
    lib.registerContext({
        id = 'shop_pdm',
        title = 'Premium Deluxe Motorsport',
        menu = 'pdm_main',
        options = options
    })

    lib.showContext('shop_pdm')
end, false)