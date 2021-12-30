local Service = require(script.Parent)
local Variables = Service.Variables
local Constants = Service.Constants

return function(ChainObject, ChainObjectToAppend)
	ChainObject:BindToPost(function() 
		local Chain = Service.Create({["Callbacks"] = function()
			ChainObjectToAppend:Start()
		end})
		Chain:Start() 
	end)
end