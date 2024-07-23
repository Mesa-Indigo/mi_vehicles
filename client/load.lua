-- variables


-- local functions
function LoadBlips()
    for _, garages in pairs(Garage.List) do
        local blipData = garages.blip

        -- Create the blip
        local blip = AddBlipForCoord(blipData.x, blipData.y, 0)

        -- Set blip properties
        SetBlipSprite(blip, Garage.Blip.spr)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, Garage.Blip.scl)
        SetBlipColour(blip, Garage.Blip.clr)
        SetBlipAsShortRange(blip, true)

        -- Set blip name
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Garage.Blip.lbl)
        EndTextCommandSetBlipName(blip)
    end
end

LoadBlips()