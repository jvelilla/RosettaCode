class ALL_EXAMPLES

create
	make

feature {NONE} -- Initialization

	make
		-- Run all examples
		local
			any: ANY
		do

			print ("%N%NExecute {ACKERMAN_EXAMPLE} ...%N")
			create {ACKERMAN_EXAMPLE} any.make

			print ("%N%NExecute {BOOLEAN_EXAMPLE} ...%N")
			create {BOOLEAN_EXAMPLE} any.make

			print ("%N%NExecute {CHARACTER_MATCHING_EXAMPLE} ...%N")
			create {CHARACTER_MATCHING_EXAMPLE} any.make

			print ("%N%NExecute {COMPLEX_NUMBER_EXAMPLE} ...%N")
			create {COMPLEX_NUMBER_EXAMPLE} any.make

			print ("%N%NExecute {EPOCH_EXAMPLE} ...%N")
			create {EPOCH_EXAMPLE} any.make

			print ("%N%NExecute {HOFSTADTER_SEQUENCE_EXAMPLE} ...%N")
			create {HOFSTADTER_SEQUENCE_EXAMPLE} any.make

			print ("%N%NExecute {HORNER_RULE_EXAMPLE} ...%N")
			create {HORNER_RULE_EXAMPLE} any.make

			print ("%N%NExecute {LETTER_FREQUENCY_EXAMPLE} ...%N")
			create {LETTER_FREQUENCY_EXAMPLE} any.make

			print ("%N%NExecute {LUCAS_LEHMER_EXAMPLE} ...%N")
			create {LUCAS_LEHMER_EXAMPLE} any.make

			print ("%N%NExecute {READ_SPECIFIC_LINE_FILE_EXAMPLE} ...%N")
			create {READ_SPECIFIC_LINE_FILE_EXAMPLE} any.make

			print ("%N%NExecute {REPEAT_STRING_EXAMPLE} ...%N")
			create {REPEAT_STRING_EXAMPLE} any.make

			print ("%N%NExecute {SHA_EXAMPLE} ...%N")
			create {SHA_EXAMPLE} any.make

			print ("%N%NExecute {SYMETRIC_DIFFERENCE_EXAMPLE} ...%N")
			create {SYMETRIC_DIFFERENCE_EXAMPLE} any.make

			print ("%N%NExecute {MUTUAL_RECURSION_EXAMPLE} ...%N")
			create {MUTUAL_RECURSION_EXAMPLE} any.make

			print ("%N%NExecute {SUM_OF_SQUARES_EXAMPLE} ...%N")
			create {SUM_OF_SQUARES_EXAMPLE} any.make

			print ("%N%NExecute QUEUE_DEFINITION_EXAMPLE ...%N")
			create {QUEUE_DEFINITION_EXAMPLE} any.make

			print ("%N%NExecute SUBSTRING_EXAMPLE ...%N")
			create {SUBSTRING_EXAMPLE} any.make

		end

end
