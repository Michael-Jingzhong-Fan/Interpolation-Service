local Service = require(script.Parent)
local Variables = Service.Variables
local Constants = Service.Constants

return function(ChainObject, SuppressPreChain)
	local ChainId = ChainObject["ChainId"]
	
	if ChainObject["DelayDuration"] ~= nil then
		Variables.DelayedChains[ChainId] = ChainObject["DelayDuration"]
	else
		local ReturnValue
		for Index, Value in ipairs(ChainObject["PreCallbacks"]) do
			ReturnValue = Value(ReturnValue)
			ChainObject[Index] = nil
		end
		ChainObject["PreReturn"] = ReturnValue
		
		Variables.ActiveChains[ChainId] = Variables.PausedChains[ChainId] or Variables.Chains[ChainId]
		Variables.Chains[ChainId] = ChainObject
	end
end