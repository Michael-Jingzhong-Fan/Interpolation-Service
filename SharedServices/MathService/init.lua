local Service = {}

local Variables = {}

local Constants = {
	phi = 1.6180339887,
	e = 2.718281828459,
	G = 6.673*10^-11,
	Pi = 3.14159265359
}

local SubServices = {}
SubServices.__index = function(self, Index)
	if SubServices[Index] ~= nil then
		return SubServices[Index]
	elseif script:FindFirstChild(Index) ~= nil then
		SubServices[Index] = require(script:FindFirstChild(Index))
		return SubServices[Index]
	end 

	if Index == "Variables" then
		return Variables
	elseif Index == "Constants" then
		return Constants
	end
end
setmetatable(Service, SubServices)

return Service