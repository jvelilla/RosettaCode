note
	description: "Summary description for {HOFSTADTER_SEQUENCE_EXAMPLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HOFSTADTER_SEQUENCE_EXAMPLE

create
	make

feature {NONE} -- Intialization

	make
		do
			across 1 |..| 10 as c loop  print (" " + funS (c.item).out) end
		end

feature -- Access

	funS (n: INTEGER): INTEGER
		do
			if n = 1 or n = 2 then
				Result := h (n) + 1
			else
			    Result := h (n)
			end
		end

	h (n: INTEGER): INTEGER
		local
			a: INTEGER
		do
			if n = 1 then
				Result := 1
			elseif n = 2 then
				Result := 3
			else
				Result := 2 * h (n-1) - h (n-2)
			end
		end
end
