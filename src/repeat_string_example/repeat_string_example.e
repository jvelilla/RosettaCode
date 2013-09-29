note
	description: "Summary description for {REPEAT_STRING_EXAMPLE}."
	EIS: "name=Repeat String Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Repeat_a_string", "tag=requirement"

class
	REPEAT_STRING_EXAMPLE

create
	make

feature -- Initialization

	make
			-- Run example.
		local
			str: STRING
		do
			print("%N Custom Implementation")
			print ("%NRepeat String%N")
			repeat ("ha", 5)
			print ("%NRepeat Char%N")
			repeat_char ('a', 5)

			print("%N Using the multiply feature from the class STRING")
			str := "ce"
			str.multiply (5)
			print ("%N"+str)
		end

feature -- Access

	repeat (word: STRING; n: NATURAL)
		local
			str: STRING
		do
			str := ""
			across 1 |..| 5 as c loop
				str.append (word)
			end
			print (str)
		end

	repeat_char (char:CHARACTER; n: NATURAL)
		local
			str: STRING
		do
			str := ""
			across 1 |..| 5 as c loop
				str.append_character (char)
			end
			print (str)
		end
end
