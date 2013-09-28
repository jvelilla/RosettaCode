note
	description: "Hailstone set of 27 and highest hailstone set betwen 1 and 100_000"
	EIS: "name=Hailstone Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Hailstone_sequence", "tag=requirement"
	date: "22 August 2013"
	revision: "1"

class
	HAILSTONE_SEQUENCE_EXAMPLE

create
	make

feature -- Initialization

	make
			-- Check that the hailstone set of 27 has 112 items
			-- Search the highest hailstone set betwen 1 and 100_000
		local
			l_hailstone: HAILSTONE_SET
		do
			-- task 2
			create l_hailstone.make (27)
			check
				l_hailstone.count = 112
			end
			-- task 3
			l_hailstone := highest_hailstone (100_000)
			print ("number " + l_hailstone.first.out + " has the longest sequence, with a count of " + l_hailstone.count.out + " items")
		end

feature -- Other

	highest_hailstone (a_max_nb: NATURAL): HAILSTONE_SET
			-- Highest hailstone sequence betwen 1 and 'a_max_nb'
		require
			a_max_nb_constrainst: a_max_nb >= 4
		local
			i: like a_max_nb
			candidate: like highest_hailstone
		do
			from
				i := 4
				create Result.make (i)
			until
				i = a_max_nb
			loop
				i := i + 1
				create candidate.make (i)
				if candidate.count > Result.count then
					Result := candidate
				end
			end
		end

end
