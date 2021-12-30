local Service = require(script.Parent.Parent)
local Services = Service.Services
local Variables = Service.Variables
local Constants = Service.Constants

return function(InterpolationId, PauseDuration)
	if InterpolationId == nil then return end
	Variables.PausedInterpolations[InterpolationId] = Variables.ActiveInterpolations[InterpolationId]
	Variables.ActiveInterpolations[InterpolationId] = nil
	if PauseDuration == nil then return end
	_G.SharedServices.ChainingService.Delay(function() Service.Start(InterpolationId, true) end, PauseDuration)
end
