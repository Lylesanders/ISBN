#AIM:
# Create a program that will verify if a string is a valid ISBN number (see requirements below).
# Use a TDD approach.
# This is a big exercise - break it down into chunks!

# REQUIREMENTS FOR ISBN
# ISBN-10 is made up of 9 digits plus a check digit (which
# may be 'X') and ISBN-13 is made up of 12 digits plus a
# check digit. Spaces and hyphens may be included in a code,
# but are not significant. This means that 9780471486480 is
# equivalent to 978-0-471-48648-0 and 978 0 471 48648 0.
# The check digit for ISBN-10 is calculated by multiplying
# each digit by its position (i.e., 1 x 1st digit, 2 x 2nd
# digit, etc.), summing these products together and taking
# modulo 11 of the result (with 'X' being used if the result
# is 10).

# The check digit for ISBN-13 is calculated by multiplying
# each digit alternately by 1 or 3 (i.e., 1 x 1st digit,
# 3 x 2nd digit, 1 x 3rd digit, 3 x 4th digit, etc.), summing
# these products together, taking modulo 10 of the result
# and subtracting this value from 10, and then taking the
# modulo 10 of the result again to produce a single digit.

def isbn_valid(pro)

	remove_dash_space(pro)
	
	result ="invalid"
	accum = 0					# stores the value of pro * hash
	hash_key = "131313131313" 			#hash for isbn 13
	hash_check = 0						# variable to compare to check_sum to determin valid or invalid
	check_sum = pro[((pro.length)-1)] 	# capture the last character in pro as the check sum

		if check_sum =="x"				# change check_sum = x to check_sum = 10
			check_sum = 10
		end


		if pro.length == 10
			hash_check = calculate_check_sum_for_10_digit(pro)
		end
			
		if pro.length == 13
			calculate_check_sum_for_13_digits(pro)

			
		end

		if hash_check == check_sum
			result = "valid"
		else
			result = "invalid"
		end
		result
end
def remove_dash_space(pro)
	#puts "class of pro initial pro #{pro.class}"
	pro = pro.gsub("-","")				# removes dashes move into a function to remove dashes and spaces
	pro = pro.gsub(" ","")				# removes spaces
	#pro=pro.gsub(/[^0-9a-x]/i,"")
	#puts "revised pro #{pro}"
end

def calculate_check_sum_for_10_digit(pro)
			accum = 0
			(0..8).each do |counter|
				accum = accum + pro[counter].to_i * counter+1
			end
			hash_check = accum % 11
end

def calculate_check_sum_for_13_digits(pro)
		hash_key = "131313131313" 			#hash for isbn 13
		(1..12).each do |counter|
			accum = accum + pro[counter].to_i * hash_key[counter].to_i
		end
		hash_check = 10 - (accum % 10)
end
