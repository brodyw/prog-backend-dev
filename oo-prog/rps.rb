# rps.rb

# Rock paper scissors is a game between two players wherein each player
# gets one move (rock, paper, scissors). There are three simple rules:
# - rock beats scissors
# - scissors beats paper
# - paper beats rock
# If the players choose the same move, then it is a tie
# Classes: Move, Player, Rule
# Functions: Choose, Compare

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = nil
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts 'Please enter a valid name'
    end
    self.name = n 
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.downcase.chomp
      break if Move::HANDS.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie'].sample
  end

  def choose
    self.move = Move.new(Move::HANDS.sample)
  end
end

class Move
  HANDS = ['rock', 'paper', 'scissors']

  def initialize(h)
    @hand = h
  end

  def >(other_move)
    return case @hand
           when 'rock'
             other_move.scissors? ? true : false
           when 'scissors'
             other_move.paper? ? true : false
           when 'paper'
             other_move.rock? ? true: false
           end
  end

  def rock?
    @hand == 'rock' 
  end

  def paper?
    @hand == 'paper'
  end

  def scissors?
    @hand == 'scissors'
  end

  def to_s
    @hand
  end
end

class RPSGame
  attr_accessor :human, :computer

  def display_welcome_message
    puts 'Welcome to Rock, Paper, Scissors!'
  end

  def display_goodbye_message
    puts 'Thanks for playing Rock, Paper, Scissors. Good bye!'
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
    if human.move > computer.move
      puts "#{human.name} won this round!"
    elsif computer.move > human.move
      puts "#{computer.name} won this round!"
    else
      puts "It's a tie!"
    end
  end

  def initialize
    self.human = Human.new
    self.computer = Computer.new
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts 'Please enter a valid response'
    end
    answer == 'y'
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      display_goodbye_message
      break unless play_again?
    end
  end

end

RPSGame.new.play

