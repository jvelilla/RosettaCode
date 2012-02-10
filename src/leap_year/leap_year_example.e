note
	description: "Determine whether a given year is a leap year in the Gregorian calendar."
	uri:"http://rosettacode.org/wiki/Leap_year"
class
	LEAP_YEAR_EXAMPLE
create
	make
feature
	make
		local
			d: DATE
		do
			create d.make_now
			print ("%NIs leap year 2010?:" + d.is_leap_year (2010).out)
			print ("%NIs leap year 1996?:" + d.is_leap_year (1996).out)

		end
end
