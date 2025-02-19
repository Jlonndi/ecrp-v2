ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

function onStartup()
    if Config.NoAutoHealthRegen then
        SetPlayerHealthRechargeLimit(PlayerId(), 0)
    end

    if Config.Trains then
        SwitchTrainTrack(0, true) -- enable trains 
        SwitchTrainTrack(3, true)
        SetRandomTrains(1)
    end

    SetFlashLightKeepOnWhileMoving(Config.FlashlightOnWhenMoving)

    if Config.NoGangsAttack then
        -- no agresive gangs
        SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_HILLBILLY"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_BALLAS"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_MEXICAN"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_FAMILY"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_MARABUNTE"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_SALVA"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("GANG_1"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("GANG_2"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("GANG_9"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("GANG_10"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("FIREMAN"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("MEDIC"), GetHashKey('PLAYER'))
        SetRelationshipBetweenGroups(1, GetHashKey("COP"), GetHashKey('PLAYER'))
    end

    if Config.NoHeadshots then
        SetPedSuffersCriticalHits(GetPlayerPed(-1), false)
    end
end

AddEventHandler("playerSpawned", function()
    Citizen.Wait(3000)
    onStartup()
    if Config.Populate then
        PopulateNow()
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if Config.NoAutoHealthRegen then
            SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0) -- disable auto health regen
        end

        if Config.NoRandomDispatch then
            SetCreateRandomCops(0) -- disable random cops and effects
            CancelCurrentPoliceReport()
            DistantCopCarSirens(false)
            for i = 1, 16 do
                EnableDispatchService(i, false)
            end
        end

        if Config.AlterWeaponDamage then
            SetWeaponDamageModifierThisFrame(0x92A27487, Config.WpDmgMult.dagger)
            SetWeaponDamageModifierThisFrame(0x958A4A8F, Config.WpDmgMult.bat)
            SetWeaponDamageModifierThisFrame(0xF9E6AA4B, Config.WpDmgMult.bottle)
            SetWeaponDamageModifierThisFrame(0x84BD7BFD, Config.WpDmgMult.crowbar)
            SetWeaponDamageModifierThisFrame(0xA2719263, Config.WpDmgMult.unarmed)
            SetWeaponDamageModifierThisFrame(0x8BB05FD7, Config.WpDmgMult.flashlight)
            SetWeaponDamageModifierThisFrame(0x440E4788, Config.WpDmgMult.golfclub)
            SetWeaponDamageModifierThisFrame(0x4E875F73, Config.WpDmgMult.hammer)
            SetWeaponDamageModifierThisFrame(0xF9DCBF2D, Config.WpDmgMult.hatchet)
            SetWeaponDamageModifierThisFrame(0xD8DF3C3C, Config.WpDmgMult.knuckle)
            SetWeaponDamageModifierThisFrame(0x99B507EA, Config.WpDmgMult.knife)
            SetWeaponDamageModifierThisFrame(0xDD5DF8D9, Config.WpDmgMult.machete)
            SetWeaponDamageModifierThisFrame(0xDFE37640, Config.WpDmgMult.switchblade)
            SetWeaponDamageModifierThisFrame(0x678B81B1, Config.WpDmgMult.nightstick)
            SetWeaponDamageModifierThisFrame(0x19044EE0, Config.WpDmgMult.wrench)
            SetWeaponDamageModifierThisFrame(0xCD274149, Config.WpDmgMult.battleaxe)
            SetWeaponDamageModifierThisFrame(0x94117305, Config.WpDmgMult.poolcue)
            SetWeaponDamageModifierThisFrame(0x3813FC08, Config.WpDmgMult.stonehatchet)
            SetWeaponDamageModifierThisFrame(0x1B06D571, Config.WpDmgMult.pistol)
            SetWeaponDamageModifierThisFrame(0x5EF9FEC4, Config.WpDmgMult.combatpistol)
            SetWeaponDamageModifierThisFrame(0x22D8FE39, Config.WpDmgMult.appistol)
            SetWeaponDamageModifierThisFrame(0x99AEEB3B, Config.WpDmgMult.pistol50)
            SetWeaponDamageModifierThisFrame(0xBFD21232, Config.WpDmgMult.snspistol)
            SetWeaponDamageModifierThisFrame(0xD205520E, Config.WpDmgMult.heavypistol)
            SetWeaponDamageModifierThisFrame(0x83839C4, Config.WpDmgMult.vintagepistol)
            SetWeaponDamageModifierThisFrame(0xC1B3C3D1, Config.WpDmgMult.revolver)
            SetWeaponDamageModifierThisFrame(0x97EA20B8, Config.WpDmgMult.doubleaction)
            SetWeaponDamageModifierThisFrame(0x2B5EF5EC, Config.WpDmgMult.ceramicpistol)
            SetWeaponDamageModifierThisFrame(0x917F6C8C, Config.WpDmgMult.navyrevolver)
            SetWeaponDamageModifierThisFrame(0x13532244, Config.WpDmgMult.microsmg)
            SetWeaponDamageModifierThisFrame(0x2BE6766B, Config.WpDmgMult.smg)
            SetWeaponDamageModifierThisFrame(0xEFE7E2DF, Config.WpDmgMult.assaultsmg)
            SetWeaponDamageModifierThisFrame(0xA3D4D34, Config.WpDmgMult.combatpdw)
            SetWeaponDamageModifierThisFrame(0xDB1AA450, Config.WpDmgMult.machinepistol)
            SetWeaponDamageModifierThisFrame(0xBD248B55, Config.WpDmgMult.minismg)
            SetWeaponDamageModifierThisFrame(0x1D073A89, Config.WpDmgMult.pumpshotgun)
            SetWeaponDamageModifierThisFrame(0x7846A318, Config.WpDmgMult.sawnoffshotgun)
            SetWeaponDamageModifierThisFrame(0xE284C527, Config.WpDmgMult.assaultshotgun)
            SetWeaponDamageModifierThisFrame(0x9D61E50F, Config.WpDmgMult.bullpupshotgun)
            SetWeaponDamageModifierThisFrame(0xA89CB99E, Config.WpDmgMult.musket)
            SetWeaponDamageModifierThisFrame(0x3AABBBAA, Config.WpDmgMult.heavyshotgun)
            SetWeaponDamageModifierThisFrame(0xEF951FBB, Config.WpDmgMult.dbshotgun)
            SetWeaponDamageModifierThisFrame(0x12E82D3D, Config.WpDmgMult.autoshotgun)
            SetWeaponDamageModifierThisFrame(0xBFEFFF6D, Config.WpDmgMult.assaultrifle)
            SetWeaponDamageModifierThisFrame(0x83BF0278, Config.WpDmgMult.carbinerifle)
            SetWeaponDamageModifierThisFrame(0xAF113F99, Config.WpDmgMult.advancedrifle)
            SetWeaponDamageModifierThisFrame(0xC0A3098D, Config.WpDmgMult.specialcarbine)
            SetWeaponDamageModifierThisFrame(0x7F229F94, Config.WpDmgMult.bullpuprifle)
            SetWeaponDamageModifierThisFrame(0x624FE830, Config.WpDmgMult.compactrifle)
            SetWeaponDamageModifierThisFrame(0x61012683, Config.WpDmgMult.gusenberg)
            SetWeaponDamageModifierThisFrame(0x5FC3C11, Config.WpDmgMult.sniperrifle)
            SetWeaponDamageModifierThisFrame(0xC472FE2, Config.WpDmgMult.heavysniper)
            SetWeaponDamageModifierThisFrame(0xC734385A, Config.WpDmgMult.marksmanrifle)
        end

        if Config.SameHealthForMaleAndFemalesPeds then
            if GetEntityMaxHealth(GetPlayerPed(-1)) ~= 200 then -- set female peds to same health as male.
                SetEntityMaxHealth(GetPlayerPed(-1), 200)
                SetEntityHealth(GetPlayerPed(-1), 200)
            end
        end

        if Config.DisableVehicleRewards then
            local id = PlayerId()

            DisablePlayerVehicleRewards(id)

            RemoveAllPickupsOfType('PICKUP_WEAPON_CARBINERIFLE')
            RemoveAllPickupsOfType('PICKUP_WEAPON_PISTOL')
            RemoveAllPickupsOfType('PICKUP_WEAPON_PUMPSHOTGUN')
            RemoveAllPickupsOfType('PICKUP_WEAPON_COMBATPDW')
            RemoveAllPickupsOfType('PICKUP_WEAPON_COMBATPISTOL')
        end

        if Config.KeepEngineOn then
            local playerPed = GetPlayerPed(-1)
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            local isRunning = GetIsVehicleEngineRunning(vehicle)
            if IsPedInAnyVehicle(playerPed, false) and IsControlPressed(2, 75) and not IsEntityDead(playerPed) and
                isRunning == true then
                SetVehicleEngineOn(vehicle, true, true, false)
                TaskLeaveVehicle(playerPed, vehicle, 0)
            end
        end

        SetPedDensityMultiplierThisFrame(Config.PedFrequency)
        SetScenarioPedDensityMultiplierThisFrame(Config.PedFrequency, Config.PedFrequency)
        -------------------------------
        SetRandomVehicleDensityMultiplierThisFrame(Config.TrafficFrequency)
        SetParkedVehicleDensityMultiplierThisFrame(Config.TrafficFrequency)
        SetVehicleDensityMultiplierThisFrame(Config.TrafficFrequency)

        if Config.HideHUD.WeaponStats then
            HideHudComponentThisFrame(20)
        end
        if Config.HideHUD.Reticle then
            HideHudComponentThisFrame(14)
        end
        if Config.HideHUD.CarName then
            HideHudComponentThisFrame(6)
            HideHudComponentThisFrame(8)
        end
        if Config.HideHUD.StreetName then
            HideHudComponentThisFrame(7)
            HideHudComponentThisFrame(9)
        end
    end
end)

Citizen.CreateThread(function()
  local allowshuffle = false
  local playerped=nil
  local currentvehicle=nil
	while true do
		Citizen.Wait(100)
    --constantly getting the current 
		playerped=PlayerPedId()
		--constantly get player vehicle
		currentvehicle=GetVehiclePedIsIn(playerped, false)
		if IsPedInAnyVehicle(playerped, false) and allowshuffle == false then
			--if they're trying to shuffle for whatever reason
			SetPedConfigFlag(playerped, 184, true)
			if GetIsTaskActive(playerped, 165) then
				--getting seat player is in 
				seat=0
				if GetPedInVehicleSeat(currentvehicle, -1) == playerped then
					seat=-1
				end
				--if the passenger doesn't shut the door, shut it manually
				if GetVehicleDoorAngleRatio(currentvehicle,1) > 0.0 and seat == 0 then
					SetVehicleDoorShut(currentvehicle,1,false)
				end
				--move ped back into the seat right as the animation starts
				SetPedIntoVehicle(playerped, currentvehicle, seat)
			end
		elseif IsPedInAnyVehicle(playerped, false) and allowshuffle == true then
			SetPedConfigFlag(playerped, 184, false)
		end
	end
end)

Citizen.CreateThread(function()
    if Config.Populate then
        while true do
            Citizen.Wait(20 * 1000)
            PopulateNow()
        end
    end
end)

Citizen.CreateThread(function()
    if Config.NoPlaneTurbulence then
        while true do
            Citizen.Wait(30 * 1000)
            local plane = GetVehiclePedIsIn(PlayerPedId(), false)
            if IsThisModelAPlane(GetEntityModel(plane)) then
                -- Goodbye turbulence!
                SetPlaneTurbulenceMultiplier(plane, 0.0)
            end
        end
    end
end)

Citizen.CreateThread(function()
    Wait(50)
    if Config.ShowPlayerID then
        while true do
            Citizen.Wait(1)
            miid(Config.PlayerID.LocationX, Config.PlayerID.LocationY, Config.PlayerID.Width, Config.PlayerID.Height,
                Config.PlayerID.Scale,
                "~g~ID:~w~  " .. GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))) .. '', 255, 255, 255, 255)
        end
    end
end)

