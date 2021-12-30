local Service = require(script.Parent.Parent)
local Variables = Service.Variables
local Constants = Service.Constants

return function (Player, ...)
	local InterpolationId = Service.NewInterpolationId()
	local ClientPlayerPacks = _G.BuiltInServices.ReplicatedStorage:WaitForChild("PlayerPacks")
	local ClientPlayerPack = ClientPlayerPacks:FindFirstChild(Player) or ClientPlayerPacks:FindFirstChild(Player.Name)
	local Remotes = ClientPlayerPack:WaitForChild("Remotes")
	local Remote = Remotes:FindFirstChild(script.Parent.Parent.Name):FindFirstChild(script.Parent.Name)
	Remote:FireClient(InterpolationId, ...)
	table.insert(Variables.ClientInterpolations, InterpolationId)
	return InterpolationId
end