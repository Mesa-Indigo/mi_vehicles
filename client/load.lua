-- variables


-- functions
function LoadBlips()
    for _, garages in pairs(Garage.List) do
        local blipData = garages.blip
        local blip = AddBlipForCoord(blipData.x, blipData.y, 0)
        SetBlipSprite(blip, Garage.Blip.spr) SetBlipDisplay(blip, 4)
        SetBlipScale(blip, Garage.Blip.scl) SetBlipColour(blip, Garage.Blip.clr)
        SetBlipAsShortRange(blip, true) BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Garage.Blip.lbl) EndTextCommandSetBlipName(blip)
    end
    for _, mechs in pairs(Mech.List) do
        local blipData = mechs.blip
        local blip = AddBlipForCoord(blipData.x, blipData.y, 0)
        SetBlipSprite(blip, Mech.Blip.spr) SetBlipDisplay(blip, 4)
        SetBlipScale(blip, Mech.Blip.scl) SetBlipColour(blip, Mech.Blip.clr)
        SetBlipAsShortRange(blip, true) BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Mech.Blip.lbl) EndTextCommandSetBlipName(blip)
    end
end

LoadBlips()