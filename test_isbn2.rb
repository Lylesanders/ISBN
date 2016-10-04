require "minitest/autorun"						# add minitest function to program
require_relative "isbn2.rb"					# point minitest to division.rb

class TestISBN2 < Minitest::Test  	#create template for test

	def test_one_equal_one_6
		assert_equal(1,1)
	end

	def test_valid_ten_digit_isbn_10
		isbn = "0471958697"
		assert_equal(true, valid_isbn?(isbn))
	end

	def test_empty_string_returns_false_15
		isbn = " "
		assert_equal(false, valid_isbn?(isbn))
	end

	def test_valid_returns_0471958697_no_spaces_20
		isbn = "04 719 586 97"
		assert_equal(true, valid_isbn?(isbn))
	end

	def test_valid_returns_0471958697_no_dashes_25
		isbn = "04-719-586-97"
		assert_equal(true, valid_isbn?(isbn))
	end

	def test_invalid_returns_04719586978_30
		isbn = "04-719-586-99"
		assert_equal(false, valid_isbn?(isbn))
	end

		def test_invalid_returns_24719586978_35
		isbn = "24-719-586-99"
		assert_equal(true, valid_isbn?(isbn))
	end

end