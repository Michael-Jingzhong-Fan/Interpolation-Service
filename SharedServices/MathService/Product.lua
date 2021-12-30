return function(Table)
	local Product = 0
	for i = 1, #Table do
		Product *= table[i]
	end
	return Product
end