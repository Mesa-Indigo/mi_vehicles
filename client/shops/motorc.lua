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
        menu = 'shop_mtc',
        options = vehicles
    })
    lib.showContext('list')
end

local options = {
    {
        title = 'Sport', icon ='motorcycle',
        iconColor = Shop.colors.mtc,
        onSelect = function()
            loadmenu(Type.Moto.sport)
        end,
    },
    {
        title = 'Offroad', icon ='motorcycle',
        iconColor = Shop.colors.mtc,
        onSelect = function()
            loadmenu(Type.Moto.offroad)
        end,
    },
    {
        title = 'Leisure', icon ='motorcycle',
        iconColor = Shop.colors.mtc,
        onSelect = function()
            loadmenu(Type.Moto.leisure)
        end,
    },
}

RegisterCommand('mtc', function()
    lib.registerContext({
        id = 'shop_mtc',
        title = 'P.D.M - Motorcycles',
        options = options
    })

    lib.showContext('shop_mtc')
end, false)