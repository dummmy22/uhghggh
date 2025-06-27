local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local IMAGE_ID = "rbxassetid://18318527806"
local SOUND_ID = "rbxassetid://6754147732"
local DISPLAY_TIME = 5

local showImageEvent = ReplicatedStorage:WaitForChild("ShowImageEvent")

local function showGui()
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "ScriptGui"
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	screenGui.DisplayOrder = 9999
	screenGui.Parent = player:WaitForChild("PlayerGui")

	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Size = UDim2.new(1, 0, 1, 0)
	imageLabel.Position = UDim2.new(0, 0, 0, 0)
	imageLabel.BackgroundTransparency = 0
	imageLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	imageLabel.ImageTransparency = 0
	imageLabel.Image = IMAGE_ID
	imageLabel.ScaleType = Enum.ScaleType.Stretch
	imageLabel.Parent = screenGui

	local sound = Instance.new("Sound")
	sound.SoundId = SOUND_ID
	sound.Volume = 1
	sound.Looped = false
	sound.Parent = screenGui

	pcall(function()
		sound:Play()
	end)

	task.delay(DISPLAY_TIME, function()
		if screenGui then
			screenGui:Destroy()
		end
	end)
end

showImageEvent.OnClientEvent:Connect(showGui)