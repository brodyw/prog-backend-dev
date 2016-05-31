# tic_tac_toe.rb

# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

# board sequence
# 1 2 3
# 4 5 6
# 7 8 9

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diags

def prompt(message)
  puts "==> #{message}"
end

def joinor(arr, delim = ', ', final_delim = 'or')
  last_element = arr.pop
  arr.join(delim) + delim + final_delim + ' ' + last_element.to_s
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3 ||
       brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return true
    end
  end
  false
end

# returns array of squares of specified marker that are one away from three
def threat_squares(brd, marker)
  threat_sq = []
  WINNING_LINES.each do |line|
    vals = brd.values_at(*line)
    if vals.include?(INITIAL_MARKER) &&
       vals.count(marker) == 2
      threat_sq.push(line[vals.index(INITIAL_MARKER)])
    end
  end
  threat_sq
end

def losing_squares(brd)
  threat_squares(brd, PLAYER_MARKER)
end

def winning_squares(brd)
  threat_squares(brd, COMPUTER_MARKER)
end
  
def computer_screwed?(brd)
  lose_sq = losing_squares(brd)
  win_sq = winning_squares(brd)
  if lose_sq.size == 2 && win_sq.size == 0
    return true
  end
  false
end

def computer_choose_move(brd)
  empty_sq = empty_squares(brd)
  lose_sq = losing_squares(brd)
  win_sq = winning_squares(brd)
  if brd[5] == INITIAL_MARKER then return 5 end
  if win_sq.size >= 1 then return win_sq[0] end
  if lose_sq.size == 1 then return lose_sq[0] end
  empty_sq.sample
end

def draw_board(brd)
  puts '     |     |     '
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts '     |     |     '
  puts '-----+-----+-----'
  puts '     |     |     '
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts '     |     |     '
  puts '-----+-----+-----'
  puts '     |     |     '
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts '     |     |     '
  puts ''
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Pick a square (#{joinor(empty_squares(brd), ', ', 'or')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt 'Invalid response'
  end
  brd[square] = PLAYER_MARKER
end

def display_score(p_score, c_score)
  prompt "The score is: Player(#{p_score}) - Computer(#{c_score})"
end

def computer_places_piece!(brd)
  square = computer_choose_move(brd)
  brd[square] = COMPUTER_MARKER
end

loop do
  player_score = 0
  comp_score = 0

  loop do
    board = initialize_board
    draw_board(board)

    loop do
      player_places_piece!(board)
      draw_board(board)
      if someone_won?(board)
        prompt 'Player won this round!'
        player_score += 1
        display_score(player_score, comp_score)
        break
      end

      if board_full?(board)
        prompt "It's a tie this round!"
        display_score(player_score, comp_score)
        break
      end

      if computer_screwed?(board)
        prompt 'Computer realizes he screwed up. Computer surrenders round!'
        player_score += 1
        display_score(player_score, comp_score)
        break
      end

      computer_places_piece!(board)
      draw_board(board)
      if someone_won?(board)
        prompt 'Computer won this round!'
        comp_score += 1
        display_score(player_score, comp_score)
        break
      end

    end

    break if player_score == 5 || comp_score == 5
  end

  if player_score == 5
    prompt 'Player is the winner!'
  else
    prompt 'Computer is the winner!'
  end

  play_again = ''
  loop do
    prompt 'Play again? (y or n)'
    play_again = gets.chomp
    break if play_again =~ /\A(y|n)\z/
    prompt 'Invalid response.'
  end
  break if play_again == 'n'
end

prompt 'Thank you! Hope you had fun!'
