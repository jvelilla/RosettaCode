note
	description: "Example even odd."
	URI:"http://rosettacode.org/wiki/Even_or_odd"
	comment : "\\ is integer remainder."
class
	EVEN_ODD_EXAMPLE
create
	make
feature -- Initialization

	make
		local
			i: INTEGER
		do
			print ("%NExample is_even using mod")
			across 1 |..| 20 as it loop
				print ("%N is " +  it.item.out + " even?: "+ is_even (it.item).out )
			end

			print ("%NExample is_odd using mod")
			across 1 |..| 20 as it loop
				print ("%N is " +  it.item.out + " is_odd?: "+ is_odd (it.item).out )
			end

			print ("%NExamples using bitwise_and")
			across 1 |..| 20 as it loop
				i := it.item
				if i.bit_and (1) = 0 then
					print ("%N" + i.out + " is even")
				elseif i.bit_and (1) = 1 then
					print ("%N" + i.out + " is odd")
				end
			end

		end

feature -- Other

	is_even (i: INTEGER): BOOLEAN
			-- is `i' even?
		do
			Result := (i \\ 2) = 0
		end

	is_odd (i: INTEGER): BOOLEAN
			-- is `i' odd?
		do
			Result := (i \\ 2) = 1
		end

end
