note
	description: "Example Formated numeric ode"
	EIS: "name=Formated Numeric Output Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Formatted_numeric_output", "tag=requirement"

class
	FORMATED_NUMERIC_OUTPUT_EXAMPLE

create
	make

feature {NONE} -- Initialization

	make
			-- Run example.
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
