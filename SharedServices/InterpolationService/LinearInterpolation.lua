local Service = require(script.Parent)
local Services = Service.Services
local Variables = Service.Variables
local Constants = Service.Constants
local MathService = _G.SharedServices.MathService

return function(InterpolationId, TimeElapsed)
	local InitialValue, CurrentValue, FinalValue, Duration = Variables.ActiveInterpolations[InterpolationId]["InitialValue"],Variables.ActiveInterpolations[InterpolationId]["CurrentValue"],Variables.ActiveInterpolations[InterpolationId]["FinalValue"],Variables.ActiveInterpolations[InterpolationId]["Duration"]

	return MathService.QuadraticBezier(TimeElapsed, InitialValue, CurrentValue, FinalValue, Duration)
end