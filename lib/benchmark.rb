# frozen_string_literal: true

require_relative 'words_from_phone_number/conversion.rb'

puts 'Please enter the 10 digit mobile number :'
phone_number = gets.chomp
start_time = Time.now
object = Conversion.new phone_number
object.generate_words
puts ERROR_MSG unless object.valid_phone_number?
finish_time = Time.now
difference = finish_time - start_time
puts difference
