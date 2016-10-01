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

	pro = pro.gsub("-","")				# removes dashes
	pro = pro.gsub("-","")				# removes spaces
	loop_counter = 1
	accum_counter = 0					# stores the value of pro * hash
	hash_key = "131313131313" 			#hash for isbn 13
	hash_check = 0						# variable to compare to check_sum to determin valid or invalid
	check_sum = pro[((pro.length)-1)] 	# capture the last character in pro as the check sum

		if check_sum =="x"				# change check_sum = x to check_sum = 10
			check_sum = 10
		end


		if pro.length == 10
			(1..9). each do |loop_counter|
				accum_counter = accum_counter + pro[loop_counter].to_i * loop_counter
			end
			hash_check = accum_counter % 11
		end
			
		if pro.length == 13
			hash_check = check_sum
		end

		if hash_check = check_sum
			result = "valid"
		else
			result = "invalid"
		end
		result
end


