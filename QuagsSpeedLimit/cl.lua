local speed = "--"
local hidehud = false

RegisterNetEvent('ToggleHud')
AddEventHandler('ToggleHud', function(toggle)
    hidehud = true
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(750)
        if IsPedInAnyVehicle(GetPlayerPed(-1)) == 1 and not IsPauseMenuActive() and not hidehud and not IsHudHidden() and IsHudPreferenceSwitchedOn() then
            local playerloc = GetEntityCoords(GetPlayerPed(-1))
            local streethash = GetStreetNameAtCoord(playerloc.x, playerloc.y, playerloc.z)
            street = GetStreetNameFromHashKey(streethash)
            speed = Config.SpeedLimit[street]
            if not speed then
                speed = "--"
            end
            SendNUIMessage({
                Speed = speed,
                Display = false
            })

        else
            dis = true
            SendNUIMessage({
                Speed = speed,
                Display = true
            })	
        end
    end

        
end)
