local Service = require(script.Parent)
local Variables = Service.Variables
local Constants = Service.Constants

return function(ChainObject, CheckFrequency, StartCondition, StopCondition)
	if CheckFrequency == nil then CheckFrequency = 0 end
	local Chain = Service.Create({
		["RecurInterval"] = CheckFrequency,
		["Callbacks"] = {function()
			if StartCondition() == true then 
				ChainObject:Start() 
			end
		end},
		["StopConditions"] = {
			function()if ChainObject == nil or StopCondition() == true then return true end end
		}
	})
	Chain:Start()
end