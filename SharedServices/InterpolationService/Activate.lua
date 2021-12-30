local Service = require(script.Parent)
local Variables = Service.Variables
local Constants = Service.Constants

return function()
	for RefreshRate, InterpolationCategory in pairs (Variables.RefreshRates) do
		_G.SharedServices.ChainingService.Recur(
			function(TimeElapsed)
				for i = 1, #Variables.RefreshRates[RefreshRate] do
					local InterpolationId = Variables.RefreshRates[RefreshRate][i]
					if Variables.ActiveInterpolations[InterpolationId] ~= nil then
						local InterpolationTable = Variables.ActiveInterpolations[InterpolationId]
						--pcall(function()
						if InterpolationTable["Duration"] ~= nil then
							if (InterpolationTable["DurationPassed"] + TimeElapsed) >= InterpolationTable["Duration"] then
								Service.Stop(InterpolationId)
							else
								local Success, PostInterpolationValue = pcall(function()
									return InterpolationTable["InterpolationFunction"](InterpolationId, TimeElapsed)
								end)

								if Success ~= true then
									print("InterpolationFunctionFailed")
									Service.RemoveFromInterpolator(InterpolationId)
								else
									InterpolationTable["DurationPassed"] += TimeElapsed
								end
							end
						else
							local Success, PostInterpolationValue = pcall(function()
								return InterpolationTable["InterpolationFunction"](InterpolationId, TimeElapsed)
							end)
							
							if Success ~= true then
								print("InterpolationFunctionFailed")
								Service.RemoveFromInterpolator(InterpolationId)
							else
								InterpolationTable["DurationPassed"] += TimeElapsed
							end
						end
					else
						Variables.Interpolations[InterpolationId]["RefreshRate"] = RefreshRate
					end
					--end)
				end
			end,
				Constants[string.upper(RefreshRate).."_RECURSION_INTERVAL"]
		)
	end
end