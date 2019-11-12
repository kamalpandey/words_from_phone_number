# frozen_string_literal: true

ERROR_MSG = 'Invalid Phone number.'
NUMBER_KEY_MAPPING = {
  '2' => %w[a b c],
  '3' => %w[d e f],
  '4' => %w[g h i],
  '5' => %w[j k l],
  '6' => %w[m n o],
  '7' => %w[p q r s],
  '8' => %w[t u v],
  '9' => %w[w x y z]
}.freeze

# Provides combination of words to given phone number.
class Conversion
  def initialize(phone_number)
    @phone_number = phone_number
    @number_key_mapping = NUMBER_KEY_MAPPING
    @dictionary = load_dictionary
    @final_words = []
  end

  def generate_words
    return ERROR_MSG unless valid_phone_number?

    key_characters = phone_number.split('').map do |number|
      number_key_mapping[number]
    end

    # Take all possible combinations of the words on the keys.
    key_words = key_characters.shift.product(*key_characters).map(&:join)

    search_word_combinations(key_words)
  end

  def load_dictionary
    @dictionary = []
    File.foreach('lib/words_from_phone_number/dictionary.txt') do |word|
      @dictionary << word.strip
    end
    @dictionary.map(&:downcase)
  end

  # Search all possible combinations against dictionary.
  def search_word_combinations(key_words)
    i = 2
    while i < 7
      # Find all matching words from dictionary
      lookup_one = dictionary & key_words.map { |x| x[0..i] }.uniq
      lookup_two = dictionary & key_words.map { |y| y[i + 1..-1] }.uniq

      # Combining the lookup result arrays
      merge_lookup = lookup_one.product(lookup_two)
      final_words << merge_lookup unless merge_lookup.empty?
      i += 1
    end
    find_exact_matches(key_words)
  end

  def find_exact_matches(key_words)
    # Get exact matches
    exact_matches = dictionary & key_words
    final_words << exact_matches
    # Flatten final array by one level.
    final_words.flatten(1)
  end

  def valid_phone_number?
    phone_number.gsub(/[^2-9]/, '').length == 10
  end

  attr_accessor :number_key_mapping, :dictionary, :phone_number, :final_words
end

puts 'Please enter the 10 digit mobile number :'
puts phone_number = '6686787825' # gets.chomp
start_time = Time.now
object = Conversion.new phone_number
object.generate_words
finish_time = Time.now
difference = finish_time - start_time
puts difference
