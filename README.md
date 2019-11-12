# words_from_phone_number
# Convert phone number to words / words combinations in Ruby:

Given a 10 digit phone number, you must return all possible words or combination of words from the provided dictionary, that can be mapped back as a whole to the number.

The phone number mapping to letters is as follows:

2 = a b c

3 = d e f

4 = g h i

5 = j k l

6 = m n o

7 = p q r s

8 = t u v

9 = w x y z
 
The phone numbers will never contain a 0 or 1. 
Words have to be at least 3 characters.

To get give you an initial verification, the following must be true:

6686787825 should return the following list [["motor", "usual"], ["noun", "struck"], ["nouns", "truck"], ["nouns", "usual"], ["onto", "struck"], "motortruck"]

2282668687 should return the following list [["act", "amounts"], ["act", "contour"], ["acta", "mounts"], ["bat", "amounts"], ["bat", "contour"], ["cat", "contour"], "catamounts"]

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes


### Installation
- Clone the repository
  - Got to repository folder: `cd words_from_phone_number`
  - Install ruby 2.6.2
    - Using RVM: `rvm install 2.6.2`
    - Using Rbenv: `rbenv install 2.6.2`
  - Install `bundler` gem using `gem install bundler`
  - Get all dependencies: `bundle install`

## Execution
  - Run the program: `ruby lib/words_from_phone_number/conversion.rb`
  - Run the tests: `rspec spec --format documentation`