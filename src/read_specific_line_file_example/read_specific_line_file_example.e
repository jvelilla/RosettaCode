note
	description: "Example RosettaCode read a specific line from a file"
	uri: "http://rosettacode.org/wiki/Read_a_specific_line_from_a_file"

class
	READ_SPECIFIC_LINE_FILE_EXAMPLE
create
	make
feature
	make
		do
			content_at (1)
			io.put_new_line
			content_at (10)
			io.put_new_line
			content_at (15)
		end

	content_at (n:NATURAL)
		local
			f : RAW_FILE
			line : NATURAL
		    content : STRING
		do
			content := "The line ["+ n.out + "] does not exist!!!"
			create f.make_open_read ("./src/read_specific_line.txt")
			from
				line := 1
			until
				line > n or f.end_of_file
			loop
				if line = n then
					f.read_line
					content := f.last_string
				end
				f.next_line
				line :=line + 1
			end
			print ("%NThe content at line [:" + n.out +"] :%N"+content)
			f.close
		end
end
