note
	description: "Sudoku example"
	URI: "http://rosettacode.org/wiki/Sudoku"

class
	SUDOKU_EXAMPLE

create
	make

feature {NONE} -- Initialization

	make
		local
			grid: SUDOKU_GRID
		do
			create grid
			-- Grid initialization
			grid.put (1, 2, 1)
			grid.put (8, 3, 1)
			grid.put (9, 2, 2)
			grid.put (9, 6, 1)
			grid.put (2, 5, 3)
			grid.put (7, 7, 1)
			grid.put (8, 7, 3)
			grid.put (3, 2, 6)
			grid.put (8, 4, 5)
			grid.put (9, 7, 4)
			grid.put (1, 8, 4)
			grid.put (5, 9, 4)
			grid.put (6, 9, 6)
			grid.put (6, 2, 7)
			grid.put (8, 2, 8)
			grid.put (7, 3, 8)
			grid.put (5, 2, 3)
			grid.put (3, 4, 7)
			grid.put (5, 4, 8)
			grid.put (1, 4, 9)
			grid.put (9, 5, 9)
			grid.put (1, 7, 8)
			grid.put (9, 8, 8)
			grid.put (4, 9, 9)

			print (grid)
			grid.solve
			io.put_new_line
			print (grid)
		end

end
