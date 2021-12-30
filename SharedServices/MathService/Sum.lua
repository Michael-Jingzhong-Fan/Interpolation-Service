return function(Table)
	local Sum = 0
	for i = 1, #Table do
		Sum += table[i]
	end
	return Sum
end