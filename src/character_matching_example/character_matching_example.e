note
	description: "Example of Character Matching"
	EIS: "name=Character Matching Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Character_matching", "tag=requirement"

class
	CHARACTER_MATCHING_EXAMPLE

create
	make

feature -- Initialization

	make
			-- Run example.
		local
			str_1, str_2, str_3 : STRING
		do
			str_3 :="[
			Given two strings, demonstrate the following 3 types of matchings:
			Determining if the first string starts with second string
Determining if the first string contains the second string at any location
Determining if the first string ends with the second string
Optional requirements:
Print the location of the match for part 2
Handle multiple occurrences of a string for part 2.
			]"
			str_1 := "abcd"
			str_2 := "ab"

			print ("%NThe first string[" + str_1 + "] starts with [" + str_2 + "]:" + str_1.starts_with (str_2).out)
			print ("%NThe first string[" + str_1 + "] contains [" + str_2 + "]:" + str_1.has_substring (str_2).out)
			print ("%NThe first string[" + str_1 + "] ends with [" + str_2 + "]:" + str_1.ends_with (str_2).out)
			print ("%NThe first string[" + str_1 + "] ends with [" + "cd" + "]:" + str_1.ends_with ("cd").out)
			print_string_ocurrences (str_3, "string")
			print_string_ocurrences ("abab", "ab")
		end

	print_string_ocurrences (text: STRING; match: STRING)
			-- print the location of the `match' in the `text'
			-- and the number of occurences
		local
			count : INTEGER
			cindex : INTEGER
		do
			from
				cindex := 1
				count := 0
			until
				cindex = 0
			loop
				cindex := text.substring_index (match, cindex)
				if cindex /= 0 then
					count := count + 1
					print ("%NOccurrence Index:" + cindex.out)
					cindex := cindex + match.count
					cindex := text.substring_index (match, cindex)
				end
			end
			print ("%NNumber of occurences of [" + match + "]:" + count.out)
		end

end
