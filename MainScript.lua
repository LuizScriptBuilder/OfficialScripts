local RunService = game:GetService("RunService")
do
    local oldConnect = RunService.Heartbeat.Connect
    RunService.Heartbeat.Connect = function(self, fn)
        local last = tick()
        return oldConnect(self, function(dt)
            local now = tick()
            if now - last >= (1/60) then
                last = now
                local ok, err = pcall(fn, dt)
                if not ok then
                    warn("Heartbeat error:", err)
                end
            end
        end)
    end
end

local SUPPORTED_PLACE = 11102162413
if game.PlaceId == SUPPORTED_PLACE then
    local Url = string.format("https://raw.githubusercontent.com/LuizScriptBuilder/OfficialScripts/refs/heads/main/Games/%d.lua", SUPPORTED_PLACE)
    local success, err = pcall(function()
        local src = game:HttpGet(Url, true)
        assert(src and #src > 0, "Empty response")
        local fn = loadstring(src)
        assert(type(fn) == "function", "Invalid chunk")
        fn()
    end)
    if not success then
        warn("Failed to load script for place ID " .. SUPPORTED_PLACE .. ":", err)
    end
else
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title    = "Failed",
        Text     = "This game is not supported on this script",
        Duration = 5,
    })
    wait(1)
    StarterGui:SetCore("SendNotification", {
        Title    = "How about this game?",
        Text     = "Mini Cup (Place ID: 11102162413)",
        Duration = 5,
    })
end
