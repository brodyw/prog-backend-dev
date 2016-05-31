# letter_frequencies.rb

statement = "The Flintstones Rock"

char_freq = Hash.new(0)
statement.chars.each { |c| char_freq[c] = char_freq[c] + 1 }
puts char_freq