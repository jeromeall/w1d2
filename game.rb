pages_with_questions = {}
page_text = ""
page_question = ""
page_arbitraty = ""


File.open("story.txt", "r") do |infile|
  while (line = infile.gets)
    if line.match /^~p\d$/
    	until line.index "~p"
    		question_string = pages_with_questions[line].split("\n").gets
    	end
    	 
    elsif line.match /^~p\d:c\d:p\d$/ 
      pages_with_questions[line] = "this is question text"
    end

	end
end

# IO.readlines("story.txt")[1]
puts pages_with_questions
