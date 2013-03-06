#                                                                              
# Copyright 2013 OSABE Satoshi (andropenguin@gmail.com)                                           
#                                                                              
# Licensed under the Apache License, Version 2.0 (the "License");              
# you may not use this file except in compliance with the License.             
# You may obtain a copy of the License at                                      
#                                                                              
#      http://www.apache.org/licenses/LICENSE-2.0                              
#                                                                              
# Unless required by applicable law or agreed to in writing, software          
# distributed under the License is distributed on an "AS IS" BASIS,            
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.     
# See the License for the specific language governing permissions and          
# limitations under the License.                                               
#
# This test file is for testing the statment method of Customer class
# in section 1.1 of Refactoring Ruby Edition. It is a test for
# statment method supporting ascii format.

require 'test/unit'
require_relative 'customer'
require_relative 'movie'
require_relative 'rental'

class TestCustomer < Test::Unit::TestCase
	def setup
		@foo = Customer.new('foo')
	end

	def test_statement_regular_days_rented_is_1
		movie = Movie.new('movie1', Movie::REGULAR)
		days_rented = 1
		rental1 = Rental.new(movie, days_rented)
		@foo.add_rental(rental1)
		# this_amount = 2
		# frequent_renter_points = 1
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + "2" + "\n"
		# total_amount = this_amount = 2
		expected_result = "Rental Record for foo\n" +
			"\t" + "movie1" + "\t" + "2" + "\n" +
			"Amount owed is 2\n" +
			"You earned 1 frequent renter points"

		assert_equal expected_result, @foo.statement
	end

	def test_statement_regular_days_rented_is_3
		movie = Movie.new('movie1', Movie::REGULAR)
		days_rented = 3
		rental1 = Rental.new(movie, days_rented)
		@foo.add_rental(rental1)
		# this_amount = 2
		# this_amount = 2 + (3-2) * 1.5 = 3.5
		# frequent_renter_points = 1
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + "3.5" + "\n"
		# total_amount = this_amount = 3.5
		expected_result = "Rental Record for foo\n" +
			"\t" + "movie1" + "\t" + "3.5" + "\n" +
			"Amount owed is 3.5\n" +
			"You earned 1 frequent renter points"
		assert_equal expected_result, @foo.statement
	end
	
	def test_statement_new_release_days_rented_is_1
		movie = Movie.new('movie1', Movie::NEW_RELEASE)
		days_rented = 1
		rental1 = Rental.new(movie, days_rented)
		@foo.add_rental(rental1)
		# this_amount = 1 * 3 = 3
		# frequent_renter_points = 1
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + "3" + "\n"
		# total_amount = this_amount = 3
		expected_result = "Rental Record for foo\n" +
			"\t" + "movie1" + "\t" + "3" + "\n" +
			"Amount owed is 3\n" +
			"You earned 1 frequent renter points"
		assert_equal expected_result, @foo.statement
	end

	def test_statement_new_release_days_rented_is_2
		movie = Movie.new('movie1', Movie::NEW_RELEASE)
		days_rented = 2
		rental1 = Rental.new(movie, days_rented)
		@foo.add_rental(rental1)
		# this_amount = 2 * 3 = 6
		# frequent_renter_points = 1 + 1 = 2
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + "3" + "\n"
		# total_amount = this_amount = 6
		expected_result = "Rental Record for foo\n" +
			"\t" + "movie1" + "\t" + "6" + "\n" +
			"Amount owed is 6\n" +
			"You earned 2 frequent renter points"
		assert_equal expected_result, @foo.statement
	end

	def test_statement_childrens_days_rented_is_2
		movie = Movie.new('movie1', Movie::CHILDRENS)
		days_rented = 1
		rental1 = Rental.new(movie, days_rented)
		@foo.add_rental(rental1)
		# this_amount = 1.5
		# frequent_renter_points = 1
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + "1.5" + "\n"
		# total_amount = this_amount = 1.5
		expected_result = "Rental Record for foo\n" +
			"\t" + "movie1" + "\t" + "1.5" + "\n" +
			"Amount owed is 1.5\n" +
			"You earned 1 frequent renter points"
		assert_equal expected_result, @foo.statement
	end

	def test_statement_childrens_days_rented_is_4
		movie = Movie.new('movie1', Movie::CHILDRENS)
		days_rented = 4
		rental1 = Rental.new(movie, days_rented)
		@foo.add_rental(rental1)
		# this_amount = 1.5
		# this_amount = 1.5 + (4-3)*1.5 = 3.0
		# frequent_renter_points = 1
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + "3.0" + "\n"
		# total_amount = this_amount = 3.0
		expected_result = "Rental Record for foo\n" +
			"\t" + "movie1" + "\t" + "3.0" + "\n" +
			"Amount owed is 3.0\n" +
			"You earned 1 frequent renter points"
		assert_equal expected_result, @foo.statement
	end

	def test_statement_regular_days_rented_is_1_and_regular_days_rented_is_3
		movie1 = Movie.new('movie1', Movie::REGULAR)
		days_rented1 = 1
		rental1 = Rental.new(movie1, days_rented1)
		@foo.add_rental(rental1)
		movie2 = Movie.new('movie2', Movie::REGULAR)
		days_rented2 = 3
		rental2 = Rental.new(movie2, days_rented2)
		@foo.add_rental(rental2)
		# this_amount = 2
		# frequent_renter_points = 1
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + "2" + "\n"
		# total_amount = 2
		#
		# this_amount = 2
		# this_amount = 2 + (3-2)*1.5 = 3.5
		# frequent_renter_points = 1 + 1 = 2
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + "2" + "\n" +
		# "\t" + "movie2" + "\t" + "3.5" + "\n"
		# total_amount = 2 + 3.5 = 5.5
		expected_result = "Rental Record for foo\n" +
			"\t" + "movie1" + "\t" + "2" + "\n" +
			"\t" + "movie2" + "\t" + "3.5" + "\n" +
			"Amount owed is 5.5\n" +
			"You earned 2 frequent renter points"

		assert_equal expected_result, @foo.statement
	end

	def test_statement_regular_days_rented_is_1_and_new_release_days_rented_is_1
		movie1 = Movie.new('movie1', Movie::REGULAR)
		days_rented1 = 1
		rental1 = Rental.new(movie1, days_rented1)
		@foo.add_rental(rental1)
		movie2 = Movie.new('movie2', Movie::NEW_RELEASE)
		days_rented2 = 1
		rental2 = Rental.new(movie2, days_rented2)
		@foo.add_rental(rental2)
		# this_amount = 2
		# frequent_renter_points = 1
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + "2" + "\n"
		# total_amount = 2
		#
		# this_amount = 1 * 3 = 3
		# frequent_renter_points = 1 + 1 = 2
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + "2" + "\n" +
		# "\t" + "movie2" + "\t" + "3" + "\n"
		# total_amount = 2 + 3 = 5
		expected_result = "Rental Record for foo\n" +
			"\t" + "movie1" + "\t" + "2" + "\n" +
			"\t" + "movie2" + "\t" + "3" + "\n" +
			"Amount owed is 5\n" +
			"You earned 2 frequent renter points"

		assert_equal expected_result, @foo.statement
	end

	def test_statement_regular_days_rented_is_1_and_childrens_days_rented_is_2
		movie1 = Movie.new('movie1', Movie::REGULAR)
		days_rented1 = 1
		rental1 = Rental.new(movie1, days_rented1)
		@foo.add_rental(rental1)
		movie2 = Movie.new('movie2', Movie::CHILDRENS)
		days_rented2 = 1
		rental2 = Rental.new(movie2, days_rented2)
		@foo.add_rental(rental2)
		# this_amount = 2
		# frequent_renter_points = 1
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + "2" + "\n"
		# total_amount = 2
		#
		# this_amount = 1.5
		# frequent_renter_points = 1 + 1 = 2
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + "2" + "\n" +
		# "\t" + "movie2" + "\t" + "1.5" + "\n"
		# total_amount = 2 + 1.5 = 3.5
		expected_result = "Rental Record for foo\n" +
			"\t" + "movie1" + "\t" + "2" + "\n" +
			"\t" + "movie2" + "\t" + "1.5" + "\n" +
			"Amount owed is 3.5\n" +
			"You earned 2 frequent renter points"

		assert_equal expected_result, @foo.statement
	end

	def test_statement_new_release_days_rented_is_1_and_new_release_days_rented_is_2
		movie1 = Movie.new('movie1', Movie::NEW_RELEASE)
		days_rented1 = 1
		rental1 = Rental.new(movie1, days_rented1)
		@foo.add_rental(rental1)
		movie2 = Movie.new('movie2', Movie::NEW_RELEASE)
		days_rented2 = 1
		rental2 = Rental.new(movie2, days_rented2)
		@foo.add_rental(rental2)
		# this_amount = 1 * 3 = 3
		# frequent_renter_points = 1
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + "3" + "\n"
		# total_amount = 2
		#
		# this_amount = 1 * 3 = 3
		# frequent_renter_points = 1 + 1 = 2
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + "3" + "\n" +
		# "\t" + "movie2" + "\t" + "3" + "\n"
		# total_amount = 6
		expected_result = "Rental Record for foo\n" +
			"\t" + "movie1" + "\t" + "3" + "\n" +
			"\t" + "movie2" + "\t" + "3" + "\n" +
			"Amount owed is 6\n" +
			"You earned 2 frequent renter points"

		assert_equal expected_result, @foo.statement
	end

	def test_statement_new_release_days_rented_is_1_and_childrens_days_rented_is_2
		movie1 = Movie.new('movie1', Movie::NEW_RELEASE)
		days_rented1 = 1
		rental1 = Rental.new(movie1, days_rented1)
		@foo.add_rental(rental1)
		movie2 = Movie.new('movie2', Movie::CHILDRENS)
		days_rented2 = 2
		rental2 = Rental.new(movie2, days_rented2)
		@foo.add_rental(rental2)
		# this_amount = 1 * 3 = 3
		# frequent_renter_points = 1
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + "3" + "\n"
		# total_amount = 3
		#
		# this_amount = 1.5
		# frequent_renter_points = 1 + 1 =2
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + "3" + "\n" +
		# "\t" + "movie2" + "\t" + "1.5" + "\n"
		# total_amount = 3 + 1.5 = 4.5
		expected_result = "Rental Record for foo\n" +
			"\t" + "movie1" + "\t" + "3" + "\n" +
			"\t" + "movie2" + "\t" + "1.5" + "\n" +
			"Amount owed is 4.5\n" +
			"You earned 2 frequent renter points"
		assert_equal expected_result, @foo.statement
	end

	def test_statement_childrens_days_rented_is_2_and_childrens_days_rented_is_4
		movie1 = Movie.new('movie1', Movie::CHILDRENS)
		days_rented1 = 2
		rental1 = Rental.new(movie1, days_rented1)
		@foo.add_rental(rental1)
		movie2 = Movie.new('movie2', Movie::CHILDRENS)
		days_rented2 = 4
		rental2 = Rental.new(movie2, days_rented2)
		@foo.add_rental(rental2)
		# this_amount = 1.5
		# frequent_renter_points = 1
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + "1.5" + "\n"
		# total_amount = 1.5
		#
		# this_amount = 1.5
		# this_amount = 1.5 + (4-3)*1.5 = 3.0
		# frequent_renter_points = 1 + 1 = 2
		# result = "Rental Record for foo\n" +
		# "\t" + "movie1" + "\t" + 1.5" + "\n" +
		# "\t" + "movie2" + "\t" + "3.0" + "\n"
		# total_amount = 1.5 + 3.0 = 4.5
		expected_result = "Rental Record for foo\n" +
			"\t" + "movie1" + "\t" + "1.5" + "\n" +
			"\t" + "movie2" + "\t" + "3.0" + "\n" +
			"Amount owed is 4.5\n" +
			"You earned 2 frequent renter points"
		assert_equal expected_result, @foo.statement
	end
end
