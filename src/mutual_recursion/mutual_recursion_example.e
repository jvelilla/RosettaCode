note
	description: "Summary description for {MUTUAL_RECURSION_EXAMPLE}."
	URI: "http://rosettacode.org/wiki/Mutual_recursion"

class
	MUTUAL_RECURSION_EXAMPLE
create
	make
feature
	make
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


	f (n:NATURAL ):NATURAL
		do
			if n = 0 then
				Result := 1
			else
				Result := n - m(f(n-1))
			end
		end

	m (n:NATURAL):NATURAL
		do
			if n = 0 then
				Result := 0
			else
				Result := n - f(m(n-1))
			end
		end

end
