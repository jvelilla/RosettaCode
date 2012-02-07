note
	description: "Example of Character Matching"
	uri: "http://rosettacode.org/wiki/Character_matching"

class
	CHARACTER_MATCHING_EXAMPLE
create
	make

feature
	make
		local
			str1, str2, str3 : STRING
		do
			str3 :="[
			Given two strings, demonstrate the following 3 types of matchings:
			Determining if the first string starts with second string
Determining if the first string contains the second string at any location
Determining if the first string ends with the second string
Optional requirements:
Print the location of the match for part 2
Handle multiple occurrences of a string for part 2.
			]"
			str1 := "abcd"
			str2 := "ab"
			print ("%NThe first string[" + str1 + "] starts with [" +str2 +"]:" +str1.starts_with (str2).out)
			print ("%NThe first string[" + str1 + "] contains [" +str2 +"]:" +str1.has_substring (str2).out)
			print ("%NThe first string[" + str1 + "] ends with [" +str2 +"]:" +str1.ends_with (str2).out)
			print ("%NThe first string[" + str1 + "] ends with [" +"cd" +"]:" +str1.ends_with ("cd").out)
			string_ocurrences (str3, "string")
			string_ocurrences ("abab", "ab")
		end

	string_ocurrences (text: STRING; match:STRING)
		-- print the location of the `match' in the `text'
		-- and the number of occurences
		local
			count : INTEGER
			cindex : INTEGER
		do
			cindex := 1
			from
				count := 0
			until
				cindex = 0
			loop
				cindex := text.substring_index (match, cindex)
				if cindex /= 0 then
					count := count + 1
					print ("%NOcurrence Index:" + cindex.out)
					cindex := cindex + match.count
					cindex := text.substring_index (match, cindex)
				end
			end
			print ("%NNumber of occurences of ["+ match+"]:" +  count.out)
		end
end
