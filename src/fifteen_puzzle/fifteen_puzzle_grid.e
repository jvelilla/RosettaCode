note
	description: "The game grid of a {FIFTEEN_PUZZLE}"
	author: "Louis Marchand"
	date: "Thu, 26 Apr 2018 00:58:10 +0000"
	revision: "1"

class
	FIFTEEN_PUZZLE_GRID

inherit
	ANY
		redefine
			default_create, out
		end

feature {NONE} -- Constants

	Interline:STRING_8 = "+----+----+----+----+"
			-- Text to show between each value line in `out'
	Intercolumn:STRING_8 = "|"
			-- Text to show between each value in `out'

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		local
			l_line:ARRAYED_LIST[FIFTEEN_PUZZLE_BLOCK]
			l_block:FIFTEEN_PUZZLE_BLOCK
		do
			create {ARRAYED_LIST[LIST[FIFTEEN_PUZZLE_BLOCK]]}blocks.make(4)
			across 1 |..| 4 as la_index1 loop
				create l_line.make (4)
				across 1 |..| 4 as la_index2 loop
					if la_index1.item ~ 4 and la_index2.item ~ 4 then
						create l_block
					else
						create {FIFTEEN_PUZZLE_BLOCK_VALUE}l_block.make(
											((la_index1.item - 1) * 4) + la_index2.item
										)
					end
					l_line.extend (l_block)
				end
				blocks.extend (l_line)
			end
			position := [4, 4]
		end

feature -- Access

	is_complete:BOOLEAN
			-- `Current' has been completed
		local
			l_value:INTEGER
		do

			if position.line = 4 and position.column = 4 then
				Result := True
				l_value := 1
				across 1 |..| 4 as la_line loop
					across 1 |..| 4 as la_column loop
						if la_line.item /= 4 or la_column.item /= 4 then
							Result := Result and block_value(la_line.item, la_column.item) = l_value
							l_value := l_value + 1
						end
					end
				end
			else
				Result := False
			end
		end

	shuffle(a_times:INTEGER)
			-- Do `a_times' random `move'
		require
			Times_Valid: a_times > 0
		local
			l_random:RANDOM
			l_values:LIST[INTEGER]
			l_random_number:INTEGER
		do
			create l_random.set_seed ((create {TIME}.make_now).milli_second)
			l_random.start
			across 1 |..| a_times as la_index loop
				l_values := move_values
				l_random_number := (l_random.item \\ l_values.count) + 1
				check Random_Number_Valid: l_random_number >= 1 and l_random_number <= l_values.count end
				move (l_values.at (l_random_number))
				l_random.forth
			end
		end

	blocks:LIST[LIST[FIFTEEN_PUZZLE_BLOCK]]
			-- Every {FIFTEEN_PUZZLE_BLOCK} in `Current'

	position:TUPLE[line, column:INTEGER]
			-- The position of the not valued {FIFTEEN_PUZZLE_BLOCK} in `Current'

	move(a_value:INTEGER)
			-- Swap the {FIFTEEN_PUZZLE_BLOCK} containing `a_value' with the
			-- {FIFTEEN_PUZZLE_BLOCK} at `position' in `blocks'
		require
			Value_Valid: move_value_valid(a_value)
		local
			l_line, l_column:INTEGER
			l_swap:FIFTEEN_PUZZLE_BLOCK
		do
			l_line := position.line
			l_column := position.column
			if position.line > 1 and then equal_value(position.line - 1, position.column, a_value) then
				l_line := position.line - 1
			elseif position.line < 4 and then equal_value(position.line + 1, position.column, a_value) then
				l_line := position.line + 1
			elseif position.column > 1 and then equal_value(position.line, position.column - 1, a_value) then
				l_column := position.column - 1
			elseif position.column < 4 and then equal_value(position.line, position.column + 1, a_value) then
				l_column := position.column + 1
			end
			l_swap := blocks.at (l_line).at (l_column)
			blocks.at (l_line).at (l_column) := blocks.at (position.line).at (position.column)
			blocks.at (position.line).at (position.column) := l_swap
			position := [l_line, l_column]
		ensure
			Position_Changed: old position.line /~ position.line xor old position.column /~ position.column
			Value_Moved: attached {FIFTEEN_PUZZLE_BLOCK_VALUE}blocks.at (old position.line).at (old position.column) as la_block
							and then la_block.value ~ a_value
		end

	move_value_valid(a_value:INTEGER):BOOLEAN
			-- The `a_value' can be used in `move'
		require
			Value_Valid: a_value >= 1 and a_value <= 15
		do
			Result := move_values.has (a_value)
		end

	move_values:LIST[INTEGER]
			-- Valid values that can be used in `move'
		do
			create {ARRAYED_LIST[INTEGER]}Result.make (4)
			if position.line > 1 then
				Result.extend (block_value(position.line - 1, position.column))
			end
			if position.line < 4 then
				Result.extend (block_value(position.line + 1, position.column))
			end
			if position.column > 1 then
				Result.extend (block_value(position.line, position.column - 1))
			end
			if position.column < 4 then
				Result.extend (block_value(position.line, position.column + 1))
			end
		ensure
			Values_Count_Valid: Result.count >= 2 and Result.count <= 4
		end


feature -- Output

	out:STRING_8
			-- <Precursor>
		do
			create Result.make_from_string (interline)
			across blocks as la_blocks loop
				Result.append ("%N" + Intercolumn)
				across la_blocks.item as la_line loop
					Result.append (" " + la_line.item.out + " " + Intercolumn)
				end
				Result.append ("%N" + interline)
			end
		end

feature {NONE} -- Implementation

	block_value(a_line, a_column:INTEGER):INTEGER
			-- Value of the `blocks' at (`a_line', `a_column')
		require
			Not_Position: a_line /= position.line or a_column /= position.column
		do
			check attached {FIFTEEN_PUZZLE_BLOCK_VALUE} blocks.at (a_line).at(a_column) as la_block then
				Result := la_block.value
			end
		end

	equal_value(a_line, a_column, a_value:INTEGER):BOOLEAN
			-- The {FIFTEEN_PUZZLE_BLOCK} at (`a_line', `a_column') in `blocks'
			-- is valued as `a_value'
		require
			Line_Valid: a_line >= 1 and a_line <= 4
			Column_Valid: a_column >= 1 and a_column <= 4
			Value_Valid: a_value >= 1 and a_value <= 15
		do
			Result := attached {FIFTEEN_PUZZLE_BLOCK_VALUE} blocks.at (a_line).at(a_column) as la_block
						and then la_block.value ~ a_value
		ensure
			Result_Valid: Result implies (
								attached {FIFTEEN_PUZZLE_BLOCK_VALUE} blocks.at (a_line).at(a_column) as la_block
								and then la_block.value ~ a_value
							)
		end

invariant

	Position_Line_Valid: position.line >= 1 and position.line <= 4
	Position_Column_Valid: position.column >= 1 and position.column <= 4
	Position_Pointed_To_Not_Valued: not attached {FIFTEEN_PUZZLE_BLOCK_VALUE} blocks.at (position.line).at (position.column)
	Values_Valid:
			across 1 |..| 15 as la_values all
				across blocks as la_blocks some
					across la_blocks.item as la_line some
						attached {FIFTEEN_PUZZLE_BLOCK_VALUE} la_line.item as la_block
						and then la_block.value = la_values.item
					end
				end
			end
end
