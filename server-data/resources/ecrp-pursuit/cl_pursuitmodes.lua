ControlForPursuitMode = 172

local npolchal, npolvette, npolstang, npolexp, npolchar, pollambo, uccomet2, uccomet, ucbuffalo, uccoquette, ucbanshee = "npolchal", "npolvette", "npolstang", "npolexp", "npolchar", "pollambo", "uccomet2", "uccomet", "ucbuffalo", "uccoquette", "ucbanshee"

local pursuitEnabled = false

local InPursuitModeAPlus = false

local InPursuitModeSPlus = false

local InPursuitModeA = false

-- [START]   Events for different modes

RegisterNetEvent("police:Ghost:Pursuit:A")
AddEventHandler("police:Ghost:Pursuit:A", function()
    local ped = PlayerPedId()
    if (IsPedInAnyVehicle(PlayerPedId(), true)) then
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        local Driver = GetPedInVehicleSeat(veh, -1)
        local fInitialDriveForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce')

        if IsPedSittingInAnyVehicle(ped) and IsVehicleModel(veh, npolchal) or IsVehicleModel(veh, npolvette) or
            IsVehicleModel(veh, npolstang) or IsVehicleModel(veh, npolexp) or
            IsVehicleModel(veh, npolchar) or IsVehicleModel(veh, pollambo) or IsVehicleModel(veh, uccomet2) or IsVehicleModel(veh, uccomet) or IsVehicleModel(veh, ucbuffalo) or IsVehicleModel(veh, uccoquette) or IsVehicleModel(veh, ucbanshee) then
            SetVehicleModKit(veh, 0)
            SetVehicleMod(veh, 11, 1, false)
            SetVehicleMod(veh, 12, 2, false)
            SetVehicleMod(veh, 13, 1, false)
            ToggleVehicleMod(veh, 18, false)
            exports['ecrp-hud']:Pursuitmode(1)
            exports['mythic_notify']:DoHudText('inform', 'Pursuit Mode: A')
        end
    end
end)

RegisterNetEvent("police:Ghost:Pursuit:A:Plus") -- Second Pursuit Mode
AddEventHandler("police:Ghost:Pursuit:A:Plus", function()
    local ped = PlayerPedId()
    if (IsPedInAnyVehicle(PlayerPedId(), true)) then
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        local Driver = GetPedInVehicleSeat(veh, -1)
        local fInitialDriveForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce')

        if IsPedSittingInAnyVehicle(ped) and IsVehicleModel(veh, npolchal) or IsVehicleModel(veh, npolvette) or
        IsVehicleModel(veh, npolstang) or IsVehicleModel(veh, npolexp) or
        IsVehicleModel(veh, npolchar) or IsVehicleModel(veh, pollambo) or IsVehicleModel(veh, uccomet2) or IsVehicleModel(veh, uccomet) or IsVehicleModel(veh, ucbuffalo) or IsVehicleModel(veh, uccoquette) or IsVehicleModel(veh, ucbanshee) then
            SetVehicleModKit(veh, 0)
            SetVehicleMod(veh, 11, 3, false)
            SetVehicleMod(veh, 12, 2, false)
            SetVehicleMod(veh, 13, 2, false)
            ToggleVehicleMod(veh, 18, true)
            exports['ecrp-hud']:Pursuitmode(2)
            exports['mythic_notify']:DoHudText('inform', 'Pursuit Mode: A+')
        end
    end
end)

RegisterNetEvent("police:Ghost:Pursuit:S")
AddEventHandler("police:Ghost:Pursuit:S", function()
    local ped = PlayerPedId()
    if (IsPedInAnyVehicle(PlayerPedId(), true)) then
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        local Driver = GetPedInVehicleSeat(veh, -1)
        local fInitialDriveForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce')

        if IsPedSittingInAnyVehicle(ped) and IsVehicleModel(veh, npolchal) or IsVehicleModel(veh, npolvette) or
            IsVehicleModel(veh, npolstang) or IsVehicleModel(veh, npolexp) or
            IsVehicleModel(veh, npolchar) or IsVehicleModel(veh, pollambo) or IsVehicleModel(veh, uccomet2) or IsVehicleModel(veh, uccomet) or IsVehicleModel(veh, ucbuffalo) or IsVehicleModel(veh, uccoquette) or IsVehicleModel(veh, ucbanshee) then
            SetVehicleModKit(veh, 0)
            SetVehicleMod(veh, 11, 4, false)
            SetVehicleMod(veh, 12, 2, false)
            SetVehicleMod(veh, 13, 3, false)
            ToggleVehicleMod(veh, 18, true)
            exports['ecrp-hud']:Pursuitmode(3)
            exports['mythic_notify']:DoHudText('inform', 'Pursuit Mode: S+')
        end
    end
end)

