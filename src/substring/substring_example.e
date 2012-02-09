note
	description: "[
		n this task display a substring:
		starting from n characters in and of m length;
		starting from n characters in, up to the end of the string;
		whole string minus last character;
		starting from a known character within the string and of m length;
		starting from a known substring within the string and of m length.
		If the program uses UTF-8 or UTF-16, it must work on any valid Unicode code point, 
		whether in the Basic Multilingual Plane or above it. 
		The program must reference logical characters (code points), 
		not 8-bit code units for UTF-8 or 16-bit code units for UTF-16. 
		Programs for other encodings (such as 8-bit ASCII, or EUC-JP) are not required to handle all Unicode characters.
	]"
	uri: "http://rosettacode.org/wiki/Substring"
	comment :"Eiffel String are 1-indexed"
class
	SUBSTRING_EXAMPLE
create
		make
feature -- Initialization
		make
			local
				str, str2 : STRING
				i,n,m : INTEGER
			do
				str := "abcdefgh"

				n := 3
				m := 3
				print ("%NString:" + str)

				print("%N starting from n:"+ n.out + " characters in and of m:" +m.out+" length:" +str.substring (n, n+m))
				print("%N starting from n:"+ n.out + " up to the end of the string:" +str.substring (n, str.count))
				str2 := str.twin
				str2.remove_tail (1)
				print("%N whole string minus last character:" + str2)

				check
					-- The string has the character
					str.has ('d')
				end
				i := str.index_of ('d', 1)
				print("%N starting from a known character d within the string abcdefgh and of m:" +m.out+" length:" +str.substring (i, i+m))
				--starting from a known substring within the string and of m length.
				check
					-- The str has the substring
					str.has_substring ("ab")
				end

				i := str.substring_index ("ab", 1)
				print("%N starting from a known substring  ab within the string abcdefgh and of m:" +m.out+" length:" +str.substring (i, i+m))
			end
end
