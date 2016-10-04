require "minitest/autorun"						# add minitest function to program
require_relative "isbn2.rb"					# point minitest to division.rb

class TestISBN2 < Minitest::Test  	#create template for test

	def test_one_equal_one
		assert_equal(1,1)
	end

	def test_valid_ten_digit_isbn
		isbn = "0471958697"
		assert_equal(true, valid_isbn?(isbn))
	end

	def test_empty_string_returns_false	
		isbn = " "
		assert_equal(false, valid_isbn?(isbn))
	end

	def test_valid_returns_0471958697_no_spaces
		isbn = "04 719 586 97"
		assert_equal(true, valid_isbn?(isbn))
	end

	def test_valid_returns_0471958697_no_dashes
		isbn = "04-719-586-97"
		assert_equal(true, valid_isbn?(isbn))
	end

		def test_invalid_returns_04719586978
		isbn = "04-719-586-99"
		assert_equal(false, valid_isbn?(isbn))
	end

end