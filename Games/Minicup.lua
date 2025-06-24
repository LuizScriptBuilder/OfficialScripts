local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Luiz Hub - Ver: WIP",
    Icon = 0,
    LoadingTitle = "Luiz Hub",
    LoadingSubtitle = "The Unreleased Script",
    ShowText = "Luiz Hub",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Luiz Hub"
    }
})

local Tab = Window:CreateTab("Blatant", 4483362458)
local Section = Tab:CreateSection("Reach")

local DefaultPlayerSize = Vector3.new()
local DefaultBallSize   = Vector3.new()
local PlayerSize        = 25
local BallSize          = 15

Tab:CreateToggle({
    Name     = "Expand The Hitboxes",
    Flag     = "ExpandHitboxes",
    Callback = function(IsEnabled)
        local RunService = game:GetService("RunService")

        if IsEnabled then
            local LocalPlayer = game.Players.LocalPlayer
            if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("PlayerHitBox") then
                DefaultPlayerSize = LocalPlayer.Character.PlayerHitBox.Size
            end

            local BallModel = workspace:FindFirstChild("Ball")
            if BallModel then
                local BallHB = BallModel:FindFirstChild("ballHB_Server")
                if BallHB then
                    DefaultBallSize = BallHB.Size
                end
            end

            PlayerConn = RunService.Heartbeat:Connect(function()
                local LP = game.Players.LocalPlayer
                if LP and LP.Character and LP.Character:FindFirstChild("PlayerHitBox") then
                    LP.Character.PlayerHitBox.Size = Vector3.new(PlayerSize, PlayerSize, PlayerSize)
                end
            end)

            BallConn = RunService.Heartbeat:Connect(function()
                local BallModel = workspace:FindFirstChild("Ball")
                if BallModel then
                    local BallHB = BallModel:FindFirstChild("ballHB_Server")
                    if BallHB then
                        BallHB.Size = Vector3.new(BallSize, BallSize, BallSize)
                    end
                end
            end)

            Rayfield:Notify({
                Title    = "Hitboxes Expanded",
                Content  = string.format("Player: %d | Ball: %d", PlayerSize, BallSize),
                Duration = 4.5,
            })

        else
            if PlayerConn then PlayerConn:Disconnect() end
            if BallConn   then BallConn:Disconnect()   end
            RestoreDefaults()

            Rayfield:Notify({
                Title    = "Hitboxes Restored",
                Content  = "All hitboxes are back to their default sizes.",
                Duration = 4.5,
            })
        end
    end,
})

local Divider = Tab:CreateDivider()

Tab:CreateSlider({
    Name         = "Player Hitbox Size",
    Range        = {1, 50},
    Increment    = 1,
    Suffix       = "Studs",
    CurrentValue = PlayerSize,
    Flag         = "PlayerSize",
    Callback     = function(Value)
        PlayerSize = Value
    end,
})

Tab:CreateSlider({
    Name         = "Ball Hitbox Size",
    Range        = {1, 50},
    Increment    = 1,
    Suffix       = "Studs",
    CurrentValue = BallSize,
    Flag         = "BallSize",
    Callback     = function(Value)
        BallSize = Value
    end,
})

local PlayerConn, BallConn

local function RestoreDefaults()
    local LocalPlayer = game.Players.LocalPlayer
    if LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("PlayerHitBox") then
        LocalPlayer.Character.PlayerHitBox.Size = DefaultPlayerSize
    end

    local BallModel = workspace:FindFirstChild("Ball")
    if BallModel then
        local BallHB = BallModel:FindFirstChild("ballHB_Server")
        if BallHB then
            BallHB.Size = DefaultBallSize
        end
    end
end

Rayfield:Notify({
    Title    = "This Script Is Not Finished",
    Content  = "All features are experimental and subject to change.",
    Duration = 6.5
})
