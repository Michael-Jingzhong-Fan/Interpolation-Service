local Service = {}


local Variables = {
	Chains = {},
	ActiveChains = {},
	DelayedChains = {},
	PausedChains = {},
	CurrentId = 0
}

local Constants = {

}


local SubServices = {}
SubServices.__index = function(self, Index)
	if SubServices[Index] ~= nil then
		return SubServices[Index]
	elseif script:FindFirstChild(Index) ~= nil then
		SubServices[Index] = require(script:FindFirstChild(Index))
		return SubServices[Index]
	end 
	
	if Index == "Variables" then
		return Variables
	elseif Index == "Constants" then
		return Constants
	elseif script:FindFirstChild(Index) ~= nil then
		return script:FindFirstChild(Index)
	end
end
setmetatable(Service, SubServices)

function Service.NewId()
	Variables.CurrentId = Variables.CurrentId + 1
	return Variables.CurrentId
end

return Service