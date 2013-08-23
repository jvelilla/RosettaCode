note
	description: "[
		Choose popular date libraries used by your language and show the epoch those libraries use. 
		A demonstration is preferable (e.g. setting the internal representation of the date to 0 ms/ns/etc., 
		or another way that will still show the epoch even if it is changed behind the scenes by the implementers), 
		but text from (with links to) documentation is also acceptable where a demonstration is impossible/impractical. 
		For consistency's sake, show the date in UTC time where possible.
		]"
	EIS: "name=Epoch Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Show_the_epoch", "tag=requirement"
	comment: "Dependency on Time library"
	documentation: "http://docs.eiffel.com/book/solutions/eiffeltime"


class
	EPOCH_EXAMPLE

create
	make

feature -- Initialization

	make
			-- Run example.
		local
			dt : DATE_TIME
		do
			create dt.make_from_epoch (0)
			print (dt.out)
		end
end
