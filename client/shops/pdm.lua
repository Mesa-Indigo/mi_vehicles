-- vehicle options
local options = {
    {
        title = 'Compacts', icon ='car-side',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            LoadMenu(Type.Auto.compact, Shop.PDM)
        end,
    },
    {
        title = 'Coupes', icon ='car-side',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            LoadMenu(Type.Auto.coupe, Shop.PDM)
        end,
    },
    {
        title = 'Sedans', icon ='car-side',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            LoadMenu(Type.Auto.sedan, Shop.PDM)
        end,
    },
    {
        title = 'Suvs', icon ='van-shuttle',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            LoadMenu(Type.Auto.suv, Shop.PDM)
        end,
    },
    {
        title = 'Trucks', icon ='truck-pickup',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            LoadMenu(Type.Auto.truck, Shop.PDM)
        end,
    },
    {
        title = 'Vans', icon ='van-shuttle',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            LoadMenu(Type.Auto.van, Shop.PDM)
        end,
    },
    {
        title = 'Muscle', icon ='car-side',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            LoadMenu(Type.Auto.muscle, Shop.PDM)
        end,
    },
    {
        title = 'Off-Road', icon ='car-side',
        iconColor = Shop.colors.pdm,
        onSelect = function()
            LoadMenu(Type.Auto.offroad, Shop.PDM)
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

-- options for ped
local mchops = {
    {
        label = 'Customize Vehicle', icon ='fa-solid fa-spray-can-sparkles',
        onSelect = function()
            SetVehicle_Details(Shop.PDM.point)
        end,
    },
}

local ped = { obj = nil, spawned = false}
local model, crd = lib.requestModel('a_m_y_business_02'), Shop.PDM.ped
local scn = 'WORLD_HUMAN_DRINKING_FACILITY'

local mch = { obj = nil, spawned = false}
local mchmodel, mchcrd = lib.requestModel('s_m_y_xmech_01'), Shop.PDM.mech
local mchscn = 'WORLD_HUMAN_DRINKING_FACILITY'

-- initial context for shop_pdm
lib.registerContext({
    id = 'shop_pdm',
    title = 'P.D.M. - Auto',
    options = options
})

RegisterNetEvent('mi_veh:c:load:pdm')
AddEventHandler('mi_veh:c:load:pdm', function()
    --lib.showContext('shop_pdm')
    LoadBlip(Shop.PDM.blip)
    LoadPed(ped.obj, model, crd, scn, pedops)
    LoadPed(mch.obj, mchmodel, mchcrd, mchscn, mchops)
end)

-- test commands
RegisterCommand('pdm', function()
    --TriggerServerEvent('mi_veh:s:load:pdm')
    --TriggerServerEvent('mi_veh:s:load:pdm')
end, false)