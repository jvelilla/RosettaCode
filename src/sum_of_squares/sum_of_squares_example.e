note
	description: "Example of sum of squares"
	URI: "http://rosettacode.org/wiki/Sum_of_squares"

class
	SUM_OF_SQUARES_EXAMPLE
create
	make
feature
	make
		local
			a : ARRAY[INTEGER]
			sum: INTEGER
		do
			a := <<1,2,3>>
			across a as item from sum := 0 loop sum := sum + (item.item * item.item )  end
			print ("%NSum:"+ sum.out)
		end
end
