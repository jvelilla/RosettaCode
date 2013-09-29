note
	description: "Example 100 doors"
	comment: "Based on the current Eiffel implementation"
	EIS: "name=Doors Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/100_doors", "tag=requirement"

class
	DOORS_EXAMPLE

create
	make

feature {NONE} -- Initialization

	make
			-- Run example.
		local
			count, i: INTEGER
		do
			-- Initialize doors
			from
				count := 100
				i := 1
			until
				i > count
			loop
				doors.extend (create {DOOR}.make_closed (i))
				i := i + 1
			end

			-- Toggle doors
			from
				i := 1
			until
				i > count
			loop
				across doors as ic loop
					if ic.item.address \\ i = 0 then
						ic.item.toggle
					end
				end -- across doors
				i := i + 1
			end -- for i

			-- Print results
			doors.do_all (agent  (door: DOOR)
				do
					if door.is_open then
						io.put_string ("Door " + door.address.out + " is open.")
					elseif not door.is_open then
						io.put_string ("Door " + door.address.out + " is closed.")
					end
					io.put_new_line
				end)
		end -- make

feature {NONE} -- Implementation

	doors: LINKED_LIST [DOOR]
			-- A set of doors
		once
			create Result.make
		end

end
