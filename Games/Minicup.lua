local LocalSystemLanguage = shared.LocalSystemLanguage or "en-us"

if LocalSystemLanguage == "pt-br" then
    -- Português (pt-BR)
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    local Window = Rayfield:CreateWindow({
        Name             = "Luiz Hub - Ver: WIP",
        Icon             = 0,
        LoadingTitle     = "Luiz Hub",
        LoadingSubtitle  = "O Script Não Lançado",
        ShowText         = "Luiz Hub",
        Theme            = "Default",
        DisableRayfieldPrompts = false,
        DisableBuildWarnings   = false,
        ConfigurationSaving = {
            Enabled   = true,
            FolderName= nil,
            FileName  = "Luiz Hub"
        }
    })

    local Tab     = Window:CreateTab("Blatant", 4483362458)
    local Section = Tab:CreateSection("Reach")

    local DefaultPlayerSize     = Vector3.new()
    local DefaultPlayerMassless = false
    local DefaultBallSize       = Vector3.new()
    local PlayerSize            = 25
    local BallSize              = 15
    local PlayerConn, BallConn

    local function RestoreDefaults()
        local LP = game.Players.LocalPlayer
        if LP and LP.Character then
            local HitBox = LP.Character:FindFirstChild("PlayerHitBox")
            if HitBox then
                HitBox.Size     = DefaultPlayerSize
                HitBox.Massless = DefaultPlayerMassless
            end
        end
        local BallModel = workspace:FindFirstChild("Ball")
        if BallModel then
            local BallHB = BallModel:FindFirstChild("ballHB_Server")
            if BallHB then
                BallHB.Size = DefaultBallSize
            end
        end
    end

    Tab:CreateToggle({
        Name     = "Expandir o Hitboxes",
        Flag     = "ExpandHitboxes",
        Callback = function(IsEnabled)
            local RunService = game:GetService("RunService")

            if IsEnabled then
                local LP = game.Players.LocalPlayer
                if LP and LP.Character then
                    local HB = LP.Character:FindFirstChild("PlayerHitBox")
                    if HB then
                        DefaultPlayerSize     = HB.Size
                        DefaultPlayerMassless = HB.Massless
                    end
                end

                local BallModel = workspace:FindFirstChild("Ball")
                if BallModel then
                    local BallHB = BallModel:FindFirstChild("ballHB_Server")
                    if BallHB then
                        DefaultBallSize = BallHB.Size
                    end
                end

                PlayerConn = RunService.Heartbeat:Connect(function()
                    local LP2 = game.Players.LocalPlayer
                    if LP2 and LP2.Character then
                        local HB2 = LP2.Character:FindFirstChild("PlayerHitBox")
                        if HB2 then
                            HB2.Size     = Vector3.new(PlayerSize, PlayerSize, PlayerSize)
                            HB2.Massless = true
                        end
                    end
                end)

                BallConn = RunService.Heartbeat:Connect(function()
                    local BM2 = workspace:FindFirstChild("Ball")
                    if BM2 then
                        local BHB2 = BM2:FindFirstChild("ballHB_Server")
                        if BHB2 then
                            BHB2.Size = Vector3.new(BallSize, BallSize, BallallSize)
                        end
                    end
                end)

                Rayfield:Notify({
                    Title    = "Depuração: Hitbox Expandido",
                    Content  = string.format("Jogador: %d | Bola: %d", PlayerSize, BallSize),
                    Duration = 4.5,
                })

            else
                if PlayerConn then PlayerConn:Disconnect() end
                if BallConn   then BallConn:Disconnect()   end
                RestoreDefaults()

                Rayfield:Notify({
                    Title    = "Depuração: Hitbox Restaurado",
                    Content  = "Todas as hitboxes retornaram aos tamanhos padrões.",
                    Duration = 4.5,
                })
            end
        end,
    })

    Tab:CreateDivider()

    Tab:CreateSlider({
        Name         = "Tamanho de Hitbox do Jogador",
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
        Name         = "Tamanho de Hitbox da Bola",
        Range        = {1, 50},
        Increment    = 1,
        Suffix       = "Studs",
        CurrentValue = BallSize,
        Flag         = "BallSize",
        Callback     = function(Value)
            BallSize = Value
        end,
    })

    Rayfield:Notify({
        Title    = "Este Script Não Está Finalizado",
        Content  = "Todos os recursos são experimentais e sujeitos a alterações.",
        Duration = 6.5,
    })

else
    -- English (en-US)
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    local Window = Rayfield:CreateWindow({
        Name             = "Luiz Hub - Ver: WIP",
        Icon             = 0,
        LoadingTitle     = "Luiz Hub",
        LoadingSubtitle  = "The Unreleased Script",
        ShowText         = "Luiz Hub",
        Theme            = "Default",
        DisableRayfieldPrompts = false,
        DisableBuildWarnings   = false,
        ConfigurationSaving = {
            Enabled   = true,
            FolderName= nil,
            FileName  = "Luiz Hub"
        }
    })

    local Tab     = Window:CreateTab("Blatant", 4483362458)
    local Section = Tab:CreateSection("Reach")

    local DefaultPlayerSize     = Vector3.new()
    local DefaultPlayerMassless = false
    local DefaultBallSize       = Vector3.new()
    local PlayerSize            = 25
    local BallSize              = 15
    local PlayerConn, BallConn

    local function RestoreDefaults()
        local LP = game.Players.LocalPlayer
        if LP and LP.Character then
            local HB = LP.Character:FindFirstChild("PlayerHitBox")
            if HB then
                HB.Size     = DefaultPlayerSize
                HB.Massless = DefaultPlayerMassless
            end
        end
        local BallModel = workspace:FindFirstChild("Ball")
        if BallModel then
            local BHB = BallModel:FindFirstChild("ballHB_Server")
            if BHB then
                BHB.Size = DefaultBallSize
            end
        end
    end

    Tab:CreateToggle({
        Name     = "Expand The Hitboxes",
        Flag     = "ExpandHitboxes",
        Callback = function(IsEnabled)
            local RunService = game:GetService("RunService")

            if IsEnabled then
                local LP = game.Players.LocalPlayer
                if LP and LP.Character then
                    local HB = LP.Character:FindFirstChild("PlayerHitBox")
                    if HB then
                        DefaultPlayerSize     = HB.Size
                        DefaultPlayerMassless = HB.Massless
                    end
                end

                local BallModel = workspace:FindFirstChild("Ball")
                if BallModel then
                    local BHB = BallModel:FindFirstChild("ballHB_Server")
                    if BHB then
                        DefaultBallSize = BHB.Size
                    end
                end

                PlayerConn = RunService.Heartbeat:Connect(function()
                    local LP2 = game.Players.LocalPlayer
                    if LP2 and LP2.Character then
                        local HB2 = LP2.Character:FindFirstChild("PlayerHitBox")
                        if HB2 then
                            HB2.Size     = Vector3.new(PlayerSize, PlayerSize, PlayerSize)
                            HB2.Massless = true
                        end
                    end
                end)

                BallConn = RunService.Heartbeat:Connect(function()
                    local BM2 = workspace:FindFirstChild("Ball")
                    if BM2 then
                        local BHB2 = BM2:FindFirstChild("ballHB_Server")
                        if BHB2 then
                            BHB2.Size = Vector3.new(BallSize, BallSize, BallSize)
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

    Tab:CreateDivider()

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

    Rayfield:Notify({
        Title    = "This Script Is Not Finished",
        Content  = "All features are experimental and subject to change.",
        Duration = 6.5,
    })
end
