note
	description: "Mean of a numeric vector"
	EIS: "name=Average Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Averages/Arithmetic_mean", "tag=requirement"

class
	ARITHMETIC_MEAN_EXAMPLE

create
	make

feature -- Initialization

	make
			-- Run example.
		do
			print ("%N<<0, 1, 2, 3, 4, 5, 6, 7, 8, 9>>: " + mean (<<0, 1, 2, 3, 4, 5, 6, 7, 8, 9>>).out)
			print ("%N<<>>: " + mean (<<>>).out)
		end

feature -- Access

	mean (a: ARRAY [NATURAL]): REAL
			-- mean of 'element'
		do
			Result := 0
			across a as ic loop
				Result := Result + ic.item
			end
			if Result /= 0 then
				Result := Result / a.count
			end
		end

end
