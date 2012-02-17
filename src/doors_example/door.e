note
	description: "Summary description for {DOOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	DOOR
	-- Represents a door

create
	make

feature -- initialization

	make (addr: INTEGER; status: BOOLEAN)
		-- create door with address and status
		do
			address := addr
			open := status
		ensure
			address_set: address = addr
			status_set: open = status
		end

feature -- access

	address: INTEGER

	open: BOOLEAN assign set_open

feature -- mutators

	set_open (status: BOOLEAN)
		do
			open := status
		ensure
			open_updated: open = status
		end

end
