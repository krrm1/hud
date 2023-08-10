local speedMultiplier = 3.6

local function ShowHud()
    SetNuiFocus(false, false)
    SendNUIMessage({event = "ShowUI"})
end

local function HideHud()
    SetNuiFocus(false, false)
    SendNUIMessage({event = "HideUI"})
end

CreateThread(function()
    while true do
        local player = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(player)

        if IsPedInAnyVehicle(player) and GetIsVehicleEngineRunning(vehicle) then
            local vehicle = GetVehiclePedIsIn(player)
            local speed = math.ceil(GetEntitySpeed(vehicle) * speedMultiplier)
            local fuel = math.ceil(GetVehicleFuelLevel(vehicle))
            local engine = math.ceil(GetVehicleEngineHealth(vehicle)) / 10

            ShowHud()
            SendNUIMessage({
                event = 'VehSpeed',
                speed = speed,
                fuel = fuel,
                engine = engine
            })
            Wait(100)
        elseif not IsPedInAnyVehicle(player) then
            HideHud()
            Wait(1000)
        elseif not GetIsVehicleEngineRunning(vehicle) then
            HideHud()
            Wait(1000)
        end
        Wait(50)
    end
end)