local Service = require(script.Parent)
local Variables = Service.Variables
local Constants = Service.Constants

return function(ChainObject, Callbacks)
	if typeof(Callbacks) == "table" then
		for Index, Value in ipairs(Callbacks) do
			table.insert(ChainObject["PreCallbacks"],Value)
		end
	else
		table.insert(ChainObject["PreCallbacks"],Callbacks)
	end
end