Citizen.CreateThread(function()
    if Config.JumpSpam.Enable then
        local Rchance = Config.JumpSpam.Chance
        while true do
            Citizen.Wait(100)
            local ped = PlayerPedId()
            if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and
                not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then
                local chance_result = math.random()
                if chance_result < Rchance then
                    Citizen.Wait(600)
                    SetPedToRagdoll(ped, 5000, 1, 2)
                else
                    Citizen.Wait(2000)
                end
            end
        end
    end
end)

local stage = 0
local movingForward = false
Citizen.CreateThread(function()
    if Config.Crouch then
        local crouched = false

        while true do
            Citizen.Wait(1)
            local ped = PlayerPedId()
            if not IsPedSittingInAnyVehicle(ped) and not IsPedFalling(ped) and not IsPedSwimming(ped) and
                not IsPedSwimmingUnderWater(ped) then
                if IsControlJustReleased(0, 36) then
                    stage = stage + 1
                    if stage == 2 then
                        -- Crouch stuff
                        ClearPedTasks(ped)
                        RequestAnimSet("move_ped_crouched")
                        while not HasAnimSetLoaded("move_ped_crouched") do
                            Wait(0)
                        end

                        SetPedMovementClipset(ped, "move_ped_crouched", 1.0)
                        SetPedWeaponMovementClipset(ped, "move_ped_crouched", 1.0)
                        SetPedStrafeClipset(ped, "move_ped_crouched_strafing", 1.0)
                    elseif stage == 3 then
                        ClearPedTasks(ped)
                        RequestAnimSet("move_crawl")
                        while not HasAnimSetLoaded("move_crawl") do
                            Wait(0)
                        end
                    elseif stage > 3 then
                        stage = 0
                        ClearPedTasksImmediately(ped)
                        ResetAnimSet()
                        SetPedStealthMovement(ped, 0, 0)
                    end
                end

                if stage == 2 then
                    if GetEntitySpeed(ped) > 1.0 then
                        SetPedWeaponMovementClipset(ped, "move_ped_crouched", 1.0)
                        SetPedStrafeClipset(ped, "move_ped_crouched_strafing", 1.0)
                    elseif GetEntitySpeed(ped) < 1.0 and
                        (GetFollowPedCamViewMode() == 4 or GetFollowVehicleCamViewMode() == 4) then
                        ResetPedWeaponMovementClipset(ped)
                        ResetPedStrafeClipset(ped)
                    end
                elseif stage == 3 then
                    DisableControlAction(0, 21, true) -- sprint
                    DisableControlAction(1, 140, true)
                    DisableControlAction(1, 141, true)
                    DisableControlAction(1, 142, true)

                    if (IsControlPressed(0, 32) and not movingForward) and Config.EnableProne then
                        movingForward = true
                        SetPedMoveAnimsBlendOut(ped)
                        local pronepos = GetEntityCoords(ped)
                        TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", pronepos.x, pronepos.y, pronepos.z + 0.1,
                            0.0, 0.0, GetEntityHeading(ped), 100.0, 0.4, 1.0, 7, 2.0, 1, 1)
                        Wait(500)
                    elseif (not IsControlPressed(0, 32) and movingForward) then
                        local pronepos = GetEntityCoords(ped)
                        TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", pronepos.x, pronepos.y, pronepos.z + 0.1,
                            0.0, 0.0, GetEntityHeading(ped), 100.0, 0.4, 1.0, 6, 2.0, 1, 1)
                        Wait(500)
                        movingForward = false
                    end

                    if IsControlPressed(0, 34) then
                        SetEntityHeading(ped, GetEntityHeading(ped) + 1)
                    end

                    if IsControlPressed(0, 9) then
                        SetEntityHeading(ped, GetEntityHeading(ped) - 1)
                    end
                end
            else
                stage = 0
                Wait(1000)
            end
        end
    end
