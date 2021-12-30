SubService = {}

local Functions = {}
Functions.__index = function(self, Index)
	if Functions[Index] ~= nil then
		return Functions[Index]
	elseif script:FindFirstChild(Index) ~= nil then
		Functions[Index] = require(script:FindFirstChild(Index))
		return Functions[Index]
	end 
end

setmetatable(SubService, Functions)

return SubService