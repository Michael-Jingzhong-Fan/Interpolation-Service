return function(a,b,state)
	if state == 2 then
		return math.sqrt(((a.X - b.X)^2 + (a.Y - b.Y)^2))
	elseif state == 3 then
		return math.sqrt(((a.X - b.X)^2 + (a.Y - b.Y)^2 + (a.Z - b.Z)^2))
	else
		error("out of bound dimensions, must specify 2d or 3d (2 or 3)")
	end
end