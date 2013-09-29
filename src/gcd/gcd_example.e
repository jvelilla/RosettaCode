note
	description: "Example Greatest common divisor"
	EIS: "name=GCD Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Gcd", "tag=requirement"

class
	GCD_EXAMPLE

create
	make

feature -- Initialization
	make
			-- Test recursive and iterative GCD.
		do
			check
				recursive_gcd (0, 0) = 0
				recursive_gcd (28, 0) = 28
				recursive_gcd (0, 28) = 28
				recursive_gcd (70, 28) = 14
				recursive_gcd (28, 70) = 14
				recursive_gcd (800, 70) = 10
				recursive_gcd (27, 70) =  1
			end

			check
				iterative_gcd (0, 0) = 0
				iterative_gcd (28, 0) = 28
				iterative_gcd (0, 28) = 28
				iterative_gcd (70, 28) = 14
				iterative_gcd (28, 70) = 14
				iterative_gcd (800, 70) = 10
				iterative_gcd (27, 70) =  1
			end
		end

feature -- Other

	recursive_gcd ( m, n: INTEGER ): INTEGER
			-- Greatest Common Divisor of `m' and 'n'
		require
			m >= 0 and then n >= 0
		do
			if n = 0 then
				Result := m
			else
				Result := recursive_gcd(n, m \\ n)
			end
		ensure
			Result = recursive_gcd (n,m)
		end

	iterative_gcd (m, n: INTEGER): INTEGER
			-- Greatest Common Divisor of `m' and 'n'.
		require
			m >= 0 and then n >= 0
		local
			value: INTEGER
		do
			if m > 0 and n > 0 then
				from
					Result := m
					value := n
				invariant
					iterative_gcd (Result, value) = iterative_gcd (m, n)
				until
					Result = value
				loop
					if Result > value then
						Result := Result - value
					else
						value := value - Result
					end
				variant
					Result.max (value)
				end
			else
				Result := m.max (n)
			end
		ensure
			Result = iterative_gcd (n, m)
		end

end
