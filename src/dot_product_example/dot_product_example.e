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
			-- Run example
		local
			u, v: ARRAY [REAL]
		do
			u := <<1, 3, -5>>
			v := <<4, -2, -1>>
			print ("%NDot product: " + dot_product (u, v).out)

			u := <<1, 3>>
			v := <<4, -2, -1>>
			print ("%NDot product 2: " + dot_product (u, v).out)
		end

feature -- Access

	dot_product (u, v: ARRAY [REAL]): REAL
			-- Scalar product betwen u and v
		local
			i, l_upper: INTEGER
		do
			l_upper := u.upper.min (v.upper)

			from
				i := u.lower
			until
				i > l_upper
			loop
				Result := Result + (u [i] * v [i])
				i := i + 1
			variant
				l_upper - i + 1
			end
		end

end
