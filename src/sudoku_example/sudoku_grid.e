note
	description: "Sudoku grid and resolution facilities."
	URI: "http://rosettacode.org/wiki/Sudoku"
	author: "Victorien ELVINGER"

class
	SUDOKU_GRID

inherit
	ANY
		redefine
			out, default_create
		end

create
	default_create

feature -- Initialization

	default_create
			-- create an empty grid
		do
			solved := False
			create grid.make_filled (Default_value, 9, 9)
		end

feature {NONE} -- Access

	grid: ARRAY2 [INTEGER]
			-- board

	Default_value: INTEGER = 0
			-- Empty cell content

feature -- Access

	out: STRING
			-- printable representation
		do
			Result := ""
			across 1 |..| grid.width as column_it
			loop
				across 1 |..| grid.height as row_it
				loop
					Result := Result + grid.item (row_it.item, column_it.item).out + " "
				end
				Result := Result + "%N"
			end
		end

feature -- Status Report

	solved: BOOLEAN
			-- Is completed?

	valid_column (column: INTEGER): BOOLEAN
			-- Is 'column' a valid coordinate?
		do
			Result := column >= 1 and column <= grid.width
		end

	valid_row (row: INTEGER): BOOLEAN
			-- Is 'row' a valid coordinate?
		do
			Result := row >= 1 and row <= grid.height
		end

	valid_value (v: INTEGER): BOOLEAN
			-- Is 'v' a valid item?
		do
			Result := v >= 1 and v <= 9
		end

	valid (v: INTEGER; row, column: INTEGER): BOOLEAN
			-- Can 'v' be inserted at coordinates ('row', 'column')?
		require
			valid_value (v)
			valid_row (row)
			valid_column (column)
		local
			sub_grid_lower_row, sub_grid_lower_column: like row
		do
			Result := not (subgrid_has (v, row, column) or row_has (v, row) or column_has (v, column))
		end

	subgrid_has (v: INTEGER; row, column: INTEGER): BOOLEAN
			-- Is there 'v' in the subgrid containing coordinates ('row', 'column')?
		require
			valid_row (row)
			valid_column (column)
		local
			lower_row, lower_column: like row
		do
			lower_column := (((column - 1) // 3)) * 3 + 1
			lower_row := (((row - 1) // 3)) * 3 + 1
			Result := False

			check
				valid_lower_column: lower_column = 1 or lower_column = 4 or lower_column = 7
				valid_lower_row: lower_row = 1 or lower_row = 4 or lower_row = 7
			end

			across lower_row |..| (lower_row + 2) as row_it
			until
				Result
			loop
				across lower_column |..| (lower_column + 2) as column_it
				until
					Result
				loop
					Result := grid.item (row_it.item, column_it.item) = v
				end
			end
		end

	row_has (v: INTEGER; row: INTEGER): BOOLEAN
			-- Exist there an item 'v' at coordinates ('row', ?)?
		require
			valid_row (row)
		do
			across 1 |..| grid.height as it
			until
				Result
			loop
				Result := grid.item (row, it.item) = v
			end
		end

	column_has (v: INTEGER; column: INTEGER): BOOLEAN
			-- Exist there an item 'v' at coordinates (?, 'column')?
		require
			valid_column (column)
		do
			across 1 |..| grid.height as it
			until
				Result
			loop
				Result := grid.item (it.item, column) = v
			end
		end

feature -- EXtension

	put (v: INTEGER; row, column: INTEGER)
			-- Assign item `v' at coordinates ('row', 'column')
		require
			valid_value (v)
			valid_row (row)
			valid_column (column)
			valid (v, row, column)
		do
			grid.put (v, row, column)
		ensure
			item_inserted: grid.item (row, column) = v
		end

feature -- Change

	solve
			-- Try to solve grid.
		do
			sub_solve (1, 1)
		end

feature {NONE} -- Change

	sub_solve (row, column: INTEGER)
			-- Solve grid from row 'row' and column 'colums'.
		require
			valid_row (row)
			valid_column (column)
		do
			if valid_value (grid.item (row, column)) then
				solve_after (row, column)
			else
				across 1 |..| 9 as it
				until
					solved
				loop
					if valid (it.item, row, column) then
						put (it.item, row, column)
						solve_after (row, column)

						if not solved then
							grid.put (Default_value, row, column)
						end
					end
				end
			end
		end

	solve_after (row, column: INTEGER)
			-- Solve the next cell.
		require
			valid_row (row)
			valid_column (column)
		do
			if column = grid.width then
				if row = grid.height then
					solved := TRue
				else
					-- print (row.out + "%N")
					sub_solve (row + 1, 1)
				end
			else
				sub_solve (row, column + 1)
			end
		end

invariant
	valid_numbers: solved implies across grid as it all valid_value (it.item) end
	nine_columns: grid.width = 9
	nine_rows: grid.height = 9
end
