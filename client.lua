local speedMultiplier = 3.6
local fps = '50'

local function SendUI(data)
    SendNUIMessage({
        event = data.event,
        speed = data.speed,
        fuel = data.fuel
    })
end

local function VehSpeed(data)
    SendUI({
        event = "VehSpeed",
        speed = data
    })
end

local function VehFuel(data)
    SendUI({
        event = "VehSpeed",
        fuel = data
    })
end

local function ShowHud()
    SetNuiFocus(false, false)
    SendUI({event = "ShowUI"})
end

local function HideHud()
    SetNuiFocus(false, false)
    SendUI({event = "HideUI"})
end

CreateThread(function()
    while true do
        if fps == '500'  then
            Wait(500)
        elseif fps == '50' then
            Wait(50)
        end
        local player = PlayerPedId()

        if IsPedInAnyVehicle(player) and not IsThisModelABicycle(vehicle) then
            local vehicle = GetVehiclePedIsIn(player)
            local speed = math.ceil(GetEntitySpeed(vehicle) * speedMultiplier)
            local fuel = math.ceil(GetVehicleFuelLevel(vehicle))

            ShowHud()
            VehSpeed(speed)
            VehFuel(fuel)
            Wait(0)
        elseif not IsPedInAnyVehicle(player) and not IsThisModelABicycle(vehicle) then
            HideHud()
            Wait(1500)
        end
    end
end)