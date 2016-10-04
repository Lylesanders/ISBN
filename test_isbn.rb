require "minitest/autorun"						# add minitest function to program
require_relative "isbn.rb"					# point minitest to division.rb

class TestISBN < Minitest::Test  	#create template for test

	def test_1_equal_1
		assert_equal(1,1)
	end
	def test_remove_dash_9
		pro ="1-2-3-4-5-6-7-8-9"
		assert_equal("123456789",remove_dash_space(pro))
	end
	def test_remove_space_13
		pro ="1 2 3 4 5 6 7 8 9 "
		assert_equal("123456789",remove_dash_space(pro))
	end

		def test_remove_nothing_18
		pro ="123456789"
		assert_equal("123456789",remove_dash_space(pro))
	end

	def test_067159937_return_valid_10
		book_num ="0671599937"
		assert_equal( 7, calculate_check_sum_for_10_digit(book_num))
	end

	# def test_0_671_59993_7_returns_valid_15
	# 	book_num ="0-671-59993-7"
	# 	assert_equal("valid", isbn_valid(book_num))  
	# end

	# # def test_9783_returns_with_no_dashes_20
	# # 	book_num ="0-671-59993-8"
	# # 	assert_equal("invalid", isbn_valid(book_num))  
	# # end

	def test_9_780_59651617_8_returns_valid_25  # 13 digit isdn number for The Ruby Programming Language
		pro ="9780596516178"
		assert_equal(8,  calculate_check_sum_for_13_digits(pro))  
	end

	# def test_0596516177_returns_valid_30  # 10 digit isdn number for The Ruby Programming Language
	# 	book_num="0596516177"
	# 	assert_equal("valid", isbn_valid(book_num))  
	# end

	# # def test_9_780_59651617_8_returns_invalid_35  
	# # 	book_num="9-780-59651617-82"
	# # 	assert_equal("invalid", isbn_valid(book_num))  
	# # end
	
	# # def test_0596516177_returns_invalid_40 
	# # 	book_num="05965161772"
	# # 	assert_equal("invalid", isbn_valid(book_num)) 
	# # end
end