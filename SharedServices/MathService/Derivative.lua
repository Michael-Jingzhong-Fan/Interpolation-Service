return function(x,dx, func)
	return (func(x + dx) - func(x))/dx
end