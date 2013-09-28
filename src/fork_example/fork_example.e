note
	description: "Summary description for {FORK_EXAMPLE}."
	EIS: "name=Fork Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Fork", "tag=requirement"
	date: "30 August 2013"
	revision: "1"

class
	FORK_EXAMPLE

create
	make,
	make_with

feature {NONE}  -- Initialization

	make
			-- Run another processus.
		local
			another: separate FORK_EXAMPLE
		do
			make_with (1)
			create another.make_with (2)
			launch (another)
			launch (Current)
		ensure
			number_effect: number = 1
		end

	make_with (a_number: INTEGER)
			-- Create an instance with 'a_number' as number.
		do
			number := a_number
		ensure
			number_effect: number = a_number
		end

feature {NONE} -- Processing

	launch (a_separate: separate FORK_EXAMPLE)
			-- Lock 'a_separate' and run a task.
		do
			a_separate.print_identity
		end

feature -- Access

	number: INTEGER
			-- processus number

feature -- Basic Operation

	print_identity
			-- Print the process number.
		do
			print ("I am the process " + number.out + "%N")
		end

end
