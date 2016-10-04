require "minitest/autorun"						# add minitest function to program
require_relative "isbn2.rb"					# point minitest to division.rb

class TestISBN2 < Minitest::Test  	#create template for test
def test_one_equal_one
	assert_equal(1,1)
end





end