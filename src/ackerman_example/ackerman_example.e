note
	description: "Compute the n-th term of a series"
	EIS: "name=Ackerman Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Ackermann_function", "tag=requirement"

class
	ACKERMAN_EXAMPLE

create
	make

feature -- Initialization

	make
			-- Run example.
		do
			print ("%N A(0,0):" + ackerman (0, 0).out)
			print ("%N A(1,0):" + ackerman (1, 0).out)
			print ("%N A(0,1):" + ackerman (0, 1).out)
			print ("%N A(1,1):" + ackerman (1, 1).out)
			print ("%N A(2,0):" + ackerman (2, 0).out)
			print ("%N A(2,1):" + ackerman (2, 1).out)
			print ("%N A(2,2):" + ackerman (2, 2).out)
			print ("%N A(0,2):" + ackerman (0, 2).out)
			print ("%N A(1,2):" + ackerman (1, 2).out)
			print ("%N A(3,3):" + ackerman (3, 3).out)
			print ("%N A(3,4):" + ackerman (3, 4).out)
		end

feature -- Access

	ackerman (m, n: NATURAL): NATURAL
		do
			if m = 0 then
				Result := n + 1
			elseif n = 0 then
				Result := ackerman (m - 1, 1)
			else
				Result := ackerman (m - 1, ackerman (m, n - 1))
			end
		end

end
