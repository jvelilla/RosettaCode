note
	description: "Summary description for {STRIP_CHARACTERS_STRING_EXAMPLE}."
	uri : "http://rosettacode.org/wiki/Strip_a_set_of_characters_from_a_string"
class
	STRIP_CHARACTERS_STRING_EXAMPLE
create
	make

feature
	make
		do
			print(strips_characters ("She was a soul stripper. She took my heart!", <<'a','e','i'>>))
		end

	strips_characters ( str:STRING; chars:ARRAY[CHARACTER]) : STRING
		do
			Result := str.twin
			across chars as c loop
						Result.prune_all (c.item)
			end
		end

end
