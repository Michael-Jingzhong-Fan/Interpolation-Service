local Service = require(script.Parent)
local Variables = Service.Variables
local Constants = Service.Constants

return function()
	_G.BuiltInServices.RunService.Heartbeat:Connect(function(TimeElapsed)
		for ChainId, RemainingDuration in pairs(Variables.DelayedChains) do
			RemainingDuration -= TimeElapsed
			if RemainingDuration <= 0 then
				local Chain = Variables.Chains[ChainId]
				local Input
				if Chain["RecurInterval"] == nil then 
					for Index, Value in ipairs(Chain["PreCallbacks"]) do
						Input = Value(Input)
					end
					Chain["PreReturn"] = Input
				end
				
				Variables.ActiveChains[ChainId] = Chain
			end
		end
		
		for ChainId, Chain in pairs(Variables.ActiveChains) do
			local Input
			for Index, Callback in ipairs(Chain["StepCallbacks"]) do
				Input = Callback(TimeElapsed, Input)
			end
			Chain["StepReturn"] = Input
			
			if Chain["RecurInterval"] == nil then 
				for Index, Callback in ipairs(Chain["PostCallbacks"]) do
					Input = Callback(Input)
				end
				Chain["PostReturn"] = Input
			else
				local StopRecurrence = false
				for Index, StopCondition in ipairs(Chain["StopConditions"]) do
					if StopCondition() == true then StopRecurrence = true end
				end
				if StopRecurrence == true then
					Chain:Stop()
				else
					Variables.ActiveChains[ChainId] = nil
					Variables.DelayedChains[ChainId] = Chain["RecurInterval"]
				end
			end
		end
		
	end)
end