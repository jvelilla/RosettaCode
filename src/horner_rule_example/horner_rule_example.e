note
	rosettacode:"Horner's rule for polynomial evaluation"
	description:"[
		A fast scheme for evaluating a polynomial such as:
		-19 + 7x - 4x^2 + 6x^3
		when
		x = 3	
		is to arrange the computation as follows:
		((((0)x + 6)x + (-4))x + 7)x + (-19)
		And compute the result from the innermost brackets outwards
	]"
	EIS: "name=Horner Rule Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Horner%%27s_rule_for_polynomial_evaluation", "tag=requirement"

class
	HORNER_RULE_EXAMPLE

create
	make

feature -- Initialization

	make
		local
			l_coefficients: ARRAY [INTEGER]
		do
			l_coefficients := <<-19, 7, -4, 6>>
			print ("Horner's rule polynomial evaluation: " + polynomial_evaluation (l_coefficients, 3).out)
		end

feature -- Access

	polynomial_evaluation (a_coefficients: ARRAY [INTEGER]; x:INTEGER): INTEGER
			-- Polynomial evaluation of 'a_coefficients'
		require
			valid_degree: a_coefficients.count = x + 1
		local
			i: INTEGER
		do
			from
				Result := 0
				i := a_coefficients.count
			until
				i = 0
			loop
				Result := Result*x + a_coefficients [i]
				i := i - 1
			end
		end

end

