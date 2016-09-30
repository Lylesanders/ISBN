require "minitest/autorun"						# add minitest function to program
require_relative "isbn.rb"					# point minitest to division.rb

class TestISBN < Minitest::Test  	#create template for test

	def test_1_equal_1
		assert_equal(1,1)
	end

	def test_067159937_return_valid
		book_num ="0-671-59993-7"
		assert_equal("valid", isbn_valid(book_num))
	end

	def test_0_671_59993_7_returns_with_no_dashes
		book_num ="0-671-59993-7"
		assert_equal("valid", isbn_valid(book_num))  
	end

	def test_9783_returns_with_no_dashes
		book_num ="0-671-59993-7"
		assert_equal("valid", isbn_valid(book_num))  
	end

	def test_9_780_59651617_8_returns_valid  # 13 digit isdn number for The Ruby Programming Language
		book_num="9-780-59651617-8"
		assert_equal("valid", isbn_valid(book_num))  
	end

	def test_0596516177_returns_valid  # 10 digit isdn number for The Ruby Programming Language
		book_num="0596516177"
		assert_equal("valid", isbn_valid(book_num))  
	end

		def test_9_780_59651617_8_returns_invalid  
		book_num="9-780-59651617-82"
		assert_equal("invalid", isbn_valid(book_num))  
	end
	
	def test_0596516177_returns_invalid  
		book_num="05965161772"
		assert_equal("invalid", isbn_valid(book_num)) 
	end
end