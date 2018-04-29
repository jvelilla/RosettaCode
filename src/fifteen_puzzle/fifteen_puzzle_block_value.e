note
	description: "A {FIFTEEN_PUZZLE_BLOCK} continaing a value"
	author: "Louis Marchand"
	date: "Thu, 26 Apr 2018 00:58:10 +0000"
	revision: "1"

class
	FIFTEEN_PUZZLE_BLOCK_VALUE

inherit
	FIFTEEN_PUZZLE_BLOCK
		redefine
			out
		end

create
	make

feature {NONE} -- Initialization

	make(a_value:INTEGER)
			-- Initialize `Current' using `a_value' as `value'
		require
			Value_Valid: a_value >= 1 and a_value <= 15
		do
			value := a_value
		ensure
			Value_Assign: value ~ a_value
		end

feature -- Access

	value:INTEGER
			-- The identifier of `Current'


feature -- Output

	out:STRING_8
			-- <Precursor>
		do
			From
				Result := value.out
			until
				Result.count >= 2
			loop
				Result := " " + Result
			end
		end

end