RegisterNetEvent("police:Ghost:Pursuit:Off")
AddEventHandler("police:Ghost:Pursuit:Off", function()
    local ped = PlayerPedId()
    if (IsPedInAnyVehicle(PlayerPedId(), true)) then
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        local Driver = GetPedInVehicleSeat(veh, -1)
        local fInitialDriveForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce')

        if IsPedSittingInAnyVehicle(ped) and IsVehicleModel(veh, npolchal) or IsVehicleModel(veh, npolvette) or
            IsVehicleModel(veh, npolstang) or IsVehicleModel(veh, npolexp) or
            IsVehicleModel(veh, npolchar) or IsVehicleModel(veh, pollambo) or IsVehicleModel(veh, uccomet2) or IsVehicleModel(veh, uccomet) or IsVehicleModel(veh, ucbuffalo) or IsVehicleModel(veh, uccoquette) or IsVehicleModel(veh, ucbanshee) then
            SetVehicleModKit(veh, 0)
            SetVehicleMod(veh, 11, -1, false)
            SetVehicleMod(veh, 12, -1, false)
            SetVehicleMod(veh, 13, -1, false)
            ToggleVehicleMod(veh, 18, false)
            exports['ecrp-hud']:Pursuitmode(0)
            exports['mythic_notify']:DoHudText('inform', 'Pursuit Mode: Off')
        end
    end
end)

-- [END]   Events for different modes

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        if IsPedSittingInAnyVehicle(ped) and IsVehicleModel(veh, npolchal) or IsVehicleModel(veh, npolvette) or
            IsVehicleModel(veh, npolstang) or IsVehicleModel(veh, npolexp) or
            IsVehicleModel(veh, npolchar) or IsVehicleModel(veh, pollambo) or IsVehicleModel(veh, uccomet2) or IsVehicleModel(veh, uccomet) or IsVehicleModel(veh, ucbuffalo) or IsVehicleModel(veh, uccoquette) or IsVehicleModel(veh, ucbanshee) then
            if (not IsPauseMenuActive()) and (IsDisabledControlJustPressed(0, ControlForPursuitMode)) and InPursuitModeA == false then
                InPursuitModeA = true
                TriggerEvent('police:Ghost:Pursuit:A')

                while InPursuitModeA == true do
                    Citizen.Wait(5)
                    if (not IsPauseMenuActive()) and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() and (IsDisabledControlJustPressed(0, ControlForPursuitMode))  then
                        InPursuitModeA = false
                        InPursuitModeAPlus = true
                        TriggerEvent('police:Ghost:Pursuit:A:Plus')

                        while InPursuitModeAPlus == true do
                            Citizen.Wait(5)
                            if (not IsPauseMenuActive()) and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() and (IsDisabledControlJustPressed(0, ControlForPursuitMode))  then
                                InPursuitModeAPlus = false
                                InPursuitModeSPlus = true
                                TriggerEvent('police:Ghost:Pursuit:S')

                                while InPursuitModeSPlus == true do
                                    Citizen.Wait(5)
                                    if (not IsPauseMenuActive()) and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() and (IsDisabledControlJustPressed(0, ControlForPursuitMode))  then
                                        InPursuitModeSPlus = false
                                        InPursuitModeA = false
                                        TriggerEvent('police:Ghost:Pursuit:Off')
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(0)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if InPursuitModeA == true then
      SetVehicleCheatPowerIncrease(veh, 1.1)
    elseif InPursuitModeAPlus == true then
      SetVehicleCheatPowerIncrease(veh, 1.25)
    elseif InPursuitModeSPlus == true then
      SetVehicleCheatPowerIncrease(veh, 1.4)
    end
  end
end)
