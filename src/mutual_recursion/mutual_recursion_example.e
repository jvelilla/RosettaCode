note
	description: "Summary description for {MUTUAL_RECURSION_EXAMPLE}."
	EIS: "name=Mutual Recursion Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Mutual_recursion", "tag=requirement"

class
	MUTUAL_RECURSION_EXAMPLE

create
	make

feature -- Initialization

	make
			-- Run example.
		do
			print("f(0..20):")
			across 0 |..| 20  as i loop
				print (" "+ f((i.item).as_natural_32).out)
			end
			io.put_new_line
			print("m(0..20):")
			across 0 |..| 20  as i loop
				print (" "+ m((i.item).as_natural_32).out)
			end
		end

feature -- Other

	f (n: NATURAL ): NATURAL
		do
			if n = 0 then
				Result := 1
			else
				Result := n - m (f (n-1))
			end
		end

	m (n: NATURAL): NATURAL
		do
			if n = 0 then
				Result := 0
			else
				Result := n - f (m (n-1))
			end
		end

end
