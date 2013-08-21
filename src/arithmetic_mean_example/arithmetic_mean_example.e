note
	description: "Summary description for {ARITHMETIC_MEAN_EXAMPLE}."
	URI: "http://rosettacode.org/wiki/Averages/Arithmetic_mean"

class
	ARITHMETIC_MEAN_EXAMPLE

create
	make

feature -- Initialization

	make
		do
			print("%N<<0, 1, 2, 3, 4, 5, 6, 7, 8, 9>>: " + mean (<<0, 1, 2, 3, 4, 5, 6, 7, 8, 9>>).out)
			print("%N<<>>: " + mean (<<>>).out)
		end

feature -- Access

	mean (element: ARRAY [NATURAL]): REAL
			-- mean of 'element'
		do
			Result := 0
			across element as c from Result := 0 loop
				Result := Result + c.item
			end
			if Result /= 0 then
				Result := Result / element.count
			end
		end

end
