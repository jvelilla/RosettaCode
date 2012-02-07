note
	description: "Summary description for {REPEAT_STRING_EXAMPLE}."
	uri: "http://rosettacode.org/wiki/Repeat_a_string"

class
	REPEAT_STRING_EXAMPLE
create
	make
feature
	make
		do
			print("%NRepeat String%N")
			repeat("ha",5)
			print("%NRepeat Char%N")
			repeat_char('a',5)
		end

	repeat (word:STRING; n: NATURAL)
		local
			str : STRING
		do
			str := ""
			across 1 |..| 5 as c loop
				str.append (word)
			end
			print (str)
		end

	repeat_char (char:CHARACTER; n: NATURAL)
		local
			str : STRING
		do
			str := ""
			across 1 |..| 5 as c loop
				str.append_character (char)
			end
			print (str)
		end
end
