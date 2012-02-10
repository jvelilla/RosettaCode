note
	description: "[
		Take the string "alphaBETA", and demonstrate how to convert it to UPPER-CASE and lower-case. 
		Use the default encoding of a string literal or plain ASCII if there is no string literal in your language. 
		Show any additional case conversion functions (e.g. swapping case, capitalizing the first letter, etc.) 
		that may be included in the library of your language.
	]"
	URI:"http://rosettacode.org/wiki/String_case"

class
	STRING_CASE_EXAMPLE
create
	make
feature
	make
		local
			str : STRING
		do

			str := "alphaBETA"
			print ("%NConvert string to upper case:" + str)
			str.to_upper
			print("%NUpper Case:" +  str)
			str.to_lower
			print("%NLower Case:" +  str)
		end
end
