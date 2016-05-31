# calculator.rb
# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on two numbers
# output the result

require 'yaml'

MESSAGES_ENG = YAML.load_file('calculator_messages_english.yml')
MESSAGES_SPAN = YAML.load_file('calculator_messages_spanish.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def number?(input)
  Float(input) rescue false
end

def operation_to_message(operator)
  case operator
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt('Would you like 1) English or 2) Spanish?')

lang = ''
loop do
  lang = gets.chomp
  break if lang == '1' || lang == '2'
  prompt('Please enter a valid response')
end

MESSAGES = (lang == '1' ? MESSAGES_ENG : MESSAGES_SPAN)

prompt(MESSAGES[:welcome])

name = ''
loop do
  name = Kernel.gets.chomp
  break unless name.empty?
  prompt(MESSAGES[:valid_name])
end

prompt("Hi #{name}!")

loop do
  number1 = ''
  loop do
    prompt('Type the first number')
    number1 = Kernel.gets.chomp
    if number?(number1)
      number1 = number1.to_f
      break
    end
    prompt('You did not give a valid number')
  end

  number2 = ''
  loop do
    prompt('Type the second number')
    number2 = Kernel.gets.chomp
    if number?(number2)
      number2 = number2.to_f
      break
    end
    prompt('You did not give a valid number')
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG

  prompt(operator_prompt)
  operator = ''
  loop do
    operator = Kernel.gets.chomp

    break if %w(1 2 3 4).include?(operator)
    prompt('Enter: 1) add 2) subtract 3) multiply 4) divide')
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  answer = case operator
           when '1'
             number1 + number2
           when '2'
             number1 - number2
           when '3'
             number1 * number2
           when '4'
             number1.to_f / number2
           end

  prompt("The answer is: #{answer}")

  response = -1
  loop do
    prompt('Would you like to perform another calculation? (Y or N)')
    response = Kernel.gets.chomp

    break if response.casecmp('y') || response.casecmp('n')
    prompt('You did not enter a valid response')
  end

  break unless response.casecmp('y') == 0
end
