-- loads target menu on ped for purchases
LoadMenu = function(data, shop)
    -- create list for vehicles
    local vehicles = {}
    -- load vehicles into list
    for key, value in pairs(data) do
        vehicles[#vehicles+1] = {
            title = value.make..', '..value.model,
            description = '$'..value.maxcost,
            image = value.image,
            onSelect = function()
                if Debug then
                    print('Make: '..value.make..', Model: '..value.model)
                end LoadVehicle_View(key, shop)
            end,
        }
    end
    -- show list options in menu
    lib.registerContext({
        id = 'list',
        title = 'Listed Vehicles',
        menu = 'shop_pdm',
        options = vehicles
    })
    -- load context menu
    lib.showContext('list')
end

-- loads blip for location
LoadBlip = function(shop)
    local blip = AddBlipForCoord(
    shop.loc.x, shop.loc.y, shop.loc.z)
    SetBlipSprite(blip, shop.spr)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, shop.scl)
    SetBlipColour(blip, shop.clr)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(shop.label)
    EndTextCommandSetBlipName(blip)
end

-- loads ped for purchases
LoadPed = function(ped, mdl, loc, scn, ops)
    -- create ped
    ped = CreatePed(1, mdl, loc.x, loc.y, loc.z-1.0, loc.w, true, false)
    TaskStartScenarioInPlace(ped, scn, 0, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    -- use netID to assign options
    local netId = NetworkGetNetworkIdFromEntity(ped)
    exports.ox_target:addEntity(netId, ops)
end

-- loads vehicle for physical viewing
LoadVehicle_View = function(data, shop)
    if Debug then print('Data xfrd: '..data) end
    -- notify player of spawn location
    local txt1 = {
        id = 'veh_display', tx = 'Vehicle Ready for View',
        dc = 'the chosen vehicle is in the garage to be configured'
    } DoNotify(txt1, Inf)
    -- spawn vehicle in garage location
    local cds = shop.spawn
    local vehicle = CreateVehicle(data, cds.x, cds.y, cds.z, cds.w, true, false)
    --SetVehicleOnGroundProperly(vehicle)
    SetVehicleEngineOn(vehicle, false, true, true)
    if Debug then print('Spawn: '..cds) end
end

-- sets details for purchased vehicle
SetVehicle_Details = function(shop, data, player, vehicle)

end