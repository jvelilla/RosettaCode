note
	description: "recursive and iterative factorial example of a positive integer."
	EIS: "name=Factorial Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Factorial", "tag=requirement"
	author: "Victorien ELVINGER"

class
	FACTORIAL_EXAMPLE

create
	make

feature -- Initialization

	make
			-- Run example.
		local
			n: NATURAL
		do
			n := 5
			print ("%NFactorial of " + n.out + " = ")
			print (recursive_factorial (n))

			check
				same_result: recursive_factorial (n) = iterative_factorial (n)
			end

			check
				recursive_factorial (0) = 1
				iterative_factorial (0) = 1
			end
		end

feature -- Access

	recursive_factorial (n: NATURAL): NATURAL
			-- factorial of 'n'
		do
			if n = 0 then
				Result := 1
			else
				Result := n * recursive_factorial (n - 1)
			end
		end

	iterative_factorial (n: NATURAL): NATURAL
			-- factorial of 'n'
		local
			v: like n
		do
			from
				Result := 1
				v := n
			until
				v <= 1
			loop
				Result := Result * v
				v := v - 1
			end
		end

end
