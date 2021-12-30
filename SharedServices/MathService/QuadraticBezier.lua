return function(timeStep, control1, control2, control3)
	return (1-timeStep)^2 * control1 + 2*(1-timeStep) * timeStep * control2 + timeStep^2 * control3
end