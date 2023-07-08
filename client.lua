local speedMultiplier = 3.6 -- or 3.6
local fps = '50'

local function SendUI(data)
    SendNUIMessage({
        event = data.event,
        label = data.label
    })
end

local function Updateinfo(data)
    SendUI({
        event = "SpawnLabel",
        label = data
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
        
            ShowHud()
            Updateinfo(speed)
            Wait(0)
        elseif not IsPedInAnyVehicle(player) and not IsThisModelABicycle(vehicle) then
            HideHud()
            Wait(1000)
        end
    end
end)