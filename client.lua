local speedMultiplier = 3.6
-- hey hello
local function ShowHud()
    SetNuiFocus(false, false)
    SendNUIMessage({event = "ShowUI"})
end

local function HideHud()
    SetNuiFocus(false, false)
    SendNUIMessage({event = "HideUI"})
end

function VehicleBlackList(vehicle)
    local blackListClass = {
        13 ,-- "Cycles"
        15 ,-- "Helicopters"
        16 ,-- "Planes"
        21 ,-- "Trains"
    }
    local vehicleClass = GetVehicleClass(vehicle)

    if vehicleClass then
        for _, class in pairs(blackListClass) do
            if vehicleClass == class then
                return true
            end
        end
    end
end

CreateThread(function()
    while true do
        local player = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(player)

           
        if IsPedInAnyVehicle(player) and GetIsVehicleEngineRunning(vehicle) and not VehicleBlackList(vehicle) then
            local vehicle = GetVehiclePedIsIn(player)
            local speed = math.ceil(GetEntitySpeed(vehicle) * speedMultiplier)
            local fuel = math.ceil(GetVehicleFuelLevel(vehicle))
            local engine = math.ceil(GetVehicleEngineHealth(vehicle)) / 10
            
        print(VehicleBlackList(vehicle))

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