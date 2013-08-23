note
	description: "Rosetta Code examples"
	EIS: "name=Rosetta Code Project", "protocol=URI", "src=http://rosettacode.org/", "tag=project"
	date: "22 August 2013"

class
	ALL_EXAMPLES

inherit
	ARGUMENTS

create
	make

feature -- Initialization

	make
			-- Run all examples.
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

			print ("%N%NExecute LEAP_YEAR_EXAMPLE ...%N")
			create {LEAP_YEAR_EXAMPLE} any.make

			print ("%N%NExecute STRING_CASE_EXAMPLE ...%N")
			create {STRING_CASE_EXAMPLE} any.make

			print ("%N%NExecute TOKENIZE_STRING_EXAMPLE ...%N")
			create {TOKENIZE_STRING_EXAMPLE} any.make

			print ("%N%NExecute EVEN_ODD_EXAMPLE ...%N")
			create {EVEN_ODD_EXAMPLE} any.make

			print ("%N%NExecute GCD_EXAMPLE ...%N")
			create {GCD_EXAMPLE} any.make

			print ("%N%NExecute FORMATED_NUMERIC_OUTPUT_EXAMPLE ...%N")
			create {FORMATED_NUMERIC_OUTPUT_EXAMPLE} any.make

			print ("%N%NExecute SET_EXAMPLE ...%N")
			create {SET_EXAMPLE} any.make

			print ("%N%NExecute READ_FILE_LINE_BY_LINE_EXAMPLE ...%N")
			create {READ_FILE_LINE_BY_LINE_EXAMPLE} any.make

			print ("%N%NExecute {ENVIRONMENT_VARIABLES_EXAMPLE} ...%N")
			create {ENVIRONMENT_VARIABLES_EXAMPLE} any.make

			print ("%N%NExecute {ARITHMETIC_MEAN_EXAMPLE} ...%N")
			create {ARITHMETIC_MEAN_EXAMPLE} any.make

			print ("%N%NExecute {DOORS_EXAMPLE} ...%N")
			create {DOORS_EXAMPLE} any.make

			print ("%N%NExecute {READ_ENTIRE_FILE_EXAMPLE} ...%N")
			create {READ_ENTIRE_FILE_EXAMPLE} any.make

			print ("%N%NExecute {STRIP_CHARACTERS_STRING_EXAMPLE} ...%N")
			create {STRIP_CHARACTERS_STRING_EXAMPLE} any.make

			print ("%N%NExecute {HAMMING_NUMBERS_EXAMPLE} ...%N")
			create {HAMMING_NUMBERS} any.make

			print ("%N%NExecute {DOT_PRODUCT_EXAMPLE} ...%N")
			create {DOT_PRODUCT_EXAMPLE} any.make

			print ("%N%NExecute VOID_VALUE_EXAMPLE ...%N")
			create {VOID_VALUE_EXAMPLE} any.make

			print ("%N%NExecute SUM_OF_SERIES_EXAMPLE ...%N")
			create {SUM_OF_SERIES_EXAMPLE} any.make

			print ("%N%NExecute FACTORIAL_EXAMPLE ...%N")
			create {FACTORIAL_EXAMPLE} any.make

			print ("%N%NExecute SUDOKU_EXAMPLE ...%N")
			create {SUDOKU_EXAMPLE} any.make

			print ("%N%NExecute HAILSTONE_SEQUENCE_EXAMPLE ...%N")
			create {HAILSTONE_SEQUENCE_EXAMPLE} any.make
		end

end