end)


Citizen.CreateThread(function ()
  if Config.Pause then
    while true do
      Citizen.Wait(1)
      DisableControlAction(0, 199, true)
    end
  end
end)


function miid(x, y, width, height, scale, text, r, g, b, a, outline)
    SetTextFont(8)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(0, 0, 0, 255)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width / 2, y - height / 2 + 0.005)
end

local sh = GetEntityHealth(ply)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if Config.RagdollWhenShot then
            local ply = GetPlayerPed(-1)
            if HasEntityBeenDamagedByAnyPed(ply) then
                dam = sh - GetEntityHealth(ply)
                if (dam > 0) and (GetPedArmour(ply) <= 25) then
                    if (dam >= 0) and (dam <= 5) then
                        -- print("hurt1")
                        hurtMedium(ply, dam)
                    elseif (dam >= 6) and (dam <= 10) then
                        -- print("hurt2")
                        hurtMediumBad(ply, dam)
                    elseif (dam >= 11) and (dam <= 16) then
                        -- print("hurt3")  
                        hurtPainful(ply, dam)
                    elseif dam >= 17 then
                        -- print("hurt4")
                        hurtPainful(ply, dam)
                    end
                end

                sh = GetEntityHealth(ply)
            end
            ClearEntityLastDamageEntity(ply)
        end
    end
