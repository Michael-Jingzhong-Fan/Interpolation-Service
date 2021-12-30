SubService = {}

local Service = require(script.Parent)
local Services = Service.Services
local Variables = Service.Variables
local Constants = Service.Constants

local Functions = {}
Functions.__index = function(self, Index)
	if Functions[Index] ~= nil then
		return Functions[Index]
	elseif script:FindFirstChild(Index) ~= nil then
		Functions[Index] = require(script:FindFirstChild(Index))
		return Functions[Index]
	end 
end

Functions.__call = function(self, InterpolationId)
	if _G.BuiltInServices.RunService:IsServer() == true then
		if Variables.ClientInterpolations[InterpolationId] ~= nil then
			Service.Pause.InvokeClient(InterpolationId)
		else
			Service.Pause.Server(InterpolationId)
		end
	else
		Service.Pause.Client(InterpolationId)
	end
end

setmetatable(SubService, Functions)

return SubService