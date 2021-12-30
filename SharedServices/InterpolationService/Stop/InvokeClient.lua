local Service = require(script.Parent.Parent)
local Variables = Service.Variables
local Constants = Service.Constants

return function (Player, InterpolationId)
	local ClientPlayerPacks = _G.BuiltInServices.ReplicatedStorage:WaitForChild("PlayerPacks")
	local ClientPlayerPack = ClientPlayerPacks:FindFirstChild(Player) or ClientPlayerPacks:FindFirstChild(Player.Name)
	local Remotes = ClientPlayerPack:WaitForChild("Remotes")
	local Remote = Remotes:FindFirstChild(script.Parent.Parent.Name):FindFirstChild(script.Parent.Name)
	table.remove(table.find(Variables.ClientInterpolations, InterpolationId))
	Remote:FireClient(InterpolationId)
end
