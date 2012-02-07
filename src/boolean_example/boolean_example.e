note
	rosettacode:"Boolean values"
	URI:"http://rosettacode.org/wiki/Boolean_values"
	description:"[
		Show how to represent the boolean states "true" and "false" in a language.
		If other objects represent "true" or "false" in conditionals, note it.
	]"
	comments: " Only one BOOLEAN class,that can only be either True or False."

class
	BOOLEAN_EXAMPLE

create
	make

feature {NONE} -- Initialization

	make
		local
			l_bool: BOOLEAN
		do
			if True then
				print ("Example Boolean Constant True%N")
			end

			if l_bool = False then
				print ("The variable l_bool is False%N")
			end
		end

end

