assert(firesignal, "Your exploit does not support firesignal.")

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

UserInputService.WindowFocusReleased:Connect(function()
    RunService.Stepped:Wait()
    pcall(firesignal, UserInputService.WindowFocused)
end)

game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
