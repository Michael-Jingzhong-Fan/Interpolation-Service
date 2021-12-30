local Service = require(script.Parent)
local Variables = Service.Variables
local Constants = Service.Constants

return function(ChainObject)
	local ChainId = ChainObject["ChainId"]
	Variables.PausedChains[ChainId] = Variables.ActiveChains[ChainId]
	
	local Chain = Service.Create({["Callbacks"] = function()
		Variables.ActiveChains[ChainId] = nil
	end})
	Chain:Start()
end