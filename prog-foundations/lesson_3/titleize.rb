# titleize.rb

def titleize(title)
  words = title.split(' ')
  words.map { |word| word.capitalize }.join(' ')
end

