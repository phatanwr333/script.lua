--[[
░▒█▀▀▄░█▀▀▄░█▀▀░█▀▄░░▀░░▀█▀░░░▀█▀░▄▀▀▄░░░▄▀▀▄░█░░░░█▀▀▄░▀█▀░█▀▀▄░█▀▀▄░█░░░█░█▀▀▄░█▀▀█░█▀▀█░█▀▀█
░▒█░░░░█▄▄▀░█▀▀░█░█░░█▀░░█░░░░░█░░█░░█░░░█▄▄█░█▀▀█░█▄▄█░░█░░█▄▄█░█░▒█░▀▄█▄▀░█▄▄▀░░▒▀▄░░▒▀▄░░▒▀▄
░▒█▄▄▀░▀░▀▀░▀▀▀░▀▀░░▀▀▀░░▀░░░░░▀░░░▀▀░░░░█░░░░▀░░▀░▀░░▀░░▀░░▀░░▀░▀░░▀░░▀░▀░░▀░▀▀░█▄▄█░█▄▄█░█▄▄█                                            
]]  
--[[                                    
repeat task.wait() until game.Players.LocalPlayer

if not getgenv().Config then
    local config = {
        disabled = {
            texture = true,
            part = true,
            graphic = true,
            blur = true,
            terrain = true,
            shadow = true,
            explosion = true,
            particles = true
        },
        performance = {
            setfps = 120,
            whitescreen = false
        }
    }
    getgenv().Config = config
end
]]
repeat task.wait() until game.Players.LocalPlayer
repeat task.wait() until game.Lighting
repeat task.wait() until game.Workspace.Terrain

local game = game
local Workspace = game.Workspace
local Lighting = game.Lighting
local Terrain = Workspace.Terrain
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local sethiddenproperty = sethiddenproperty or (function(...) return ... end)

local function disableObject(v)
    pcall(function()
        -- Disable textures
        if getgenv().Config.disabled.texture then
            if v:IsA("Decal") or v:IsA("Texture") then
                v.Texture = ""
            elseif v:IsA("Sky") then
                v.Parent = nil
            elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v.Enabled = false
            elseif v:IsA("MeshPart") then
                v.Material = "Plastic"
                v.Reflectance = 0
                v.TextureID = 10385902758728957
            elseif v:IsA("SpecialMesh") then
                v.TextureId = 0
            elseif v:IsA("ShirtGraphic") then
                v.Graphic = 0
            elseif (v:IsA("Shirt") or v:IsA("Pants")) then
                v[v.ClassName.."Template"] = 0
            end
        end

        -- Disable parts
        if getgenv().Config.disabled.part then
            if v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic
            end
        end

        -- Disable explosions
        if getgenv().Config.disabled.explosion then
            if v:IsA("Explosion") then
                v.BlastPressure = 1
                v.BlastRadius = 1
            end
        end

        -- Disable particles
        if getgenv().Config.disabled.particles then
            if v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Lifetime = NumberRange.new(0)
            end
        end

        -- Modify Lighting and Terrain settings for performance
        sethiddenproperty(Lighting, "Technology", 2)
        sethiddenproperty(Terrain, "Decoration", false)
        settings().Rendering.QualityLevel = 1
        settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level04
    end)
end

-- Apply changes to existing descendants
for _, v in next, game:GetDescendants() do
    disableObject(v)
end

-- Apply changes to newly added descendants
workspace.DescendantAdded:Connect(function(v)
    disableObject(v)
end)

-- Disable blur effects
if getgenv().Config.disabled.blur then
    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") or effect:IsA("DepthOfFieldEffect") then
            effect.Enabled = false
        end
    end
end

-- Disable shadows
if getgenv().Config.disabled.shadow then
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    Lighting.ShadowSoftness = 0
end

-- Disable graphic effects on terrain
if getgenv().Config.disabled.graphic then
    local terrain = Workspace:FindFirstChildOfClass("Terrain")
    if not terrain then
        repeat task.wait() until terrain
    end
    terrain.WaterWaveSize = 0
    terrain.WaterWaveSpeed = 0
    terrain.WaterReflectance = 0
    terrain.WaterTransparency = 0
end

-- Handle window focus events for performance
UserInputService.WindowFocused:Connect(function()
    if getgenv().Config.performance.whitescreen then
        RunService:Set3DRenderingEnabled(true)
    end
    if getgenv().Config.performance.setfps and type(getgenv().Config.performance.setfps) == "number" then
        setfpscap(tonumber(getgenv().Config.performance.setfps))
    end
end)

UserInputService.WindowFocusReleased:Connect(function()
    if getgenv().Config.performance.whitescreen then
        RunService:Set3DRenderingEnabled(true)
    end
    if getgenv().Config.performance.setfps and type(getgenv().Config.performance.setfps) == "number" then
        setfpscap(tonumber(getgenv().Config.performance.setfps))
    end
end)

print("FPS Boost Completed")
