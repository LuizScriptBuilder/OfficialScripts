local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

local function ThrottledConnect(Function)
    local Last = tick()
    return RunService.Heartbeat:Connect(function(Delta)
        local Now = tick()
        if Now - Last >= 1/60 then
            Last = Now
            local Ok, Err = pcall(Function, Delta)
            if not Ok then
                warn("Heartbeat Error:", Err)
            end
        end
    end)
end

local SupportedPlaces = {
    [11102162413] = "Minicup"
}

local PlaceId    = game.PlaceId
local ScriptKey  = SupportedPlaces[PlaceId]

if ScriptKey then
    local Url = ("https://raw.githubusercontent.com/LuizScriptBuilder/OfficialScripts/refs/heads/main/Games/%s.lua"):format(ScriptKey)
    local Success, Err = pcall(function()
        local Source = game:HttpGet(Url, true)
        assert(Source and #Source > 0, "Empty Response")
        local LoadedFunction = loadstring(Source)
        assert(type(LoadedFunction) == "function", "Invalid Chunk")
        LoadedFunction()
    end)
    if not Success then
        warn(("Failed To Load %s.lua: %s"):format(ScriptKey, Err))
    end
else
    StarterGui:SetCore("SendNotification", {
        Title    = "Failed",
        Text     = "This Game Is Not Supported On This Script",
        Duration = 5
    })
    wait(1)
    StarterGui:SetCore("SendNotification", {
        Title    = "How About This Game?",
        Text     = "Mini Cup (Place ID: 11102162413)",
        Duration = 5
    })
end
