local InterpolationService = require(script.Parent)
local Services = InterpolationService.Services
local Variables = InterpolationService.Variables
local Constants = InterpolationService.Constants

return function(InterpolationId, Callbacks)
	if typeof(Callbacks) == "table" then
		for i = 1, #Callbacks do
			table.insert(Variables.ActiveInterpolations[InterpolationId]["InterpolationCallbacks"],Callbacks[i])
		end
	elseif typeof(Callbacks) == "function" then
		table.insert(Variables.ActiveInterpolations[InterpolationId]["InterpolationCallbacks"],Callbacks)
	end
end