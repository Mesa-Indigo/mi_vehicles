-- stop for animation from ped
local station = {
    innocence_blvd = {
        heading = 89.671, label = 'Hands On Car Wash: Innocence Blvd',
        stop = vec4(-9.531, -1392.795, 29.051, 202.905),
        ped = {
            model = '',
            spawn = vec4(-702.774, -916.895, 19.214, 177.658),
            wash = vec4(-699.787, -934.965, 19.013, 355.794)
        }
    },
    carson_ave = {
        heading = 89.671, label = 'Hands On Car Wash: Carson Ave',
        stop = vec4(177.033, -1736.887, 28.992, 89.565),
        ped = {
            model = '',
            spawn = vec4(-702.774, -916.895, 19.214, 177.658),
            wash = vec4(-699.787, -934.965, 19.013, 355.794)
        }
    },
    paleto_bay = {
        heading = 89.671, label = 'Hands On Car Wash: Paleto Bay',
        stop = vec4(-74.715, 6428.270, 31.141, 224.575),
        ped = {
            model = '',
            spawn = vec4(-702.774, -916.895, 19.214, 177.658),
            wash = vec4(-699.787, -934.965, 19.013, 355.794)
        }
    },
    sandy_shore = {
        heading = 89.671, label = 'Hands On Car Wash: Sandy Shores',
        stop = vec4(1361.667, 3591.646, 34.630, 290.049),
        ped = {
            model = '',
            spawn = vec4(-702.774, -916.895, 19.214, 177.658),
            wash = vec4(-699.787, -934.965, 19.013, 355.794)
        }
    },

    little_seoul = {
        heading = 89.671, label = 'Hands On Car Wash: Little Seoul',
        stop = vec4(-699.790, -932.305, 18.715, 179.835),
        ped = {
            model = 'g_m_m_chigoon_01',
            spawn = vec4(-702.774, -916.895, 19.214, 177.658),
        }
    },
}

local ped

RegisterNetEvent('miv:c:cleanvehicle')
AddEventHandler('miv:c:cleanvehicle', function(loc, veh)
    -- create point
    local point = lib.points.new({
        coords = loc.stop,
        distance = 3,
    })

    -- create ped
    local model = lib.requestModel(loc.ped.model, 300)
    local crd = loc.ped.spawn
    ped = CreatePed(ped, model, crd.x, crd.y, crd.z-1, crd.w, true, false)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)

    -- set to cleaning location
    local gocd1, gocd2 = loc.ped.goloc, loc.ped.wash
    TaskGoToCoordAnyMeans(ped, gocd1.x, gocd1.y, gocd1.z, 1.0, 0, false, 2, 2.0)
    Citizen.Wait(500)
    TaskGoToCoordAnyMeans(ped, gocd2.x, gocd2.y, gocd2.z, 1.0, 0, false, 2, 2.0)
end)

RegisterCommand('cleancar', function()
    TriggerEvent('miv:c:cleanvehicle', station.little_seoul)
end, false)