local Service = require(script.Parent)
local Variables = Service.Variables
local Constants = Service.Constants
local MetaTable = {}
MetaTable.__index = function(Table, Index) return Service[Index] end

local DefaultChain = {
	["DelayDuration"] = 0,
	["PreCallbacks"] = {},
	["Callbacks"] = {},
	["PostCallbacks"] = {},
	["StopConditions"] = {}
}


return function(ChainTable)
	if ChainTable == nil then ChainTable = {} end
	local ChainId = Service.NewId()
	ChainTable["ChainId"] = ChainId
	for Index, Value in ipairs(DefaultChain) do
		if ChainTable[Index] == nil then
			ChainTable[Index] = Value
		end
	end
	setmetatable(ChainTable, MetaTable)
	
	local MetaTable2 = {}
	MetaTable2.__index = function(Index)
		if ChainTable == nil then
			MetaTable2 = nil 
		else 
			return ChainTable[Index] 
		end 
	end
	
	Variables.Chains[ChainId] = {}
	setmetatable(Variables.Chains[ChainId], MetaTable2)
	
	return ChainTable
end