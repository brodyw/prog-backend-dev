# munsters_male_age.rb

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

puts munsters.values.reduce(0) { |total_male_age, details| puts total_male_age }
puts munsters.values.reduce(0) { |total_male_age, details| details['gender'] == 'male' ? total_male_age + details['age'] : total_male_age }