# twentyone.rb
#
# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

# deck is a hash w/ key = card and value = hash of (value and quantity)
# each hand is an array of cards (keys)

require 'yaml'

MESSAGES = YAML.load_file('twentyone.yml')

def prompt(message)
  puts '==> ' + message
end

def initialize_deck
  deck = []
  [*2..10, 'J', 'Q', 'K', 'A'].each do |card|
    4.times { deck.push(card) }
  end
  deck.shuffle!
end

def total(hand)
  total = 0
  hand.each do |card|
    total += card_val(card)
  end
  hand.count('A').times do
    total -= 10 if total > 21
  end
  total
end

def bust?(hand)
  total(hand) > 21
end

def card_val(c)
  case c
  when 'A'
    11
  when 'J', 'Q', 'K'
    10
  else
    c.to_i
  end
end

def deal(hand, deck)
  hand.push(deck.pop)
end

def initialize_hands(p_hand, d_hand, deck)
  2.times do
    deal(p_hand, deck)
    deal(d_hand, deck)
  end
end

def display_p(hand)
  prompt "Your hand is: #{hand.join(',')}"
end

def display_d(hand)
  prompt "The dealer's hand is: #{hand.join(',')}"
end

prompt(MESSAGES[:welcome])

deck = initialize_deck

loop do
  player_hand = []
  dealer_hand = []
  dealer_total = 0
  player_total = 0
  initialize_hands(player_hand, dealer_hand, deck)
  dealer_total = total(dealer_hand)
  player_total = total(player_hand)
  prompt "The dealer's hand is: #{dealer_hand[0]}, unknown card"
  display_p(player_hand)

  catch(:go_to_end) do
    # player turn
    loop do
      h_or_s = ''

      loop do
        prompt(MESSAGES[:hit_stay])
        h_or_s = gets.chomp
        break if h_or_s == 'h' || h_or_s == 's'
        prompt("#{h_or_s} is not a valid response")
        prompt(MESSAGES[:redo_h_s])
      end

      break if h_or_s == 's'

      deal(player_hand, deck)
      player_total = total(player_hand)
      display_p(player_hand)

      if bust?(player_hand)
        prompt(MESSAGES[:p_busted])
        prompt(MESSAGES[:p_lost])
        throw(:go_to_end)
      end
    end

    break if bust?(player_hand)

    display_d(dealer_hand)

    # dealer turn
    loop do
      if dealer_total >= 17
        prompt(MESSAGES[:d_stays])
        break
      end

      deal(dealer_hand, deck)
      dealer_total = total(dealer_hand)
      display_d(dealer_hand)

      if bust?(dealer_hand)
        prompt(MESSAGES[:d_busted])
        prompt(MESSAGES[:p_won])
        throw(:go_to_end)
      end
    end

    if player_total > dealer_total 
      prompt(MESSAGES[:p_won])
    elsif dealer_total > player_total
      prompt(MESSAGES[:p_lost])
    else
      prompt(MESSAGES[:tie])
    end
  end

  play_again = ''
  loop do
    prompt(MESSAGES[:play_again])
    play_again = gets.chomp
    break if play_again == 'y' || play_again == 'n'
    prompt "#{play_again} is not a valid response"
    prompt(MESSAGES[:redo_p_a])
  end

  break if play_again == 'n'
end

prompt(MESSAGES[:bye])
