note
	description: "The game 15 puzzle."
	EIS: "name=15 Puzzle Game", "protocol=URI", "src=http://rosettacode.org/wiki/15_Puzzle_Game", "tag=requirement"
	author: "Louis Marchand"

class
	FIFTEEN_PUZZLE

create
	make

feature -- Initialization

	make
			-- Run example.
		do
			initializing_grid
			main_loop
		end

	initializing_grid
			-- Create and shuffle the `grid'
		local
			l_input_valid:BOOLEAN
			l_difficulty:INTEGER
		do
			create grid
			from
				l_input_valid := False
			until
				l_input_valid
			loop
				io.standard_default.put_string ("Select difficulty level (1 for easy to 10 for hard): ")
				io.input.read_line
				if io.input.last_string.is_integer then
					l_difficulty := io.input.last_string.to_integer
					if l_difficulty >= 1 and l_difficulty <= 10 then
						grid.shuffle (l_difficulty * 10)
						l_input_valid := True
					else
						io.error.put_string ("The value must be an integer between 1 to 10%N")
					end
				else
					io.error.put_string ("The value must be an integer between 1 to 10%N")
				end
			end
		end

feature -- Access

	grid:FIFTEEN_PUZZLE_GRID
			-- The game grid.

feature {NONE} -- Implementation

	main_loop
			-- The game engine
		local
			l_input:INTEGER
			l_possible_input:SORTED_LIST[INTEGER]
		do
			create {SORTED_TWO_WAY_LIST[INTEGER]}l_possible_input.make
			from
				l_input := 1
			until
				l_input = 0
			loop
				io.standard_default.put_string (grid.out + "%N")
				if grid.is_complete then
					io.standard_default.put_string ("You win!%N")
					l_input := 0
				else
					io.standard_default.put_string ("Enter the value to move in the empty position (0 to exit).%N")
					io.standard_default.put_string ("Possible value: ")
					l_possible_input.wipe_out
					l_possible_input.append (grid.move_values)
					l_possible_input.do_all (agent (a_value:INTEGER) do io.standard_default.put_string (a_value.out + "  ") end)
					io.standard_default.put_string ("%NInput: ")
					io.input.read_line
					if io.input.last_string.is_integer then
						l_input := io.input.last_string.to_integer
						if l_possible_input.has (l_input) then
							grid.move (l_input)
						elseif l_input /= 0 then
							io.error.put_string ("The value is not valid.%N")
						end
					else
						io.error.put_string ("The value must be an integer.%N")
					end
				end
			end
		end


end
