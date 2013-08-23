note
	description: "RosettaCode Arithmetic Complex Numbers"
	EIS: "name=Complex Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Arithmetic/Complex", "tag=requirement"
	comment: "Code base on Helmut Brandl tutorial http://tecomp.sourceforge.net/index.php?file=doc/lang/tutorial.txt"

class
	COMPLEX_NUMBER_EXAMPLE

create
	make

feature -- Initialization

	make
			-- Run example.
		local
			a, b: COMPLEX
		do
			create a.make (1, 1)
			create b.make (3.14159, 1.25)
			print("%Na:" + a.out)
			print("%Nb:" + b.out)
			print("%Na+b:" + (a+b).out)
			print("%Na*b:" + (a*b).out)
			print("%Nb/a:" + (b/a).out)
			print("%Na-b:" + (a-b).out)
			print("%N-a:" + (-a).out)
		end

end
