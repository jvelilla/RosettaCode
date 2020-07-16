note
	description: "Modular Inverse Example"
	date: "$Date$"
	revision: "$Revision$"

class
	MODULAR_INVERSE_EXAMPLE

create
	make

feature -- Initialization


	make
		do
			compute_inverse (42, 2017)
			compute_inverse (40, 1)
			compute_inverse (52, -217)
			compute_inverse (-486, 217)
			compute_inverse (40, 2018)
		end


	compute_inverse (a, b: INTEGER)
		do
			if {MODULAR_INVERSE}.comprime (a.abs, b.abs) then
				print ("Modular inverse of a: " + a.out + " and b: " + b.out + " is  ")
				print ({MODULAR_INVERSE}.modular_inverse (a, b))
				print ("%N")
			else
				print (a.out + " and " + b.out + " are not comprimes, so there is no modular inverse value")
			end
		end

end
