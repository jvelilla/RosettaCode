note
	description: "Null object representation"
	URI: "http://rosettacode.org/wiki/Null_object"

class
	VOID_VALUE_EXAMPLE

create
	make

feature {NONE} -- Initialization

	make
		local
			a_local: detachable ANY
		do
			a_local := Void
				-- type of 'x' must be detachable
				-- default value of detachable type is Void

			-- Void-safe call for local variables
			if a_local /= Void then
				-- call a_local.f
			end

			if attached a_local then
				-- call a_local.f
			else
				print ("%N a_local is void")
			end

			-- Void-safe call for local variables and attributes
			if attached a_property as x then
				-- call x.f
			end
		end

feature

	a_property: detachable ANY

end
