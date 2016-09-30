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



end