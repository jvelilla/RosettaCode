note
	description: "Determine whether a given year is a leap year in the Gregorian calendar."
	EIS: "name=Leap Year Requirement", "protocol=URI", "src=http://rosettacode.org/wiki/Leap_year", "tag=requirement"

class
	LEAP_YEAR_EXAMPLE

create
	make

feature -- Initialization

	make
			-- Run example.
		local
			l_date: DATE
			l_dates: ARRAY [INTEGER]
		do
			l_dates := 	{ARRAY[INTEGER]}<<1800,1900,1994,1998,1999,2000,2001,2004,2100,2012,2016,1933>>
			create l_date.make_now
			across l_dates as ic loop
				print ("%NIs the year [" + ic.item.out + "] a lear year? " + l_date.is_leap_year (ic.item).out + " - " + is_leap_year (ic.item).out)
			end
		end

	is_leap_year (a_year: INTEGER): BOOLEAN
			-- Is year `a_year' a leap year?
		do
			if a_year \\ 100 = 0 then
				Result := a_year \\ 400 = 0
			else
				Result := a_year \\ 4  = 0
			end
		end
end
