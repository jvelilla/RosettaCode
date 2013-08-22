note
	description: "Null object representation"
	URI: "http://rosettacode.org/wiki/Null_object"

class
	VOID_VALUE_EXAMPLE

create
	make

feature {NONE} -- Initialization

	make
			-- Run example
		local
			l_any: detachable ANY
		do
			-- Default value of detachable type is Void,
			-- therefore 'l_any' is Void

			-- Void-safe call for local variables
			if l_any /= Void then
				l_any.do_nothing
			end

			if attached l_any then
				l_any.do_nothing
			else
				print ("%N l_any is void")
			end

			-- Void-safe call for locals and attributes
			if attached field as l_property then
				l_property.do_nothing
			end
		end

feature

	field: detachable ANY
			-- an attribute

end
