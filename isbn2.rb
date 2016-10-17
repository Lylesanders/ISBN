def valid_isbn?(isbn)
	remove_spaces(isbn)
	remove_dashes(isbn)
	if valid_10_digit?(isbn) && valid_10_digit_checksum?(isbn)
		true
	elsif valid_13_digit?(isbn) && valid_13_digit_checksum?(isbn)
		true
	else
		false
	end # if
	
end # function

def valid_10_digit?(isbn)
	isbn.length == 10
end # valid 10 digit function 

def valid_13_digit?(isbn)
	isbn.length == 13
end # valid 13 digit function


def remove_spaces(isbn)

	isbn = isbn.delete!(" ")

end

def remove_dashes(isbn)
	
	isbn = isbn.delete!("-")

end

def valid_10_digit_checksum?(isbn)
	# puts"calculating 10 digit check sum "
	sum = 0 	#zero out sum 
	isbn_array = isbn.chars.map!(&:to_i) #loads individual characters in isbn into isbn_array and converts to integer
	isbn_array.each_with_index do |value, index| # iterate through the array
		break if index == 9 # stops the loop at position 9 in the array
		sum += (index+1) * value #multiply the array value at index position by the hash umber for the index
	end # end of do loop
check_sum = sum % 11
if check_sum == 10 # this section of code converts 10 to match a checksum of x
	check_sum ="X"
end
	check_sum_string = check_sum.to_s # converts checksum to string
	if check_sum_string == isbn[-1].upcase #hecks that check_sum string = last character if isbn
		true
	else
		false
	end #end of if statement
end

def valid_13_digit_checksum?(isbn)
	# puts"calculating 13 digit check sum "
	sum = 0 	#zero out sum 
	check_sum_string =""
	isbn_array = isbn.chars.map!(&:to_i) #loads individual characters in isbn into isbn_array and converts to integer
	isbn_array.each_with_index do |value, index| # iterate through the array
		break if index == 12 # stops the loop at position 9 in the array
			if index % 2 == 0
				sum += value * 1
				# sum += value
			else 
				sum += value * 3
			end #end if
		end # end do loop
		check_1 = sum % 10
		#puts "check 1 = #{check_1}"
		check_2 = 10 - check_1
		#puts "check 2 =#{check_2}"
		check_3 = check_2 % 10
		#puts "check 3 = #{check_3}"
		check_sum_string = check_3.to_s
		#check_sum_string = isbn[-1]
		# puts "check sum string = #{check_sum_string}"
		# puts "isbn[-1] = #{isbn[-1]}"
	if check_sum_string == isbn[-1] #hecks that check_sum string = last character if isbn
		true
	else
		false
	end #end of if statement		



end