note
	description: "[
		Separate the string "Hello,How,Are,You,Today" by commas into an array (or list) so that each element of it 
		stores a different word. Display the words to the 'user', in the simplest manner possible, separated by a period.
		To simplify, you may display a trailing period.
		]"
	URI: "http://rosettacode.org/wiki/Tokenize_a_string"

class
	TOKENIZE_STRING_EXAMPLE
create
	make
feature
	make
		local
			str: STRING
			words : LIST[STRING]
		do
			str := "Hello,How,Are,You,Today"
				-- String to tokenize

			print ("%NString to tokenize:"+ str)

			words := str.split (',')
				-- List of words

			print ("%NWords separeted by period:" + display_words (words))
		end


	display_words ( a_list : LIST[STRING] ) : STRING
		-- Display the words of the list `a_list' separeted by a period
		do
			Result := ""
			across a_list as elem loop
			    Result.append (elem.item)
			    Result.append_character ('.')
			end
			Result.remove_tail (1)
		end
end
