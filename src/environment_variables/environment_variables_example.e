note
	description: "Summary description for {ENVIRONMENT_VARIABLES_EXAMPLE}."
	EIS: "name=Environment Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Environment_variables", "tag=requirement"

class
	ENVIRONMENT_VARIABLES_EXAMPLE

inherit
    EXECUTION_ENVIRONMENT

create
    make

feature -- Initialization

    make
    		-- Run example.
        do
        	print("%N ----------- Get all environment variables -------------------")
        	retrive_all
        	print("%N ----------- Get a specific environment variable -------------------")
			retrive
        	print("%N ----------- Create and retrueve an environment variable-------------------")
			create_retrieve
        end

feature {NONE} -- Other

	retrive_all
		   -- Retrieve and print each environment variable property and value
        local
        	variables : HASH_TABLE[STRING,STRING]
        do
        	variables := starting_environment_variables
			from
        		variables.start
        	until
        		variables.off
        	loop
        		print ("%NProperty:" + variables.key_for_iteration + "Value:" + variables.item_for_iteration)
        		variables.forth
        	end
        end

    retrive
    	   -- Retrieve and print value for specific environment variable
        do
         	if attached get ("PATH") as l_path then
        	    print ("%NVariable PATH:" + "Value:" + l_path)
        	else
        		print ("%NVariable PATH: doesn't exist")
        	end
        end

	create_retrieve
             -- Create and retrieve an environment variable.
        do
            put ("Hello World!", "MY_VARIABLE")
            io.new_line
            print (get ("MY_VARIABLE"))
        end
end
