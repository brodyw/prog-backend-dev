# mortgage_calculator.rb

# Given the loan amount, the annual percentage rate, and the loan duration
# Find the monthly payment

# --Pseudocode--
# Get givens
# Monthly Interest Rate = APR / 12
# Loan duration in months = Loan duration * 12
require 'yaml'

MESSAGES = YAML.load_file('mort_calc_messages.yml')
@lang = :eng

def prompt(message)
  puts("=> #{MESSAGES[@lang][message.to_sym]}")
end

def float?(input)
  input.to_i.to_s == input
end

def month_pay(principle, apr, duration)
  mir = apr / 12
  dur_months = duration * 12
  principle * (mir * (1 + mir)**dur_months) / ((1 + mir)**dur_months - 1)
end

prompt('welcome')
prompt('language')

loop do
  lang_input = gets.chomp
  if lang_input == '1' || lang_input == '2'
    @lang = (lang_input == '1' ? :eng : :span)
    break
  end
  prompt('redo')
end

loop do
  prompt('loan_amount')

  loan_amount = ''
  loop do
    loan_temp = gets.chomp
    if float?(loan_temp)
      loan_amount = loan_temp.to_f
      break
    end
    prompt('redo')
  end

  prompt('apr_amount')

  apr = ''
  loop do
    apr_temp = gets.chomp
    if float?(apr_temp)
      apr = apr_temp.to_f
      break
    end
    prompt('redo')
  end

  prompt('duration')

  duration = ''
  loop do
    dur_temp = gets.chomp
    if float?(dur_temp)
      duration = dur_temp.to_f
      break
    end
    prompt('redo')
  end

  monthly_payment = month_pay(loan_amount, apr, duration)
  puts("=> Your monthly mortgage payment is: #{monthly_payment}")
  prompt('do_again')

  eng_options = %w(y, n)
  span_options = %w(s, n)
  response = ''
  loop do
    response = gets.chomp.downcase
    options = (@lang == :eng ? eng_options : span_options)
    break if options.include?(response)
    prompt('redo')
  end

  break if response == 'n'
end
