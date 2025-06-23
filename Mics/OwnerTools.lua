local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))()
local window = library.Window("Owner Tools")
local scriptBaseUrl = "https://raw.githubusercontent.com/phatanwr333/script.lua/refs/heads/main/Mics/"

window:Button("Save Instance", function()
    setclipboard("https://raw.githubusercontent.com/phatanwr333/script.lua/refs/heads/main/Mics/SaveIntance.lua || example saveinstance(object, fn)")
end)

window:Button("Copy CFrame", function()
    local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position
    setclipboard(string.format("CFrame.new(%d, %d, %d)", pos.x, pos.y, pos.z))
end)

window:Button("Infinite Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

window:Button("Fly", function()
    loadstring(game:HttpGet(scriptBaseUrl .. "Fly.lua"))()
end)

window:Button("Dex Explorer", function()
    loadstring(game:HttpGet(scriptBaseUrl .. "DexExplorer.lua"))()
end)

window:Button("Remote Spy", function()
    loadstring(game:HttpGet(scriptBaseUrl .. "RemoteSpy.lua"))()
end)

window:Button("Turtle Spy", function()
    loadstring(game:HttpGet(scriptBaseUrl .. "TurtleSpy.lua"))()
end)
