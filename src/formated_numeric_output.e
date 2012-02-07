note
	description: "Example Formated numeric ode"
	uri: "http://rosettacode.org/wiki/Formatted_numeric_output#Eiffel"
	date: "$Date$"
	revision: "$Revision$"

class
	FORMATED_NUMERIC_OUTPUT

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			print_formatted_std (7.125)
		end


	print_formatted_std (v: REAL_64)
			-- Print the value 'v' as a zero-padded string in a fixed
			-- overall width of 9 places and, with a precision of
			-- to 3 places to the right of the decimal point.
			-- Use the FORMAT_DOUBLE class from the standard library
		local
			fmt: FORMAT_DOUBLE
		do
			create fmt.make (9, 3)
			fmt.zero_fill
			print (fmt.formatted (v) + "%N")
		end
end
