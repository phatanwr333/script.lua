--[[
░▒█▀▀▄░█▀▀▄░█▀▀░█▀▄░░▀░░▀█▀░░░▀█▀░▄▀▀▄░░░▄▀▀▄░█░░░░█▀▀▄░▀█▀░█▀▀▄░█▀▀▄░█░░░█░█▀▀▄░█▀▀█░█▀▀█░█▀▀█
░▒█░░░░█▄▄▀░█▀▀░█░█░░█▀░░█░░░░░█░░█░░█░░░█▄▄█░█▀▀█░█▄▄█░░█░░█▄▄█░█░▒█░▀▄█▄▀░█▄▄▀░░▒▀▄░░▒▀▄░░▒▀▄
░▒█▄▄▀░▀░▀▀░▀▀▀░▀▀░░▀▀▀░░▀░░░░░▀░░░▀▀░░░░█░░░░▀░░▀░▀░░▀░░▀░░▀░░▀░▀░░▀░░▀░▀░░▀░▀▀░█▄▄█░█▄▄█░█▄▄█                                            
]]  
repeat task.wait() until game.Players.LocalPlayer

local sethiddenproperty = sethiddenproperty or set_hidden_property or set_hidden_prop
local Lighting = game:GetService("Lighting")
local UserInputService = game:GetService("UserInputService")
local Terrain = workspace.Terrain

function FPSBOOST_Extra(v)
    if v:IsA("Decal") or v:IsA("Texture") then
        v.Texture = ""
    elseif v:IsA("Sky") then
        v.StarCount = 0
        v.CelestialBodiesShown = false
        v.Parent = nil
    elseif v:IsA("MeshPart") then
        v.Material = Enum.Material.SmoothPlastic
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    elseif v:IsA("SpecialMesh") then
        v.TextureId = 0
    elseif v:IsA("ShirtGraphic") then
        v.Graphic = 0
    elseif v:IsA("Shirt") or v:IsA("Pants") then
        v[v.ClassName .. "Template"] = 0
    elseif v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart") then
        v.Material = Enum.Material.SmoothPlastic
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Atmosphere") then
        v.Density = 0
        v.Offset = 0
        v.Glare = 0
        v.Haze = 0
    elseif v:IsA("SurfaceAppearance") then
        v:Destroy()
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Sparkles") or v:IsA("Smoke") or v:IsA("Fire") then
        v.Enabled = false
    end

    for _, effect in pairs(Lighting:GetChildren()) do
        if effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") or effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect") or effect:IsA("DepthOfFieldEffect") then
            effect.Enabled = false
        end
    end

    Lighting.GlobalShadows = false
    Lighting.FogStart = 9e9
    Lighting.FogEnd = 9e9
    Lighting.ShadowSoftness = 0

    Terrain.WaterWaveSize = 0
    Terrain.WaterWaveSpeed = 0
    Terrain.WaterReflectance = 0
    Terrain.WaterTransparency = 0

    local RenderSettings = settings():GetService("RenderSettings")
	local UserGameSettings = UserSettings():GetService("UserGameSettings")

    RenderSettings.EagerBulkExecution = false
	RenderSettings.QualityLevel = Enum.QualityLevel.Level01
	RenderSettings.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level01
	UserGameSettings.SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1
	workspace.InterpolationThrottling = Enum.InterpolationThrottlingMode.Enabled

    if sethiddenproperty then
        sethiddenproperty(Lighting, "Technology", Enum.Technology.Compatibility)
        sethiddenproperty(Terrain, "Decoration", false)
    end
end

for _, v in next, game:GetDescendants() do
    FPSBOOST_Extra(v)
end

for _, v in next, game:GetService("Players"):GetDescendants() do
    FPSBOOST_Extra(v)
end

workspace.DescendantAdded:Connect(function(v)
    FPSBOOST_Extra(v)
end)

UserInputService.WindowFocused:Connect(function()
    setfpscap(360)
end)

UserInputService.WindowFocusReleased:Connect(function()
    setfpscap(360)
end)
