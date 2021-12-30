local SharedServices = {}
local Services = {}
local Initialised = false

function SharedServices.Initialise()
	if Initialised == true then return end
	local Children = script:GetChildren()
	for i = 1, #Children do
		Services[Children[i].Name] = require(Children[i])
		Services[Children[i].Name].Initialise()
	end
	
	Services.__index = function(self, Index)
		if Services[Index] ~= nil then
			return Services[Index]
		else
			print(Index)
			Services[Index] = require(script:FindFirstChild(Index))
			Services[Index].Activate()
			return Services[Index]
		end
	end
	setmetatable(SharedServices, Services)
	Initialised = true
end

return SharedServices