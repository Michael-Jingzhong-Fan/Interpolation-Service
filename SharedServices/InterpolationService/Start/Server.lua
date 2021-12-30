local Service = require(script.Parent.Parent)
local Services = Service.Services
local Variables = Service.Variables
local Constants = Service.Constants

return function(InterpolationId, SuppressPreInterpolation)
	if InterpolationId == nil then return end
	if SuppressPreInterpolation == false then
		local Success = pcall(function()
			for i = 1, #Variables.Interpolations[InterpolationId]["PreInterpolationCallbacks"] do
				Variables.Interpolations[InterpolationId]["PreInterpolationCallbacks"][i]()
			end
		end)
		if Success == false then print("Failed PreInterpolationCallbacks or none declared") end
	end
	pcall(function()
		local RefreshRate = Variables.Interpolations[InterpolationId]["RefreshRate"]
		table.insert(Variables.RefreshRates[RefreshRate], InterpolationId)
		Variables.ActiveInterpolations[InterpolationId] = Variables.PausedInterpolations[InterpolationId] or Variables.Interpolations[InterpolationId]
		Variables.ActiveInterpolations[InterpolationId]["RefreshRate"] = nil
	end)
end