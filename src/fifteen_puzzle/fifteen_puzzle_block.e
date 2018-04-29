note
	description: "A block contained in a {FIFTEEN_PUZZLE_GRID}"
	author: "Louis Marchand"
	date: "Thu, 26 Apr 2018 00:58:10 +0000"
	revision: "1"

class
	FIFTEEN_PUZZLE_BLOCK

inherit
	ANY
		redefine
			out
		end

feature -- Output

	out:STRING_8
			-- <Precursor>
		do
			Result := "  "
		ensure then
			Out_Size_valid: Result.count = 2
		end
end
