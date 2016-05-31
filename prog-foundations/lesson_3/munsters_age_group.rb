# munsters_age_group.rb

def categorize_age(age)
  case
  when age <= 17
    'kid'
  when age <= 64
    'adult'
  else
    'senior'
  end
end

munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender'=> 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female' }
}

munsters.each_key do |k|
  munsters[k]['age_group'] = categorize_age(munsters[k]['age'])
end

puts munsters
