local loadmenu = function(type)
    local vehicles = {}
    for _, v in pairs(type) do
        vehicles[#vehicles+1] = {
            title = v.make..', '..v.model,
            description = '$'..v.maxcost,
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
        title = 'Compacts', icon ='car-side',
        iconColor = '#3498DB',
        onSelect = function()
            loadmenu(Type.Auto.compact)
        end,
    },
    {
        title = 'Coupes', icon ='car-side',
        iconColor = '#3498DB',
        onSelect = function()
            loadmenu(Type.Auto.coupe)
        end,
    },
    {
        title = 'Sedans', icon ='car-side',
        iconColor = '#3498DB',
        onSelect = function()
            loadmenu(Type.Auto.sedan)
        end,
    },
    {
        title = 'Suvs', icon ='van-shuttle',
        iconColor = '#3498DB',
        onSelect = function()
            loadmenu(Type.Auto.suv)
        end,
    },
    {
        title = 'Trucks', icon ='truck-pickup',
        iconColor = '#3498DB',
        onSelect = function()
            loadmenu(Type.Auto.truck)
        end,
    },
    {
        title = 'Vans', icon ='van-shuttle',
        iconColor = '#3498DB',
        onSelect = function()
            loadmenu(Type.Auto.van)
        end,
    },
    {
        title = 'Muscle', icon ='car-side',
        iconColor = '#3498DB',
        onSelect = function()
            loadmenu(Type.Auto.muscle)
        end,
    },
    {
        title = 'Off-Road', icon ='car-side',
        iconColor = '#3498DB',
        onSelect = function()
            loadmenu(Type.Auto.offroad)
        end,
    },
}

RegisterCommand('pdm', function()
    lib.registerContext({
        id = 'shop_pdm',
        title = 'P.D.M. - Auto',
        menu = 'pdm_main',
        options = options
    })

    lib.showContext('shop_pdm')
end, false)