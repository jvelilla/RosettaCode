note
	description: "Summary description for {READ_ENTIRE_FILE_EXAMPLE}."
	EIS: "name=Read Entire File Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Read_entire_file", "tag=requirement"

class
	READ_ENTIRE_FILE_EXAMPLE

create
	make

feature -- Initialization

	make
			-- Run example.
		local
			f: RAW_FILE
			content: STRING
		do
			create f.make_open_read ("src/read_specific_line.txt")
			if f.exists and then f.is_readable then
				f.read_stream (f.count)
				f.close
				content := f.last_string
				print("%N Content of the file:%N" + content)
			else
				print("%N the file does not exist")
			end
		end

end
