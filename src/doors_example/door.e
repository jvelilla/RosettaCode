note
	description: "Represents a door"
	date: "$Date$"
	revision: "$Revision$"

class
	DOOR

create
	make_closed

feature {NONE} -- initialization

	make_closed (a_address: INTEGER)
			-- Create a closed door with 'a_address' as address.
		do
			address := a_address
		ensure
			address_effect: address = a_address
			is_open_effect: is_open = False
		end

feature -- access

	address: INTEGER
			-- Door address

	is_open: BOOLEAN
			-- Door status

feature -- mutators

	toggle
			-- toggle the door
		do
			is_open := not is_open
		ensure
			is_open_effect: is_open = not old is_open
		end

end