end)

local vehicleClassDisableControl = {
  [0] = true,     --compacts
  [1] = true,     --sedans
  [2] = true,     --SUV's
  [3] = true,     --coupes
  [4] = true,     --muscle
  [5] = true,     --sport classic
  [6] = true,     --sport
  [7] = true,     --super
  [8] = false,    --motorcycle
  [9] = true,     --offroad
  [10] = true,    --industrial
  [11] = true,    --utility
  [12] = true,    --vans
  [13] = false,   --bicycles
  [14] = false,   --boats
  [15] = false,   --helicopter
  [16] = false,   --plane
  [17] = true,    --service
  [18] = true,    --emergency
  [19] = false    --military
}

Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(1)
    if Config.AirControl then
      local player = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(player, false)
        local vehicleClass = GetVehicleClass(vehicle)

        -- Disable control if player is in the driver seat and vehicle class matches array
        if ((GetPedInVehicleSeat(vehicle, -1) == player) and vehicleClassDisableControl[vehicleClass]) then
            -- Check if vehicle is in the air and disable L/R and UP/DN controls
            if IsEntityInAir(vehicle) then
                DisableControlAction(2, 59)
                DisableControlAction(2, 60)
            end
        end
    end
  end
end)

local brakeLightSpeedThresh = 0.25
Citizen.CreateThread(function()
    while true do
        -- Loop forever and update every frame
        Citizen.Wait(1)
        if Config.Brakelights then
            -- Get player and vehicle player is in
            local player = GetPlayerPed(-1)
            local vehicle = GetVehiclePedIsIn(player, false)

            -- If player is in a vehicle and it's not moving
            if (vehicle ~= nil) and (GetEntitySpeed(vehicle) <= brakeLightSpeedThresh) then
                -- Set brake lights
                SetVehicleBrakeLights(vehicle, true)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local player = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(player, false)
        local roll = GetEntityRoll(vehicle)
				if (roll > 75.0 or roll < -75.0) and GetEntitySpeed(vehicle) < 2 then
					DisableControlAction(2,59,true) -- Disable left/right
					DisableControlAction(2,60,true) -- Disable up/down
				end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if Config.LeaveEngineOn then
            local ped = PlayerPedId()

            if DoesEntityExist(ped) and IsPedInAnyVehicle(ped, false) and IsControlPressed(2, 75) and
                not IsEntityDead(ped) and not IsPauseMenuActive() then
                local engineWasRunning = GetIsVehicleEngineRunning(GetVehiclePedIsIn(ped, true))
                Citizen.Wait(1000)
                if DoesEntityExist(ped) and not IsPedInAnyVehicle(ped, false) and not IsEntityDead(ped) and
                    not IsPauseMenuActive() then
                    local veh = GetVehiclePedIsIn(ped, true)
                    if (engineWasRunning) then
                        SetVehicleEngineOn(veh, true, true, true)
                    end
                end
            end
        end
    end
end)


