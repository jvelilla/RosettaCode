note
	description: "[
		Lucas-Lehmer Test: for p an odd prime, the Mersenne number 2p − 1 is prime 
		if and only if 2p − 1 divides S(p − 1) where S(n + 1) = (S(n))2 − 2, and S(1) = 4.
		The following programs calculate all Mersenne primes up to the implementation's maximum precision, 
		or the 47th Mersenne prime. (Which ever comes first).
		]"
	URI: "http://rosettacode.org/wiki/Lucas-Lehmer_test"

class
	LUCAS_LEHMER_EXAMPLE
create
	make
feature
	make
		do
			across 2 |..| 200 as ic loop
				if(create{PRIMES}).is_prime(ic.item) and is_mersenne_primer (ic.item) then
--					print(" " +ic.item.out)
				end
			end
		end


	is_mersenne_primer ( p: INTEGER) : BOOLEAN
		local
		  one: NATURAL_64
		  zero : NATURAL_64
		  two : NATURAL_64
		  four : NATURAL_64
		  mp : NATURAL_64
		  s: NATURAL_64
		  i: INTEGER
		do
			two.set_item (2)
			four.set_item (4)
			if p = 2  then
				Result := p = 2
			else
				from
					i := 3
					mp := (one.one.bit_shift_left (p)).minus (one.one)
					print ("%NMp value:" + mp.out)
					print ("%NP value:" + p.out)
					s := four
				until
					i > p
				loop
					s :=s.product (s).minus (two).integer_remainder (mp)
					i := i + 1
				end
				Result := (s = zero.zero)
			end
		end


end
