def valid_isbn?(isbn)
    isbn = remove_spaces(isbn) #calls the function referenced and redefines isbn
    isbn = remove_dashes(isbn)
 
    if valid_isbn_ten_length?(isbn) && valid_isbn_ten_check_sum?(isbn) #same as doing and if else statement
        true
    else
        false
    end

    #multiply each digit in the string by it's position for the first 9 digits, then add them and "modulo" cuz thats not a real word! by 11, this should equal the last digit
end   #end function valid_isbn?

def valid_isbn_ten_length?(isbn)
	isbn.length == 10
	#puts "ISBN length == 10 #{isbn.length == 10}"
end # valid isbn ten length

def valid_isbn_13_length?(isbn)
	isbn.length == 13

end # end valid isbn 13 length

def valid_isbn_ten_check_sum?(isbn)
	ten_digit_array = isbn.chars.map!(&:to_i)
	sum = 0
	ten_digit_array.each_with_index do |value, index|
		break if index == 9
		sum  +=(index+1) * value
	end
	check_sum = sum % 11
	if check_sum == 10
		check_sum = "X"
	end

	check_sum_string = check_sum.to_s
	if check_sum_string == isbn[-1].upcase
		true
	else
		false
	end # end if check sum string 

end # end valid isbn ten check sum

def valid_isbn_thirteen_check_sum?(isbn)
	true
end


def remove_spaces(isbn)
    isbn.gsub(" ", "") #this strips the whitespace and redifines isbn by using the !. remember ! is permenantish
    # isbn.delete!(" ") #this deletes the item in the quotes
end

def remove_dashes(isbn)

    isbn.gsub("-", "") #this strips the dashes from isbn and redefines it without them

    # isbn.delete!("-")

end