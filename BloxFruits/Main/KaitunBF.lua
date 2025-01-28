repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
script_key = ''
getgenv().Config = {
    ['Team'] = 'Pirates', -- Marines
    ['Hide Ui'] = false,
    ['Lock Fragment'] = 10000,
    ['Black Screen'] = true,
    ['Awakening Fruit'] = true,
    ['Item'] = {
        ['Pole'] = true,
        ['Saber'] = true,
        ['Godhuman'] =  true,
        ['Skull Guitar'] = true,
        ['Mirror Fractal'] = true,
        ['Cursed Dual Katana'] = true,
        ['Upgrade Race V2-V3'] = true
    },
    ['Fruit'] = {
        ['Select Fruit'] = {'Dough-Dough', 'Leopard-Leopard', 'Magma-Magma'},
        ['Snipe Fruit'] = true
    },
    ['Fps'] = {
        ['FPS'] = 45,
        ['FPS Booster'] = true,
        ['Enabled'] = true,
    },
    ['Hop'] = {
        ['Hop Find Mirror Fractal [Dough King]'] = true,
        ['Hop Find Valkyrie Helm [Rip_Indra]'] = true
        ['Hop Find Raids Castle [CDK]'] = true,
        ['Hop Find Fruit 1m [Third Sea]'] = true,
        ['Hop For Longma [Tushita]'] = true,
        ['Hop Find Darkbeard [SG]'] = true,
        ['Hop Find Cake Queen [CDK]'] = true
    }
}

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

