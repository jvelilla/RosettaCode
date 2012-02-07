note
	description: "Summary description for {LETTER_FREQUENCY_EXAMPLE}."
	uri: "http://rosettacode.org/wiki/Letter_frequency"

class
	LETTER_FREQUENCY_EXAMPLE
create
	make
feature
	make
		local
			f : RAW_FILE
			content : STRING
			ch : CHARACTER
		do
			-- Version 1, read all the content to Memory
			-- Other option, read the content by line
			
			create f.make_open_read ("./src/read_specific_line.txt")
			f.read_stream (f.count)
			content := f.last_string
			f.close

			across 65 |..| 90 as c loop
				ch := (c.item).to_character
				print ("%N"+ ch.out +": " + content.occurrences (ch).out)
				print ("%N"+ ch.as_lower.out +": " + content.occurrences (ch.as_lower).out)
			end
		end
end
