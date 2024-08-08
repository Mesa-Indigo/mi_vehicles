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
        menu = 'shop_bcs',
        options = vehicles
    })
    lib.showContext('list')
end

local options = {
    {
        title = 'Urban', icon ='bicycle',
        iconColor = '#EB984E',
        onSelect = function()
            loadmenu(Type.Cycle.urban)
        end,
    },
    {
        title = 'Sport', icon ='bicycle',
        iconColor = '#EB984E',
        onSelect = function()
            loadmenu(Type.Cycle.sport)
        end,
    },
}

RegisterCommand('bcs', function()
    lib.registerContext({
        id = 'shop_bcs',
        title = 'Bicycle Shop',
        menu = 'bcs_main',
        options = options
    })

    lib.showContext('shop_bcs')
end, false)