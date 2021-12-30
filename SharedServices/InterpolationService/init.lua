local Service = {}

local Variables = {
	Interpolations = {},
	ClientInterpolations = {},
	ActiveInterpolations = {},
	PausedInterpolations = {},
	RefreshRates = {
		Slow = {},
		Medium = {},
		Fast = {}
	},
	
	CurrentInterpolationId = 0,
}

local Constants = {
	FAST_RECURSION_INTERVAL = 0.01,
	MEDIUM_RECURSION_INTERVAL = 0.02,
	SLOW_RECURSION_INTERVAL = 0.05
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
	end
end
setmetatable(Service, SubServices)

function Service.NewInterpolationId()
	Variables.CurrentInterpolationId = Variables.CurrentInterpolationId + 1
	return Variables.CurrentInterpolationId
end

return Service 