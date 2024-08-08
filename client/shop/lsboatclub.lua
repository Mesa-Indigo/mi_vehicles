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
        title = 'Listed Watercraft',
        menu = 'shop_lsb',
        options = vehicles
    })
    lib.showContext('list')
end

local options = {
    {
        title = 'Leisure', icon ='sailboat',
        iconColor = Shop.colors.lsb,
        onSelect = function()
            loadmenu(Type.Boat.leisure)
        end,
    },
    {
        title = 'Sport', icon ='sailboat',
        iconColor = Shop.colors.lsb,
        onSelect = function()
            loadmenu(Type.Boat.sport)
        end,
    },
    {
        title = 'Submersible', icon ='ferry',
        iconColor = Shop.colors.lsb,
        onSelect = function()
            loadmenu(Type.Boat.submersible)
        end,
    },
}

RegisterCommand('lsb', function()
    lib.registerContext({
        id = 'shop_lsb',
        title = 'L.S.Y. Boat Club',
        options = options
    })

    lib.showContext('shop_lsb')
end, false)