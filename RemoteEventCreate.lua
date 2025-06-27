local ReplicatedStorage = game:GetService("ReplicatedStorage")

local event = ReplicatedStorage:FindFirstChild("ShowImageEvent")
if not event then
	event = Instance.new("RemoteEvent")
	event.Name = "ShowImageEvent"
	event.Parent = ReplicatedStorage
end

wait(5) -- Wait 5 seconds before triggering

event:FireAllClients()
