local plr = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

function returnCF(value)
    if value == nil then
        return nil
    end
    return getgenv().Config[value]
end

if plr.Team ~= game.Teams.Marines and plr.Team ~= game.Teams.Pirates then
    if returnCF('Team') == "Marines" then
        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF"):InvokeServer("SetTeam", "Marines")
    elseif returnCF('Team') == "Pirates" then
        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("SetTeam", "Pirates")
    end  
end

