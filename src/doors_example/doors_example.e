note
	description: "Example 100 doors"
	URI :"http://rosettacode.org/wiki/100_doors"
	comment: "Based on the current Eiffel implementation"
class
	DOORS_EXAMPLE

create
	make

feature {NONE} -- Initialization

	doors: LINKED_LIST [DOOR]
			-- A set of doors
		once
			Result := create {LINKED_LIST [DOOR]}.make
		end

	make
			-- Run application.
		local
			count, i: INTEGER
		do
				--initialize doors
			count := 100
			from
				i := 1
			until
				i > count
			loop
				doors.extend (create {DOOR}.make (i, false))
				i := i + 1
			end

				-- toggle doors
			from
				i := 1
			until
				i > count
			loop
				across
					doors as this
				loop
					if this.item.address \\ i = 0 then
						this.item.open := not this.item.open
					end
				end -- across doors
				i := i + 1
			end -- for i

				-- print results
			doors.do_all (agent  (door: DOOR)
				do
					if door.open then
						io.put_string ("Door " + door.address.out + " is open.")
					elseif not door.open then
						io.put_string ("Door " + door.address.out + " is closed.")
					end
					io.put_new_line
				end)
		end -- make

end
