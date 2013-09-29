note
	description: "Hailstone stream that provides values one by one."
	author: "Victorien ELVINGER"
	date: "22 August 2013"
	revision: "1"

class
	HAILSTONE_STREAM

create
	make

feature {NONE} -- Initialization

	make (a_start: NATURAL)
			-- Create an hailstone stream starting at 'a_start'.
		require
			a_start_positive: a_start > 0
		do
			item := a_start
		end

feature -- Access

	item: NATURAL
			-- Item at current cursor position.

feature -- Cursor movement

	forth
			-- Move to next position.
		do
			item := next (item)
		ensure then
			item_effect: item = next (old item)
		end

feature {NONE} -- Implementation

	even (n: NATURAL): BOOLEAN
			-- Is 'n' even?
		do
			Result := (n \\ 2) = 0
		end

	next (n: NATURAL): NATURAL
			-- Item at next cursor position.
		do
			if even (n) then
				Result := n // 2
			else
				Result := 3*n + 1
			end
		ensure
			n_even_definition: (even (n) implies Result = (n // 2))
			n_odd_definition: not even (n) implies Result = (3*n + 1)
		end

invariant
	item_positive: item > 0
end
