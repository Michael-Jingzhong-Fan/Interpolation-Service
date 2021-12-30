return function(n)
	local function gammafunction(z)
		local gamma = 0.577215664901
		local coeff = -0.65587807152056
		local quad = -0.042002635033944
		local qui = 0.16653861138228
		local set = -0.042197734555571
		local function recigamma(rz)
			return rz + gamma * rz^2 + coeff * rz^3 + quad * rz^4 + qui * rz^5 + set * rz^6
		end
		if z == 1 then
			return 1
		elseif math.abs(z) <= 0.5 then
			return 1 / recigamma(z)
		else
			return (z - 1) * gammafunction(z - 1)
		end
	end
	if string.match(n, "^-") then
		n *= -1
		local N = gammafunction(n + 1)
		N *= -1
		return N
	else
		return gammafunction(n + 1)
	end	
end