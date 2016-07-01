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

  def initialize(pt = :human)
    @player_type = pt
    set_name
  end

  def set_name
    if human?
      n = nil
      loop do
        puts "What's your name?"
        n = gets.chomp
        break unless n.empty?
        puts 'Please enter a valid name'
      end
      self.name = n 
    else
      self.name = ['R2D2', 'Hal', 'Chappie'].sample
    end
  end

  def choose
    if human?
      self.move = nil
      while self.move == nil
        puts 'Please choose rock(r), paper(p), or scissors(s):'
        self.move = case gets.downcase.chomp
                    when 'rock' , 'r'
                      'rock'
                    when 'paper' , 'p'
                      'paper'
                    when 'scissors' , 's'
                      'scissors'
                    else
                      puts 'Bad input.'
                    end
      end
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end

  private

  def human?
    @player_type == :human
  end
end

class Move
  def initialize

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
    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts 'You won!' if computer.move == 'scissors'
      puts 'Computer won!' if computer.move == 'paper'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts 'You won!' if computer.move == 'rock'
      puts 'Computer won!' if computer.move == 'scissors'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts 'You won!' if computer.move == 'paper'
      puts 'Computer won!' if computer.move == 'rock'
    end
  end

  def initialize
    self.human = Player.new
    self.computer = Player.new(:computer)
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
