# uuid.rb
require 'securerandom'

def uuid_easy()
  "#{SecureRandom.hex(4)}-#{SecureRandom.hex(2)}-#{SecureRandom.hex(2)}-"\
  "#{SecureRandom.hex(2)}-#{SecureRandom.hex(6)}"
end

def uuid_hard()
  "#{random_hex(8)}-#{random_hex(4)}-#{random_hex(4)}-#{random_hex(4)}-"\
  "#{random_hex(4)}-#{random_hex(12)}"
end
  
def random_hex(num_of_chars)
  available_chars = [*'a'..'f'] + [*'1'..'9']
  r_hex_string = ''
  num_of_chars.times { r_hex_string << available_chars.sample }
  r_hex_string
end

#puts uuid_easy
puts uuid_hard
