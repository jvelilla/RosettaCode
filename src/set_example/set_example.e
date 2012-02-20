note
	description: "Summary description for {SET_EXAMPLE}."
	uri : "http://rosettacode.org/wiki/Set"

class
	SET_EXAMPLE
create
	make
feature
	make
		local
			a, b, c, d : ARRAYED_SET[INTEGER]
		do
			-- Set creation
			create a.make (4)
			create b.make (3)
			create c.make (2)
			create d.make (2)

			a.compare_objects
			b.compare_objects
			c.compare_objects
			d.compare_objects

			-- set A(1,2,3,4)
			a.put (1)
			a.put (2)
			a.put (3)
			a.put (4)

			-- set B(2,3,4,5)
			b.put (2)
			b.put (3)
			b.put (4)
			b.put (5)

			-- set C(5,6)
			c.put (5)
			c.put (6)

			has_element (1, A)
			has_element (10, A)
			union (a,b)
			union (a,c)
			interseccion (a, b)
			interseccion (a, c)
			interseccion (b, c)
			difference (a, b)
			difference (a, c)
			difference (b, c)
			subset (a, b)
			subset (b, a)
			subset (b, b)
			equality (a, b)
			equality (a, a)

			-- set D(3,4)
			d.put (3)
			d.put (4)

			proper_subset (a, a)
			proper_subset (d, a)

			-- modify a set
			d.extend (4)
			   -- insert the value in the set if it's not present
			check
				d.count = 2
			end
			d.extend (5)
			check
				d.count = 3
			end

		end

	has_element (e : INTEGER; b : SET[INTEGER])
		-- Test m ∈ S -- "m is an element in set S"
		do
			print ("%NHas the set: " + b.out +"the element "+ e.out + "? " + b.has (e).out)
		end

	union (a , b : ARRAYED_SET[INTEGER])
		-- A ∪ B -- union; a set of all elements either in set A or in set B.
		local
			aux : ARRAYED_SET[INTEGER]
		do
			aux := a.twin
			aux.merge (b)
			print ("%N Union:" + aux.out)
		end

	interseccion (a , b : ARRAYED_SET[INTEGER] )
		-- A ∩ B -- intersection; a set of all elements in both set A and set B.
		local
			aux : ARRAYED_SET[INTEGER]
		do
			aux := a.twin
			aux.intersect (b)
			print ("%N Interseccion:" + aux.out)
		end

	difference	(a , b : ARRAYED_SET [INTEGER])
		--A ∖ B -- difference; a set of all elements in set A, except those in set B.
		local
			aux : ARRAYED_SET[INTEGER]
		do
			aux := a.twin
			aux.subtract (b)
			print ("%N difference:" + aux.out)
		end

	subset	(a , b : ARRAYED_SET [INTEGER])
		--A ⊆ B -- subset; true if every element in set A is also in set B.
		do
			if a.is_subset (b) then
				print ("%NSet A is subset of B")
			else
				print ("%NSet A is not subset of B")
			end
		end

	equality	(a , b : ARRAYED_SET [INTEGER])
			--A = B -- equality; true if every element of set A is in set B and vice-versa.	
		do
			print ("%NA = B :" + a.is_equal (b).out)
		end

	proper_subset (a , b : ARRAYED_SET [INTEGER])
		-- If A ⊆ B, but A ≠ B, then A is called a true or proper subset of B, written A ⊂ B or A ⊊ B
		do
			if a.is_subset (b) and then (not a.is_equal (b)) then
				print ("%NA ⊂ B : True")
			else
				print ("%NA ⊂ B : False")
			end
		end




end
