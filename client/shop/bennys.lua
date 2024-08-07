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
        menu = 'shop_bnc',
        options = vehicles
    })
    lib.showContext('list')
end

local options = {
    {
        title = 'Tuners',
        onSelect = function()
            loadmenu(Type.Special.tuner)
        end,
    },
    {
        title = 'Classics',
        onSelect = function()
            loadmenu(Type.Special.classic)
        end,
    },
}

RegisterCommand('bnc', function()
    lib.registerContext({
        id = 'shop_bnc',
        title = 'Benny\'s Customs',
        menu = 'pdm_main',
        options = options
    })

    lib.showContext('shop_bnc')
end, false)