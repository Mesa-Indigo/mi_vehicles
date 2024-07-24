-- words
PlayerTeleport = function(ped, x, y, z, h)
    SetEntityCoords(ped, x, y, z-1, false, false, false, false)
    SetEntityHeading(ped, h)
end

-- words
DoNotify = function(data, type)
    lib.notify({
        id = data.id, title = data.tx, description = data.dc,
        duration = NtIf.dur, showDuration = NtIf.sdr, position = NtIf.psn,
        style = {
            backgroundColor = type.cl_bg, color = type.cl_tx,
            ['.description'] = { color = type.cl_dc }
        },
        icon = type.ic_ds, iconColor = type.cl_ic, iconAnimation = type.ic_am
    })
end