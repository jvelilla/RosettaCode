note
	description: "Modular Inverse"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=Modular_inverse", "src=https://rosettacode.org/wiki/Modular_inverse", "protocol=URI"
class
	MODULAR_INVERSE


feature -- Access

	comprime (a, b: INTEGER_64): BOOLEAN
			-- Result `True`, if  the only positive integer (factor) that divides both of them is 1.
			--
		do
			Result := gcd (a, b) = 1
		ensure
			instance_free: class
		end

	gcd (m, n: INTEGER_64): INTEGER_64
			-- Greatest Common Divisor of `m' and 'n'.
		require
			m >= 0 and then n >= 0
		local
			value: INTEGER_64
		do
			if m > 0 and n > 0 then
				from
					Result := m
					value := n
				invariant
					gcd (Result, value) = gcd (m, n)
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
			Result = gcd (n, m)
			instance_free: class
		end

	modular_inverse (a, n: INTEGER_64): INTEGER_64
			-- Sets `Result` to the multiplicative inverse of a in the ring ℤ/nℤ .
			-- If a and n are not relatively prime, a has no multiplicative inverse in the ring ℤ/nℤ.
		note
			eis: "Modular multiplicative inverse", "src=https://en.wikipedia.org/wiki/Modular_multiplicative_inverse", "protocol=uri"
			eis: "Modular Inverse", "src=https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm", "protocol=uri"
		require
			are_comprime: comprime (a.abs, n.abs)
		local
			la, ln: INTEGER_64
			t, nt, r, nr, q, tmp: INTEGER_64
		do
			ln := if n < 0 then - n else n end
			la := if a < 0 then ln - (- a \\ ln) else a end
			t := 0
			nt := 1
			r := ln
			nr := la \\ ln
			from
			until
				nr = 0
			loop
				q := r // nr
				tmp := nt
				nt := t - q * nt
				t := tmp
				tmp := nr
				nr := r - q * nr
				r := tmp
			end
			if r > 1 then
				check False then
					Result := -1 -- No inverse
				end
			else
				if t < 0 then
					t := t + ln
				end
				Result := t
			end
		ensure
			instance_free: class
		end

end
