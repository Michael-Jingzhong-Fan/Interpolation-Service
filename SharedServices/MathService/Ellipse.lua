return function(minor,major,t)
	return {math.cos(2*t*math.pi - math.pi) * major, math.sin(2*t*math.pi - math.pi) * minor}
end