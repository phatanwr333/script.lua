local _ = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))() 
local __ = _.Window("Owner Tools")
local ___ = "https://raw.githubusercontent.com/phatanwr333/script.lua/refs/heads/main/Mics/"

local c = string.char
local conmemaybeophivcl = c(83, 97, 118, 101, 32, 73, 110, 115, 116, 97, 110, 99, 101)
local cubamaycong = c(67, 111, 112, 121, 32, 67, 70, 114, 97, 109, 101)
local chicuamayngonlam = c(73, 110, 102, 105, 110, 105, 116, 101, 32, 89, 105, 101, 108, 100)
local onggiamaynguvkl = c(70, 108, 121)
local emgaicuamaymupvcl = c(68, 101, 120, 32, 69, 120, 112, 108, 111, 114, 101)
local memaybeonhatvietnam = c(82, 101, 109, 111, 116, 101, 83, 112, 121)

__ :Button(conmemaybeophivcl, function() 
    setclipboard(c(108, 111, 97, 100, 115, 116, 114, 105, 110, 103) .. "(game:HttpGet(\"" .. "https://raw.githubusercontent.com/phatanwr333/script.lua/refs/heads/main/Mics/SaveInstance.lua" .. "\"))() , how to use: saveinstance(object , fn)")
end)

__ :Button(cubamaycong, function() 
    setclipboard('CFrame.new('..tostring(math.floor(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.x))..','..tostring(math.floor(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.y))..','..tostring(math.floor(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.z))..')')
end)

__ :Button(chicuamayngonlam, function() 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() 
end)

__ :Button(onggiamaynguvkl, function() 
    loadstring(game:HttpGet(___ .. "Fly.lua"))() 
end)

__ :Button(emgaicuamaymupvcl, function() 
    loadstring(game:HttpGet(___ .. "DexExplorer.lua"))() 
end)

__ :Button(memaybeonhatvietnam, function() 
    loadstring(game:HttpGet(___ .. "RemoteSpy.lua"))() 
end)
