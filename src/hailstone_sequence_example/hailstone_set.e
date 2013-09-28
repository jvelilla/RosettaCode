note
	description: "Noncyclic part of hailstone sequence"
	author: "Victorien ELVINGER"
	date: "22 August 2013"
	revision: "1"
	libraries: "Relies on LINKED_SET from EiffelBase"

class
	HAILSTONE_SET

inherit
	ITERABLE [NATURAL]

create
	make

feature {NONE} -- Initialization

	make (a_start: NATURAL)
			-- Create an hailstone stream starting at 'a_start'.
		require
			a_start_positive: a_start > 0
		local
			l_stream: HAILSTONE_STREAM
		do
			from
				create l_stream.make (a_start)
				create set.make
				set.extend (a_start)
			until
				l_stream.item = 1
			loop
				l_stream.forth
				set.extend (l_stream.item)
			end
		ensure
			first_effect: a_start = first
		end

feature -- Access

	new_cursor: ITERATION_CURSOR [NATURAL]
			-- Fresh cursor associated with current structure
		do
			Result := set.new_cursor
		end

	first: NATURAL
			-- first item
		do
			Result := set.first
		end

	last: NATURAL = 1
			-- last item

feature -- Measurement

	count: INTEGER
			-- Number of items
		do
			Result := set.count
		ensure
			strictly_positive: Result >= 1
		end

feature {NONE} -- Implementation

	set: LINKED_SET [NATURAL]

invariant
	items_positives: across Current as ic all ic.item > 0 end
	count_definition: count = set.count
	first_definition: first = set.first
	last_definition: last = set.last
end
