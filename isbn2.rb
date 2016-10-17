def valid_isbn?(isbn)
	remove_spaces(isbn)
	remove_dashes(isbn)
	# valid_isbn_length?(isbn)
	if valid_isbn_length?(isbn) == true && isbn.length == 10
		valid_10_digit_checksum?(isbn)
	else
		false
	end
end

def valid_isbn_length?(isbn)
	puts isbn.length 			#remove this line of code vefore finalize
	if isbn.length == 10
		true
	elsif isbn.length == 13
		true
	else
		false
	end
end

def remove_spaces(isbn)

	isbn.delete!(" ")

end

def remove_dashes(isbn)
	
	isbn.delete!("-")

end

def valid_10_digit_checksum?(isbn)
	puts"calculating 10 digit check sum "
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

def valid_isbn_13_length?(isbn)
	true


end