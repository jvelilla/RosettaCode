note
	description: "Null object representation"
	EIS: "name=Void Value Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Null_object", "tag=requirement"
	date: "22 August 2013"
	revision: "2"

class
	VOID_VALUE_EXAMPLE

create
	make

feature {NONE} -- Initialization

	make
			-- Run example.
		local
			l_any: detachable ANY
		do
			-- Default value of detachable type is Void,
			-- therefore 'l_any' is Void

			-- Void-safe call for local variables
			if l_any /= Void then
				-- call l_any.f
			end

			if attached l_any then
				-- call l_any.f
			else
				print ("%N l_any is void")
			end

			-- Void-safe call for locals and attributes
			if attached field as l_field then
				-- call l_field.f
			end
		end

feature

	field: detachable ANY
			-- an attribute

end
