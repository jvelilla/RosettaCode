note
	description: "[
	Implement a FIFO queue. Elements are added at one side and popped from the other in the order of insertion.
	Operations:
		push (aka enqueue) - add element
		pop (aka dequeue) - pop first element
		empty - return truth value when empty
		Errors:
			handle the error of trying to pop from an empty queue (behavior depends on the language and platform)
	]"

class
	QUEUE_DEFINITION [G]

inherit
	ANY
		redefine
			out
		end

create
		make

feature {NONE} -- Initialization

		make
				-- Create an empty queue.
			do
				create queue.make (0)
				queue.compare_objects
			ensure
				is_empty: is_empty
			end

feature	-- Access

		is_empty : BOOLEAN
				-- Is there no items?
			do
				Result := (queue.count = 0)
			end

		last_enqueue: detachable G
				-- last element enqueue	

		last_dequeue: detachable G
				-- last element dequeue

feature -- Element Change

		push , enqueue (element: G)
				-- add element
			do
				queue.put_front (element)
				last_enqueue := element
			ensure
				added: queue.has (element)
		    	one_more_element: queue.count = old queue.count + 1
		   	 	asigned: last_enqueue = element
			end

		pop , dequeue
				-- pop first element
			require
				not_empty : not is_empty
			do
				queue.move (queue.count)
				last_dequeue := queue.last
				if attached last_dequeue then
					queue.remove_left
				end
			ensure
				one_less_element: old queue.count - 1 = queue.count
			end

feature -- Output

	out : STRING
		local
			index: INTEGER
		do
			Result := "[ "
			from
				index := queue.count
			until
				index = 0
			loop
				if attached  queue.at (index) as item  then
					Result.append (" " + item_val (item) )
				end
				index := index - 1
			end
			Result.append(" ]")
		end

		item_val (a_item: separate G): STRING
			do
				Result := ""
				if attached a_item as l_item  then
					create Result.make_from_separate (l_item.out)
				end
			end

feature {NONE} -- Implementation

		queue : ARRAYED_LIST [G]


end
