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
        menu = 'shop_bnc',
        options = vehicles
    })
    lib.showContext('list')
end

local options = {
    {
        title = 'Tuners', icon ='car-side',
        iconColor = Shop.colors.bnc,
        onSelect = function()
            loadmenu(Type.Special.tuner)
        end,
    },
    {
        title = 'Classics', icon ='car-side',
        iconColor = Shop.colors.bnc,
        onSelect = function()
            loadmenu(Type.Special.classic)
        end,
    },
}

RegisterCommand('bnc', function()
    lib.registerContext({
        id = 'shop_bnc',
        title = 'Benny\'s Customs',
        options = options
    })

    lib.showContext('shop_bnc')
end, false)