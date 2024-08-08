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

local loadblip = function(shop)

end

local preview = function(shop)
    local prev = { obj = nil, spawned = false }
    local model = lib.requestModel('prop_laptop_01a', 300)
    local loc = shop.loc.prev
    prev.obj = CreateObject(model, loc.x, loc.y, loc.z, true, false, false)
    PlaceObjectOnGroundProperly(prev.obj)
    FreezeEntityPosition(prev.obj, true)
end

preview(Shop.PDM)
SetModelAsNoLongerNeeded('prop_laptop_01a')

local loadped = function(shop)
    local sped = { ped = nil }
    local model, loc, head = 'a_f_m_bevhills_01', shop.loc.ped, shop.loc.ped.w
    sped.ped = CreatePed(1, model, loc.x, loc.y, loc.z, head, true, false)
    FreezeEntityPosition(sped.ped, true)
end

lib.registerContext({
    id = 'shop_pdm',
    title = 'P.D.M. - Auto',
    options = options
})

RegisterNetEvent('mi_veh:c:load:pdm')
AddEventHandler('mi_veh:c:load:pdm', function()
    local sped, shop = { ped = nil }, Shop.PDM
    local model, loc, head = 'a_f_m_bevhills_01', shop.loc.ped, shop.loc.ped.w
    sped.ped = CreatePed(1, model, loc.x, loc.y, loc.z, head, true, false)
    FreezeEntityPosition(sped.ped, true)
end)

RegisterCommand('pdm', function()
    TriggerServerEvent('mi_veh:s:load:pdm')
    --lib.showContext('shop_pdm')
end, false)