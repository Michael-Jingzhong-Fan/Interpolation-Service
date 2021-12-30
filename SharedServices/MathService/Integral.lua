return function(a, b, dx, func)
	local sum = 0
	for n=a,b,dx do
		sum += func(n)
	end
	return sum*dx
end,