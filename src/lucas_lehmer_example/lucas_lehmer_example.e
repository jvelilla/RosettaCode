note
	description: "[
		Lucas-Lehmer Test: for p an odd prime, the Mersenne number 2p − 1 is prime 
		if and only if 2p − 1 divides S(p − 1) where S(n + 1) = (S(n))2 − 2, and S(1) = 4.
		The following programs calculate all Mersenne primes up to the implementation's maximum precision, 
		or the 47th Mersenne prime. (Which ever comes first).
		]"
	EIS: "name=Lucas Lehmer Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Lucas-Lehmer_test", "tag=requirement"
	date: "22 August 2013"
	revision: "2"

class
	LUCAS_LEHMER_EXAMPLE

create
	make

feature -- Initialization

	make
			-- Run example.
		do
			across 2 |..| 60 as ic loop
				if (create {PRIMES}).is_prime (ic.item) and is_mersenne_primer (ic.item) then
					print(" " + ic.item.out)
				end
			end
		end

feature -- Other

	is_mersenne_primer (p: INTEGER): BOOLEAN
		local
			one, mp, s: NATURAL_64
			i: INTEGER
		do
			one := 1
			if p = 2  then
				Result := True
			else
				from
					i := 3
					mp := one.bit_shift_left (p) - 1
					print ("%NMp value:" + mp.out)
					print ("%NP value:" + p.out)
					s := 4
				until
					i > p
				loop
					s := (s*s - 2) \\ mp
					i := i + 1
				end
				Result := (s = 0)
			end
		end

end
