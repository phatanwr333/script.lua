local Services = game:GetService
local Players, workspace = Services("Players"), Services("Workspace")
local LocalPlayer, Net = Players.LocalPlayer, Services("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net")
local RegisterAttack, RegisterHit = Net:WaitForChild("RE"):WaitForChild("RegisterAttack"), Net:WaitForChild("RE"):WaitForChild("RegisterHit")

local CombatModule = {}

function CombatModule.GetPrimaryPart(model)
    return model:FindFirstChild("HumanoidRootPart") or model:FindFirstChild("PrimaryPart")
end

function CombatModule.IsValidTarget(target)
    local humanoid = target and target:FindFirstChildOfClass("Humanoid")
    return humanoid and humanoid.Health > 0 and (not Players:GetPlayerFromCharacter(target) or Players:GetPlayerFromCharacter(target).Team ~= LocalPlayer.Team)
end

function CombatModule.GetNearbyTargets()
    local charPos = LocalPlayer.Character and LocalPlayer.Character.PrimaryPart.Position or Vector3.new()
    local targets = {}

    for _, folder in ipairs({workspace.Characters, workspace.Enemies}) do
        for _, entity in ipairs(folder:GetChildren()) do
            if entity ~= LocalPlayer.Character and CombatModule.IsValidTarget(entity) then
                local primaryPart = CombatModule.GetPrimaryPart(entity)
                local dist = primaryPart and (primaryPart.Position - charPos).Magnitude
                if dist and dist <= 200 then
                    table.insert(targets, {part = primaryPart, distance = dist})
                end
            end
        end
    end

    table.sort(targets, function(a, b) return a.distance < b.distance end)
    return targets
end

function CombatModule.PerformAttackSequence(targets)
    if #targets == 0 then return end
    RegisterAttack:FireServer()

    for i = 1, math.min(#targets, 5) do
        for _ = 1, 3 do
            RegisterHit:FireServer(targets[i].part)
        end
    end
end

function CombatModule.CombatLoop()
    CombatModule.PerformAttackSequence(CombatModule.GetNearbyTargets())
end

return CombatModule
