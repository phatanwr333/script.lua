local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))()
local window = library:Window("Owner Tools")
local main = "https://raw.githubusercontent.com/phatanwr333/script.lua/refs/heads/main/Mics/"

window:Button("Save Instance", function()
    setclipboard('loadstring(game:HttpGet("https://raw.githubusercontent.com/phatanwr333/script.lua/refs/heads/main/Mics/SaveInstance.lua"))() , how to use: saveinstance(object , fn)')
end)

window:Button("Copy CFrame", function()
	setclipboard('CFrame.new(' .. tostring(math.floor(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.x)) .. ',' .. tostring(math.floor(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.y)) .. ',' .. tostring(math.floor(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.z)) .. '))')
end)

window:Button("Infinite Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

window:Button("Fly", function()
    loadstring(game:HttpGet(main .. "Fly.lua"))()
end)

window:Button("Dex Explorer", function()
    loadstring(game:HttpGet(main .. "DexExplorer.lua"))()
end)

window:Button("RemoteSpy", function()
    loadstring(game:HttpGet(main .. "RemoteSpy.lua"))()
end)
