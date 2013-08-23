note
	description: "Summary description for {STRIP_CHARACTERS_STRING_EXAMPLE}."
	EIS: "name=Strip Characters Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Strip_a_set_of_characters_from_a_string", "tag=requirement"

class
	STRIP_CHARACTERS_STRING_EXAMPLE

create
	make

feature -- Initialization

	make
			-- Run example
		do
			print(strips_characters ("She was a soul stripper. She took my heart!", <<'a','e','i'>>))
		end

feature -- Other

	strips_characters (a_string: STRING; a_chars: ARRAY [CHARACTER]): STRING
			-- String similar to 'a_string' with the characters 'a_chars' removed.
		do
			Result := a_string.twin
			across a_chars as ic loop
				Result.prune_all (ic.item)
			end
		end

end
