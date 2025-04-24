local maxSpeedDefault = Config.MaxSpeed / 3.6 

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local vehicle = GetVehiclePedIsIn(ped, false)
            if GetPedInVehicleSeat(vehicle, -1) == ped then 
                local model = GetEntityModel(vehicle)
                local modelName = GetDisplayNameFromVehicleModel(model):lower()

                local maxSpeed = Config.SpecialVehicles[modelName] and (Config.SpecialVehicles[modelName] / 3.6) or maxSpeedDefault
                local speed = GetEntitySpeed(vehicle)

                if speed > maxSpeed then
                    local excessSpeed = speed - maxSpeed
                    local brakeForce = math.min(excessSpeed / maxSpeed, 0.1) 

                    local forwardVector = GetEntityForwardVector(vehicle)
                    ApplyForceToEntity(vehicle, 0, -brakeForce * forwardVector.x, -brakeForce * forwardVector.y, 0, 0, 0, 0, false, true, true, false, true, true)
                end
                SetEntityMaxSpeed(vehicle, maxSpeed * 1.05) 
            end
        end
        Wait(100) 
    end
end)