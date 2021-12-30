local Service = require(script.Parent)
local Variables = Service.Variables
local Constants = Service.Constants

return function(ChainObject, ChainObjectToLink)
	ChainObject:BindToPost(function() 
		local Chain = Service.Create({["Callbacks"] = function()
			ChainObjectToLink:Stop()
		end})
		Chain:Start() 
	end)
	ChainObject:BindToPre(function() 
		local Chain = Service.Create({["Callbacks"] = function()
			ChainObjectToLink:Start()
		end})
		Chain:Start() 
	end)
end