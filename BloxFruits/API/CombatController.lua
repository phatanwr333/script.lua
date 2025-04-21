local Exports = {}

local Players = game:GetService("Players")
local Services = game:GetService("ReplicatedStorage")
local Net = Services.Modules.Net

local RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = Net:WaitForChild("RE/RegisterHit")

local function CalculateDistance(position)
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:FindFirstChild("HumanoidRootPart")

    if rootPart then
        return (position - rootPart.Position).Magnitude
    end

    return math.huge
end

function Exports.GetHits()
    local hits = {}

    for _, enemy in ipairs(workspace.Enemies:GetChildren()) do
        local primaryPart = enemy:FindFirstChild("PrimaryPart")

        if primaryPart and CalculateDistance(primaryPart.Position) < 80 then
            table.insert(hits, primaryPart)
        end
    end

    return hits
end

function Exports.Attack()
    local character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()

    if character:FindFirstChildOfClass("Tool") then
        local hits = Exports.GetHits()
        local attackRegistered = false

        for _, target in ipairs(hits) do
            if not attackRegistered then
                RegisterAttack:FireServer(0)
                attackRegistered = true
            end
            RegisterHit:FireServer(target)
        end
    end
end

return Exports
