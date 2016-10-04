def valid_isbn?(isbn)  # main
	isbn = remove_spaces(isbn)
	isbn = remove_dashes(isbn)
	isbn.length ==10 	# works like an if statement returning true/false	
	# multiply each digit in the string by its position for the first 9digits, then add them and modulo divide by 11, this equals the last digit.
	sum = 0
	ten_digit_array = isbn.chars.map!(&:to_i)   #splits the string into an array of individual characters
	ten_digit_array.each.with_index do |value, index|
		break if index == 9
		sum += (index+1) * value
	end
end						#end of function

def remove_dashes(isbn)
	
	isbn.gsub("-","")	#remove dashes ! updates the variable
end

def remove_spaces(isbn)
	isbn.gsub(" ", "") #removes spaces from isbn number ! updates the variableisbn
end