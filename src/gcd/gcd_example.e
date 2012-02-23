note
	description: "Example Greatest common divisor"
	uri: "http://rosettacode.org/wiki/Gcd"

class
	GCD_EXAMPLE

create
	make

feature
	make
		do
			check
				gcd_recursive(0, 0)   = 0
				gcd_recursive(28, 0)   = 28
				gcd_recursive(0, 28)   = 28
				gcd_recursive(70, 28)  = 14
				gcd_recursive(28, 70)  = 14
				gcd_recursive(800, 70) = 10
				gcd_recursive(27, 70) =  1
			end


			check
				gcd(0, 0)   = 0
				gcd(28, 0)   = 28
				gcd(0, 28)   = 28
				gcd(70, 28)  = 14
				gcd(28, 70)  = 14
				gcd(800, 70) = 10
				gcd(27, 70) =  1
			end



		end

	gcd_recursive( m,n : INTEGER ) : INTEGER
		-- greatest common divisor of `m' and `n'
		require m>=0 and then n>=0
		do
			if n=0 then
				Result := m
			else
				Result := gcd_recursive(n, m\\n)
			end
		ensure
			Result = gcd_recursive(n,m)
		end

	gcd (m, n: INTEGER): INTEGER
			-- Great Common Divisor of `m' and `n'.
		require m>=0 and then n>=0
		local
			value: INTEGER
		do
			if m > 0 and n > 0 then
				from
					Result := m
					value := n
				invariant
					gcd(Result, value) = gcd(m, n)
				until
					Result = value
				loop
					if Result > value then
						Result := Result - value
					else
						value := value - Result
					end
				variant
					Result.max(value)
				end
			else
				Result := m.max (n)
			end
		ensure
			Result = gcd(n, m)
		end


end
