local Service = require(script.Parent)
local Services = Service.Services
local Variables = Service.Variables
local Constants = Service.Constants

return function(InterpolationId, Property, NewValue)
	if InterpolationId == nil then return end
	local Interpolation = Variables.ActiveInterpolations[InterpolationId] or Variables.Interpolations[InterpolationId]
	Interpolation[Property] = NewValue
end