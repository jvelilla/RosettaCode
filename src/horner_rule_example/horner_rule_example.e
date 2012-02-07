note
	rosettacode:"Horner's rule for polynomial evaluation"
	URI:"[
		http://rosettacode.org/wiki/Horner%27s_rule_for_polynomial_evaluation
		]"
	description:"[
		A fast scheme for evaluating a polynomial such as:
		-19 + 7x - 4x^2 + 6x^3
		when
		x = 3	
		is to arrange the computation as follows:
		((((0)x + 6)x + (-4))x + 7)x + (-19)
		And compute the result from the innermost brackets outwards
	]"

class
	HORNER_RULE_EXAMPLE

create
	make

feature

	make
		local
			l_coefficients: ARRAY[INTEGER]
		do
			l_coefficients :=<<-19, 7, -4, 6>>
			print("Horner's rule polynomial evaluation: " + polynomial_evaluation(l_coefficients,3).out )
		end

	polynomial_evaluation (coefficients : ARRAY[INTEGER] ; x:INTEGER ) : INTEGER
		require
			valid_degree : coefficients.count = x + 1
		local
			i : INTEGER
		do
			from
				Result := 0
				i := coefficients.count
			until
				i=0
			loop
				Result := (Result * x) + coefficients[i]
				i := i - 1
			end
		end

end -- class HORNER_RULE_EXAMPLE

