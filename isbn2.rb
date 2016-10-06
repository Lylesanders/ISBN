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
	sum = 0
	check_sum = 0
	mask =[1,3,1,3,1,3,1,3,1,3,1,3]
	thirteen_digit_array = isbn.chars.map!(&:to_i)
	(0..11).each do |counter|
		sum = thirteen_digit_array[counter] * mask[counter]
		check_sum = check_sum + sum
		
	end # of do loop
	check_sum1 = 10 - (check_sum % 10)	
	check_digit = thirteen_digit_array[-1]
	
	check_digit == check_sum1
	
end #end of function valid isbn 13 check sum


def remove_spaces(isbn)
    isbn.gsub(" ", "") #this strips the whitespace and redifines isbn by using the !. remember ! is permenantish
    # isbn.delete!(" ") #this deletes the item in the quotes
end

def remove_dashes(isbn)

    isbn.gsub("-", "") #this strips the dashes from isbn and redefines it without them

    # isbn.delete!("-")

end