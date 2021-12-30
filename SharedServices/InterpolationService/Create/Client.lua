local Service = require(script.Parent.Parent)
local Services = Service.Services
local Variables = Service.Variables
local Constants = Service.Constants

local DefaultTable = {
	RefreshRate = "Medium",
	DurationPassed = 0,
	InterpolationFunction = Service.LinearInterpolation(),
	PreInterpolationCallbacks = {},
	PostInterpolationCallbacks = {}}

return function(InterpolationId, InterpolationTable)
	for Key, Value in pairs (DefaultTable) do
		if InterpolationTable[Key] == nil then
			InterpolationTable[Key] = Value
		end
	end
	Variables.Interpolations[InterpolationId] = InterpolationTable
	return InterpolationId
end