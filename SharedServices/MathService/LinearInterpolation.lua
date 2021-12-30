return function(TimeElapsed, InitialValue, CurrentValue, FinalValue, Duration)
	return CurrentValue + (FinalValue - InitialValue)*TimeElapsed/Duration
end