note
	description: "Summary description for {SYMETRIC_DIFFERENCE_EXAMPLE}."
	EIS: "name=Symetric Difference Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Symmetric_difference", "tag=requirement"

class
	SYMETRIC_DIFFERENCE_EXAMPLE

create
	make

feature -- Initialization

	make
			-- Run example.
		local
			a, a1, b, b1: ARRAYED_SET [STRING]
		do
			create a.make (4)
			create b.make (4)
			a.compare_objects
			b.compare_objects
			a.put ("John")
			a.put ("Bob")
			a.put ("Mary")
			a.put ("Serena")

			create a1.make (4)
			a1.copy (a)

			b.put ("Jim")
			b.put ("Mary")
			b.put ("John")
			b.put ("Bob")

			create b1.make (4)
			b1.copy (b)

		    a1.subtract (b1)
		    b.subtract (a)
		    a1.merge (b)
		    across a1 as c loop
		    	print (" " + c.item)
		    end
		end

end
