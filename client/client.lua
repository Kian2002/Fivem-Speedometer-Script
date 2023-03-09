function showSpeedometer(speed)
    SendNUIMessage({
        action = "show",
        speed = speed * 2.236936 -- Convert to MPH
    })
end

function hideSpeedometer()
    SendNUIMessage({
        action = "hide"
    })
end

Citizen.CreateThread(function() 
    while true do
        local pedVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        if pedVehicle ~= 0 and GetIsVehicleEngineRunning(pedVehicle) then
            showSpeedometer(GetEntitySpeed(pedVehicle)) 
        else
            hideSpeedometer()
        end

        HideHudComponentThisFrame(7)
        ShowHudComponentThisFrame(9)

        Citizen.Wait(100)
    end
end)