RegisterCommand('tackle', function()
    if not IsPedInAnyVehicle(ESX.PlayerData.ped, false) and GetEntitySpeed(ESX.PlayerData.ped) > 2.5 then
        Tackle()
    end
end)

RegisterKeyMapping('tackle', ' Tackle Player', 'keyboard', 'LMENU')

RegisterNetEvent('tackle:client:GetTackled', function()
    SetPedToRagdoll(PlayerPedId(), math.random(1000, 6000), math.random(1000, 6000), 0, 0, 0, 0)
    TimerEnabled = true
    Wait(1500)
    TimerEnabled = false
end)

function Tackle()
    closestPlayer, distance = ESX.Game.GetClosestPlayer()
    local closestPlayerPed = GetPlayerPed(closestPlayer)
    if (distance ~= -1 and distance < 2) then
        TriggerServerEvent("tackle:server:TacklePlayer", GetPlayerServerId(closestPlayer))
        TackleAnim()
    end
end

function TackleAnim()
    if not IsPedRagdoll(ESX.PlayerData.ped) then
        RequestAnimDict("swimming@first_person@diving")
        while not HasAnimDictLoaded("swimming@first_person@diving") do
            Wait(1)
        end
        if IsEntityPlayingAnim(ped, "swimming@first_person@diving", "dive_run_fwd_-45_loop", 3) then
            ClearPedTasksImmediately(ped)
        else
            TaskPlayAnim(ped, "swimming@first_person@diving", "dive_run_fwd_-45_loop", 3.0, 3.0, -1, 49, 0, false,
                false, false)
            Wait(250)
            ClearPedTasksImmediately(ped)
            SetPedToRagdoll(ped, 150, 150, 0, 0, 0, 0)
        end
    end
