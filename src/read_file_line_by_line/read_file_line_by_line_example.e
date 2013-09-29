note
	description: "Summary description for {READ_FILE_LINE_BY_LINE_EXAMPLE}."
	EIS: "name=Read File Line By Line Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Read_a_file_line_by_line", "tag=requirement"

class
	READ_FILE_LINE_BY_LINE_EXAMPLE

create
	make

feature

	make
			-- Run example.
		local
			f: RAW_FILE
			line: NATURAL
		    content: STRING
		do
			create f.make ("src/read_specific_line.txt")
			if f.exists and then f.is_readable then
				f.open_read
				from
					line := 1
				until
					f.end_of_file
				loop
					f.read_line
					content := f.last_string
					print ("%NThe content at line [:" + line.out +"] :%N" + content)
					line := line + 1
				end
				f.close
			else
				print ("Can not read file %"" + f.name + "%".%N")
			end
		end

end
