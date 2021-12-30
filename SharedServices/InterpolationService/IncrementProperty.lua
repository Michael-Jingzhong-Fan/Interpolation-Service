local InterpolationService = require(script.Parent)
local Services = InterpolationService.Services
local Variables = InterpolationService.Variables
local Constants = InterpolationService.Constants

return function(InterpolationId, Property, Increment)
	if InterpolationId == nil then return end
	local Interpolation = Variables.ActiveInterpolations[InterpolationId] or Variables.Interpolations[InterpolationId]
	Interpolation[InterpolationId] += Increment
end