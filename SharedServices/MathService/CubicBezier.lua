return function(timeStep, control1, control2, control3, control4)
	return (1-timeStep)^3 * control1 + 3*(1-timeStep)^2 * control2 + 3*(1-timeStep) * timeStep^2*control2 + timeStep^3 * control4
end