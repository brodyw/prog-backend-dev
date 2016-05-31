# rock_paper_scissors.rb

require 'yaml'

# Scissors cuts Paper covers Rock crushes Lizard poisons
# Spock smashes Scissors decapitates Lizard eats Paper
# disproves Spock vaporizes Rock crushes Scissors
VALID_CHOICES = { 'r' => 'rock', 'p' => 'paper', 'sc' => 'scissors',
                  'l' => 'lizard', 'sp' => 'spock' }.freeze
MESSAGES = YAML.load_file('rps_messages.yml')

def prompt(message)
  puts("=> #{MESSAGES[message.to_sym]}")
end

def win?(first, second)
  (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'rock' && (second == 'lizard' || second == 'scissors')) ||
    (first == 'spock' && (second == 'scissors' || second == 'rock')) ||
    (first == 'lizard' && (second == 'paper' || second == 'spock'))
end

def winner(player, computer)
  if win?(player, computer)
    player
  elsif win?(computer, player)
    computer
  end
end

def choices_to_string(choices = VALID_CHOICES)
  arr = choices.map { |k, str| [k, "#{k.capitalize}) for #{str.capitalize}"] }
  arr.to_h.values.join(', ')
end

prompt('welcome')

loop do
  player_score = 0
  computer_score = 0

  loop do
    player_choice = ''
    loop do
      puts("=> Choose one: #{choices_to_string}")
      player_choice = VALID_CHOICES[gets.chomp.downcase]
      break if VALID_CHOICES.values.include?(player_choice)
      prompt('not_valid')
    end

    computer_choice = VALID_CHOICES.values.sample

    puts("=> Your choice is #{player_choice}."\
           " The computer's choice is #{computer_choice}")

    victor = winner(player_choice, computer_choice)
    if victor == player_choice
      player_score += 1
      prompt('win_round')
    elsif victor == computer_choice
      computer_score += 1
      prompt('lose_round')
    else
      prompt('tie_round')
    end

    puts("You have #{player_score} points and the computer "\
           "has #{computer_score} points")
    if player_score == 5
      prompt('win_game')
      break
    elsif computer_score == 5
      prompt('lose_game')
      break
    end
  end

  prompt('again')
  answer = Kernel.gets.chomp
  break unless answer.casecmp('y') == 0
end

prompt('bye')
