local Service = require(script.Parent)
local Variables = Service.Variables
local Constants = Service.Constants

return function(ChainObject, SuppressPostChain)
	local ChainId = ChainObject["ChainId"]
	if SuppressPostChain == nil or SuppressPostChain == false then
		local ReturnValue
		for Index, Value in ipairs(ChainObject["PostCallbacks"]) do
			ReturnValue = Value(ReturnValue)
		end
		if ReturnValue == nil and ChainObject["PreReturn"] == nil and ChainObject["Return"] == nil then
			ChainObject = nil
		else
			ChainObject["PostReturn"] = ReturnValue
		end
	end
	local Chain = Service.Create({["Callbacks"] = function()
		Variables.ActiveChains[ChainId] = nil
		Variables.PausedChains[ChainId] = nil
		Variables.DelayedChains[ChainId] = nil 
		ChainObject = Service.Create(Variables.Chains[ChainId])
		Variables.Chains[ChainId] = nil
	end})
	Chain:Start()
end