require "minitest/autorun"						# add minitest function to program
require_relative "isbn2.rb"					# point minitest to division.rb

class TestISBN2 < Minitest::Test  	#create template for test

	def test_one_equal_one_
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
		isbn = "04 719 586 9 7"
		assert_equal(true, valid_isbn?(isbn))
	end

	def test_valid_returns_0471958697_no_dashes
		isbn = "04-719-58697"
		assert_equal(true, valid_isbn?(isbn))
	end

	def test_invalid_returns_04719586978
		isbn = "04-719-586-99"
		assert_equal(false, valid_isbn?(isbn))
	end

	def test_invalid_returns_24719586978
		isbn = "24-719-586-99"
		assert_equal(true, valid_isbn?(isbn))
	end

	def test_valid_returns_123456789x
		isbn = "123456789x"
		assert_equal(true, valid_isbn?(isbn))
	end

	def test_invalid_returns_323456789x
		isbn = "323456789x"
		assert_equal(false, valid_isbn?(isbn))
	end

	def test_invalid_returns_1234567891231
		isbn = "1234567891231"
		assert_equal(true, valid_isbn_13_length?(isbn))
	end

	def test_invalid_returns_1234567891231
		isbn = "12345678912531"
		assert_equal(false , valid_13_digit_checksum?(isbn))
	end

	def test_valid_returns_1234567891231
		isbn = "1234567891231"
		assert_equal(true, valid_13_digit_checksum?(isbn))
	end

	# def test_valid_returns_1234567891232
	# 	isbn = "1234567891232"
	# 	assert_equal(false, valid_13_digit_checksum?(isbn))
	# end
	# # numbers beyond this point are from amazon
	# # isdn 10 valids

	# def test_valid_returns_0844239097
	# 		isbn = "0844239097"
	# 		assert_equal(true, valid_isbn?(isbn))
	# end

	# def test_valid_returns_0345338588
	# 		isbn = "0345338588"
	# 		assert_equal(true, valid_isbn?(isbn))
	# end


	# def test_valid_returns_0671891510
	# 		isbn = "0671891510"
	# 		assert_equal(true, valid_isbn?(isbn))
	# end

	# # isdn 10 invalids

	# def test_invalid_returns_0844239097
	# 		isbn = "0844239098"
	# 		assert_equal(false, valid_isbn?(isbn))
	# end

	# def test_invalid_returns_0345338587
	# 		isbn = "0345338587"
	# 		assert_equal(false, valid_isbn?(isbn))
	# end

	# def test_invalid_returns_0671891512
	# 		isbn = "0671891512"
	# 		assert_equal(false, valid_isbn?(isbn))
	# end

	# #isdn 13 valid
	# def test_valid_returns_9780844239095
	# 		isbn = "978-0844239095"
	# 		assert_equal(true, valid_isbn?(isbn))
	# end

	# def test_valid_returns_9780345338587
	# 		isbn = "978-0345338587"
	# 		assert_equal(true, valid_isbn?(isbn))
	# end

	# def test_valid_returns_9780671891510
	# 		isbn = "978-0671891510"
	# 		assert_equal(true, valid_isbn?(isbn))
	# end

	# # # isdn 13 invalid

	# def test_invalid_returns_9780844239096
	# 	isbn = "978-0844239096"
	# 	assert_equal(false, valid_isbn?(isbn))
	# end

	# def test_invalid_returns_9780345338586
	# 	isbn = "978-0345338586"
	# 	assert_equal(false, valid_isbn?(isbn))
	# end

	# def test_invalid_returns_9780671891511
	# 	isbn = "978-0671891511"
	# 	assert_equal(false, valid_isbn?(isbn))
	# end

end