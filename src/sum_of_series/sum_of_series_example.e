note
	description: "Compute the n-th term of a series"
	EIS: "name=Sum Of Series Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Sum_of_a_series", "tag=requirement"
	author: "Victorien ELVINGER"
	date: "22 August 2013"
	revision: "2"

class
	SUM_OF_SERIES_EXAMPLE

inherit
	MATH_CONST

create
	make

feature -- Initialization

	make
			-- Run example.
		local
			l_approximated, l_known: REAL_64
		do
			l_known := Pi^2 / 6

			l_approximated := sum_until (agent g, 1001)
			print ("%Nzeta function exact value: %N")
			print (l_known)
			print ("%Nzeta function approximated value: %N")
			print (l_approximated)
		end

feature -- Access

	g (k: INTEGER): REAL_64
			-- 'k'-th term of the serie
		require
			k_positive: k > 0
		do
			Result := 1 / (k * k)
		end

	sum_until (s: FUNCTION [TUPLE [INTEGER], REAL_64]; n: INTEGER): REAL_64
			-- sum of the 'n' first terms of 's'
		require
			n_positive: n > 0
			one_parameter: s.open_count = 1
		do
			Result := 0
			across 1 |..| n as it loop
				Result := Result + s.item ([it.item])
			end
		end

end
