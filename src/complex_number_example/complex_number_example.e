note
	description: "RosettaCode Arithmetic Complex Numbers"
	uri: "http://rosettacode.org/wiki/Arithmetic/Complex"
	comment: "[
		Code base on Helmut Brandl tutorial http://tecomp.sourceforge.net/index.php?file=doc/lang/tutorial.txt
		]"

class
	COMPLEX_NUMBER_EXAMPLE

create
	make

feature {NONE} -- Initialization

	make
		local
			a: COMPLEX
			b: COMPLEX
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
