-- loads target menu on ped for purchases
LoadMenu = function(data)
    -- create list for vehicles
    local vehicles = {}
    -- load vehicles into list
    for _, v in pairs(data) do
        vehicles[#vehicles+1] = {
            title = v.make..', '..v.model,
            description = '$'..v.maxcost,
            image = v.image,
            onSelect = function()
                print(v.make..', '..v.model)
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

-- loads object for viewing vehicle images
LoadPreview = function(mdl, loc, hdn, ops)
    
end

-- loads vehicle for physical viewing
LoadVehicle_View = function(shop, data, options)

end

-- sets details for purchased vehicle
SetVehicle_Details = function(shop, data, player, vehicle)

end