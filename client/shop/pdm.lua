local loadmenu = function(type)
    local vehicles = {}
    for _, v in pairs(type) do
        vehicles[#vehicles+1] = {
            title = v.make..', '..v.model,
            description = '$'..v.cost,
            image = v.image
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
            print("da car")
        end,
    },
    {
        title = 'Sedans',
        onSelect = function()
            print("da car")
        end,
    },
    {
        title = 'Suvs',
        onSelect = function()
            print("da car")
        end,
    },
    {
        title = 'Trucks',
        onSelect = function()
            print("da car")
        end,
    },
    {
        title = 'Vans',
        onSelect = function()
            print("da car")
        end,
    },
    {
        title = 'Muscle',
        onSelect = function()
            print("da car")
        end,
    },
    {
        title = 'Off-Road',
        onSelect = function()
            print("da car")
        end,
    },
    {
        title = 'Sport',
        onSelect = function()
            print("da car")
        end,
    },
    {
        title = 'Super',
        onSelect = function()
            print("da car")
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




RegisterCommand('testmenu', function()
    local mmenu = Type.Auto.compact
    local vehicles = {}
    for _, v in pairs(mmenu) do
        vehicles[#vehicles+1] = {
            title = v.make..', '..v.model,
            description = '$'..v.cost,
            image = v.image
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