end

function ResetAnimSet()
  local ped = PlayerPedId()
  if walkSet == "default" then
      ResetPedMovementClipset(ped)
      ResetPedWeaponMovementClipset(ped)
      ResetPedStrafeClipset(ped)
  else
      ResetPedMovementClipset(ped)
      ResetPedWeaponMovementClipset(ped)
      ResetPedStrafeClipset(ped)
      Wait(100)
      RequestWalking(walkSet)
      SetPedMovementClipset(ped, walkSet, 1)
      RemoveAnimSet(walkSet)
  end
end

function RequestWalking(set)
  RequestAnimSet(set)
  while not HasAnimSetLoaded(set) do
      Wait(1)
  end
end

function hurtMedium(ped, r)
    if IsEntityDead(ped) then
        return false
    end
    SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
    -- print(r)
end
function hurtMediumBad(ped, r)
    if IsEntityDead(ped) then
        return false
    end
    SetPedToRagdoll(GetPlayerPed(-1), 1200, 1200, 0, 0, 0, 0)
    -- Citizen.SetTimeout( 4000, function() SetPedIsDrunk(ped, true) end)
    -- Citizen.SetTimeout( 30000, function() SetPedIsDrunk(ped, false) end)
    -- print(r)
end
function hurtBad(ped, r)
    if IsEntityDead(ped) then
        return false
    end
    SetPedToRagdoll(GetPlayerPed(-1), 1500, 1500, 0, 0, 0, 0)
    -- Citizen.SetTimeout( 5000, function() SetPedIsDrunk(ped, true) end)
    -- Citizen.SetTimeout( 120000, function() SetPedIsDrunk(ped, false) end)
    -- print(r)
end
function hurtPainful(ped, r)
    if IsEntityDead(ped) then
        return false
    end
    SetPedToRagdoll(GetPlayerPed(-1), 2000, 2000, 0, 0, 0, 0)
    -- Citizen.SetTimeout( 15000, function() SetPedIsDrunk(ped, true) end)
    -- Citizen.SetTimeout( 120000, function() SetPedIsDrunk(ped, false) end)
    -- print(r)
end
