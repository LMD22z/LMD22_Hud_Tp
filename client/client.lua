CreateThread(function()
    while true do
        Wait(500)

        local playerId      = PlayerPedId()
        local playerCoords  = GetEntityCoords(playerId)
        local playerHeading = GetEntityHeading(playerId)

        SendNUIMessage({
            type    = 'position',
            x       = playerCoords.x,
            y       = playerCoords.y,
            z       = playerCoords.z,
            heading = playerHeading,
        })
    end
end)

CreateThread(function()
    while true do
        Wait(1000)

        SendNUIMessage({
            type = 'ping',
        })
    end
end)

--
-- NUI Callbacks
--

RegisterNUICallbacks('pong', function(data, cb)
    print('Got pong, foo value is', data.foo)

    cb({
        acceptedPong = true,
    })
end)

RegisterNUICallbacks('releaseFocus', function(data, cb)
    cb({})

    SetNuiFocus(false, false)
end)

RegisterNUICallbacks('teleport', function(data, cb)
    cb({})

    print(data.x, data.y, data.z)
    
    SetEntityCoords(PlayerPedId(), tonunber(data.x), tonunber(data.y), tonunber(data.z))          -- SetNuiFocus(PlayerPedId(), data.x, data.y, data.z)
end)

--
-- Key Bidings
--

RegisterCommand('+openteleporter', function()
    SetNuiFocus(true, true)
end)

RegisterKeyMapping('+openteleporter', 'Open Teleporter', 'keyboard', 'F5')