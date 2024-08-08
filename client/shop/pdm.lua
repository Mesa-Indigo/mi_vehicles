local sped = { ped = nil }

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
        menu = 'shop_pdm',
        options = vehicles
    })
    lib.showContext('list')
end

local options = {
    {
        title = 'Compacts', icon ='car-side',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            loadmenu(Type.Auto.compact)
        end,
    },
    {
        title = 'Coupes', icon ='car-side',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            loadmenu(Type.Auto.coupe)
        end,
    },
    {
        title = 'Sedans', icon ='car-side',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            loadmenu(Type.Auto.sedan)
        end,
    },
    {
        title = 'Suvs', icon ='van-shuttle',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            loadmenu(Type.Auto.suv)
        end,
    },
    {
        title = 'Trucks', icon ='truck-pickup',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            loadmenu(Type.Auto.truck)
        end,
    },
    {
        title = 'Vans', icon ='van-shuttle',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            loadmenu(Type.Auto.van)
        end,
    },
    {
        title = 'Muscle', icon ='car-side',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            loadmenu(Type.Auto.muscle)
        end,
    },
    {
        title = 'Off-Road', icon ='car-side',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            loadmenu(Type.Auto.offroad)
        end,
    },
}

RegisterCommand('pdm', function()
    lib.registerContext({
        id = 'shop_pdm',
        title = 'P.D.M. - Auto',
        options = options
    })

    lib.showContext('shop_pdm')
end, false)

local loadblip = function(shop)

end

local loadped = function(shop, ped)
    local model, loc, head = 'a_f_m_bevhills_01', shop.loc.ped, shop.loc.ped.w
    ped = CreatePed(1, model, loc.x, loc.y, loc.z, head, true, false)
    FreezeEntityPosition(ped, true)
end

RegisterNetEvent('mi_veh:c:load:pdm')
AddEventHandler('mi_veh:c:load:pdm', function()
    loadped(Shop.PDM, sped.ped)
end)

RegisterCommand('pdm', function()
    lib.registerContext({
        id = 'shop_pdm',
        title = 'P.D.M. - Auto',
        options = options
    })
    TriggerServerEvent('mi_veh:s:load:pdm')
    --lib.showContext('shop_pdm')
end, false)