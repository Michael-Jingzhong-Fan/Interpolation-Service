local InterpolationService = require(script.Parent)
local Services = InterpolationService.Services
local Variables = InterpolationService.Variables
local Constants = InterpolationService.Constants
local MathService = _G.SharedServices.MathService

return function(InterpolationId, TimeElapsed)
	local Control1, Control2, Control3, Control4 = Variables.ActiveInterpolations[InterpolationId]["Control1"](),Variables.ActiveInterpolations[InterpolationId]["Control2"](),Variables.ActiveInterpolations[InterpolationId]["Control3"](),Variables.ActiveInterpolations[InterpolationId]["Control4"]()
	
	return MathService.CubicBezier(TimeElapsed, Control1, Control2, Control3, Control4)
end