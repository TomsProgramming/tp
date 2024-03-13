local Trigger = TriggerServerEvent
local TriggerTokens = {}

function TriggerServerEvent(EventName, ...)
    if GetCurrentResourceName() ~= 'tp' and EventName ~= nil then
        if TriggerTokens[EventName] ~= nil then
            Trigger(TriggerTokens[EventName])
        end
    end
    Trigger(EventName, ...)
end

RegisterNetEvent('tp:get:token', function(resource, trigger, triggerToken)
    if resource == GetCurrentResourceName() then
        TriggerTokens[trigger] = triggerToken
    end
end)

TriggerServerEvent('tp:request:token', GetCurrentResourceName())