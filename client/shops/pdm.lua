-- vehicle options
local options = {
    {
        title = 'Compacts', icon ='car-side',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            LoadMenu(Type.Auto.compact)
        end,
    },
    {
        title = 'Coupes', icon ='car-side',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            LoadMenu(Type.Auto.coupe)
        end,
    },
    {
        title = 'Sedans', icon ='car-side',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            LoadMenu(Type.Auto.sedan)
        end,
    },
    {
        title = 'Suvs', icon ='van-shuttle',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            LoadMenu(Type.Auto.suv)
        end,
    },
    {
        title = 'Trucks', icon ='truck-pickup',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            LoadMenu(Type.Auto.truck)
        end,
    },
    {
        title = 'Vans', icon ='van-shuttle',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            LoadMenu(Type.Auto.van)
        end,
    },
    {
        title = 'Muscle', icon ='car-side',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            LoadMenu(Type.Auto.muscle)
        end,
    },
    {
        title = 'Off-Road', icon ='car-side',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            LoadMenu(Type.Auto.offroad)
        end,
    },
}

-- options for ped
local pedops = {
    {
        label = 'Shop for Vehicles', icon ='fa-solid fa-tags',
        onSelect = function()
            lib.showContext('shop_pdm')
        end,
    },
}

local ped = { obj = nil, spawned = false}
local model, crd = lib.requestModel('a_m_y_business_02'), Shop.PDM.loc.ped
local scn = 'WORLD_HUMAN_DRINKING_FACILITY'

-- initial context for shop_pdm
lib.registerContext({
    id = 'shop_pdm',
    title = 'P.D.M. - Auto',
    options = options
})

RegisterNetEvent('mi_veh:c:load:pdm')
AddEventHandler('mi_veh:c:load:pdm', function()
    print('weh')
    --lib.showContext('shop_pdm')
    LoadBlip(Shop.PDM.blip)
    LoadPed(ped.obj, model, crd, scn, pedops)
end)

AddEventHandler('onResourceStart', function()
    local resource = GetCurrentResourceName()
    if resource == GetCurrentResourceName() then
        TriggerServerEvent('mi_veh:s:load:pdm')
        if Debug then print('loadpdm: rs - s') end
    end
end)

-- test commands
RegisterCommand('pdm', function()
    --TriggerServerEvent('mi_veh:s:load:pdm')
    --TriggerServerEvent('mi_veh:s:load:pdm')
end, false)