local Service = require(script.Parent)
local Services = Service.Services
local Variables = Service.Variables
local Constants = Service.Constants
local MathService = _G.SharedServices.MathService

return function(InterpolationId, TimeElapsed)
	local Control1, Control2, Control3 = Variables.ActiveInterpolations[InterpolationId]["Control1"](),Variables.ActiveInterpolations[InterpolationId]["Control2"](),Variables.ActiveInterpolations[InterpolationId]["Control3"]()

	return MathService.QuadraticBezier(TimeElapsed, Control1, Control2, Control3)
end