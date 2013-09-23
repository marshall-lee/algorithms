defmodule Algorithms.Distribution do
	
	def robin([h|t]) do
		stack = :lists.append(t, [h])
		{:ok, h, stack}
	end

end