note
	description: "Scalar product bewteen two vectors."
	uri: "http://rosettacode.org/wiki/Dot_product"
	author: "Victorien ELVINGER"

class
	DOT_PRODUCT_EXAMPLE

create
	make

feature {NONE} -- Initialization

	make
		local
			vect, vect2: ARRAY [REAL]
		do
			vect := <<1, 3, -5>>
			vect2 := <<4, -2, -1>>
			print ("%NDot product: " + dot_product (vect, vect2).out)

			vect := <<1, 3>>
			vect2 := <<4, -2, -1>>
			print ("%NDot product 2: " + dot_product (vect, vect2).out)
		end

feature -- Access

	dot_product (u, v: ARRAY [REAL]): REAL
			-- Scalar product betwen u and v
		local
			upper, i: INTEGER
		do
			upper := u.upper.min (v.upper)

			from
				i := u.lower
			until
				i > upper
			loop
				Result := Result + (u [i] * v [i])
				i := i + 1
			variant
				upper - i + 1
			end
		end

end
