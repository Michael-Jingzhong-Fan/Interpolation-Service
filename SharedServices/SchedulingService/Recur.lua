local Service = require(script.Parent)
local Variables = Service.Variables
local Constants = Service.Constants

return function(ChainObject, RecurInterval, StopConditions)
	if RecurInterval == nil then RecurInterval = 0 end
	ChainObject["RecurInterval"] = RecurInterval
	
	if StopConditions == nil then return end
	if typeof(StopConditions) == "table" then
		for Index, Value in ipairs(StopConditions) do
			table.insert(ChainObject["Callbacks"], Value)
		end
	else
		table.insert(ChainObject["Callbacks"], StopConditions)
	end
end