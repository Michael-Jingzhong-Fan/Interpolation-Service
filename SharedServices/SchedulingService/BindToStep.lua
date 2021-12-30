local Service = require(script.Parent)
local Variables = Service.Variables
local Constants = Service.Constants

return function(ChainObject, Callbacks)
	if typeof(Callbacks) == "table" then
		for Index, Value in ipairs(Callbacks) do
			table.insert(ChainObject["Callbacks"],Value)
		end
	else
		table.insert(ChainObject["Callbacks"],Callbacks)
	end
end