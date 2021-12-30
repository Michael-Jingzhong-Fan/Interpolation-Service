local Service = require(script.Parent)
local Variables = Service.Variables
local Constants = Service.Constants

return function(ChainObject, Duration)
	ChainObject["DelayDuration"] = Duration
end