pages_with_questions = {} 					#empty hash where we will store identifiers and their string values

key = "" 									#empty key that will contain value
lines_grabbed = "" 							#empty string (hash value)

File.open("story.txt", "r") do |infile|  	#opens the file, and contains the code that will be applied to file

	#loop that assigns the text attached to each identifier
	while (line = infile.gets) 				#as long as there are lines in the file
		if line.index("~p") 				#if the line starts with ~p
			key = line 						#set that line(identifier) as the key
			lines_grabbed = ""				#reset value for new key
		else
			lines_grabbed += line 			#if that line doesn't have an identifier, then add it to empty string
		end
		pages_with_questions[key] = lines_grabbed		#set the string as value for the key in the hash
	end

	#method that prints a value with given identifier
	def output(p_num, pages_with_questions)
		page = pages_with_questions.select {|k,v| k.index("~#{p_num}")} 	#in the pages_with_question, find the lines that start with ~
		page.each {|k,v| puts v} 											#for each key, print the matching value
	end

	#calling the output method 
	output("p1", pages_with_questions) #print p1


	#loop that asks for input, until that input is one of the available choices
	correct = true
	while correct
		puts "Make your choice (1,2,3)"
		input = gets.chomp
			if (input == "1" || input == "2" || input == "3") 
				correct = false
			else
				puts "Try again"
			end
	end

	pages_with_questions.select {|k,v| key = k if k.index("~p1:c#{input}")} #find the identifier with the corresponding choice
	ans = key.split(":") 													#split that choice into an array
	output(ans[ans.count-1], pages_with_questions) 							#call input on the last element of the ans array (correspond page for given choice)

end