note
	description: "Summary description for {LETTER_FREQUENCY_EXAMPLE}."
	EIS: "name=Letter Frequency Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Letter_frequency", "tag=requirement"

class
	LETTER_FREQUENCY_EXAMPLE

create
	make

feature -- Initialization

	make
			-- Run example.
		local
			f: RAW_FILE
			l_content: STRING
			ch: CHARACTER
		do
			-- Version 1, read all the l_content to Memory
			-- Other option, read the l_content by line

			create f.make_with_name ("src/read_specific_line.txt")
			if f.exists and then f.is_readable then
				f.open_read
				f.read_stream (f.count)
				l_content := f.last_string
				f.close

				across 65 |..| 90 as c loop
					ch := (c.item).to_character
					print ("%N" + ch.out + ": " + l_content.occurrences (ch).out)
					print ("%N" + ch.as_lower.out + ": " + l_content.occurrences (ch.as_lower).out)
				end
			else
				print ("Can not read file %"" + f.name + "%".%N")
			end
		end
end
