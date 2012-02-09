note
	description: "Summary description for {QUEUE_DEFINITION_EXAMPLE}."
	uri:"http://rosettacode.org/wiki/Queue/Definition"
class
	QUEUE_DEFINITION_EXAMPLE
create
		make
feature
		make
			local
				q:QUEUE_DEFINITION[STRING]
			do
				print("%NCreate a queue")
				create q.make
				if q.is_empty then
					print("%NThe queue is empty")
				end
				q.push ("A")
				print("%N Queue:" + q.out)
				q.push ("B")
				print("%N Queue:" + q.out)
				q.push ("C")
				print("%N Queue:" + q.out)
				q.push ("D")
				print("%N Queue:" + q.out)
				q.pop
				print("%N Queue:" + q.out)
				if attached q.last_dequeue as dequeue  then
					print("%NLast element dequeue:" + dequeue)
				end
				q.pop
				if attached q.last_dequeue as dequeue  then
					print("%NLast element dequeue:" + dequeue)
				end
				print("%N Queue:" + q.out)
				q.pop
				if attached q.last_dequeue as dequeue  then
					print("%NLast element dequeue:" + dequeue)
				end
				print("%N Queue:" + q.out)
				q.pop
				if attached q.last_dequeue as dequeue  then
					print("%NLast element dequeue:" + dequeue)
				end

				print("%N Queue:" + q.out)
				if q.is_empty then
					print ("%NThe queue is empty again")
				end
			end

end
