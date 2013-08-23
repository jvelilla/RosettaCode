note
	description: "Example of SHA-1"
	EIS: "name=SHA Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/SHA-1", "tag=requirement"
	comment : "This example depends on encryption lib, under contrib\library\text\"
	
class
	SHA_EXAMPLE

inherit
	ARRAY_FACILITIES

create
	make

feature -- Initialization

	make
			-- Run example
		local
			s: SHA1
			str: STRING
			output: SPECIAL [NATURAL_8]
		do
			create output.make_filled (0, 20)
			create s.make
			s.sink_string ("Rosetta Code")
			s.do_final (output, 0)
			str := as_natural_32_be (output, 0).to_hex_string
			str.append (as_natural_32_be (output, 4).to_hex_string)
			str.append (as_natural_32_be (output, 8).to_hex_string)
			str.append (as_natural_32_be (output, 12).to_hex_string)
			str.append (as_natural_32_be (output, 16).to_hex_string)
			str.to_lower
			print("%N" + str)
		end

end
