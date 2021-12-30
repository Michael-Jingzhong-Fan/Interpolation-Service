local Service = require(script.Parent.Parent)
local Services = Service.Services
local Variables = Service.Variables
local Constants = Service.Constants

return function(InterpolationId, SuppressPostInterpolation)
	if InterpolationId == nil then return end
	if SuppressPostInterpolation == false then
		local Success = pcall(function()
			for i = 1, #Variables.ActiveInterpolations[InterpolationId]["PostInterpolationCallbacks"] do
				Variables.ActiveInterpolations[InterpolationId]["PostInterpolationCallbacks"][i]()
			end
		end)
		if Success == false then print("Failed PostInterpolationCallbacks or none declared") end
	end
	pcall(function()
		Variables.ActiveInterpolations[InterpolationId] = nil
		Variables.Interpolations[InterpolationId] = nil
	end)
end