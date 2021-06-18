
# To run this, run
# run `ruby main.rb`
# from the terminal
puts "Welcome to Ruby Blackjack"

# ---------------------------------
# CLASSES
# ---------------------------------

## CARD CLASS REPRESENTING A SINGLE
class Card

  attr_accessor :suit
  attr_accessor :face
  attr_accessor :value

  def initialize (suit, face, value)
    @suit = suit
    @face = face
    @value = value
  end
end

## DECK CLASS REPRESENTING A DECK OF CARDS
class Deck

  attr_accessor :cards

  def initialize
    @cards = []
    suits = ["Hearts", "Spades", "Clubs", "Diamonds"]
    faces = [
      ["Ace", 1],
      ["2", 2],
      ["3", 3],
      ["4", 4],
      ["5", 5],
      ["6", 6],
      ["7", 7],
      ["8", 8],
      ["9", 9],
      ["10", 10],
      ["Jack", 10],
      ["Queen", 10],
      ["King", 10]
    ]

    # Loop through cards to create the deck
    suits.each do |s|
      faces.each do |f|
        @cards.push(Card.new(s, f[0], f[1]))
      end
    end

    # Shuffle the deck
    @cards.shuffle!
    @cards.shuffle!
    @cards.shuffle!

  end

# Method to deal cards to players
  def deal_card(h)
    h.hand.push(@cards.pop)
  end
end



# PLAYER CLASS REPRESENTING A PLAYER'S HAND
class Player
    attr_accessor :hand
    attr_accessor :name
    attr_accessor :bankroll

    def initialize name, bankroll
        @hand = []
        @name = name
        @bankroll = bankroll
    end

    def sum_hand
        @hand.reduce(0) { |t, c| t + c.value}
    end
end

# ----------------------------------
# OBJECTS
# ----------------------------------

# Create instances of Player
human = Player.new "Human", 100
dealer = Player.new "The House (dealer)", 10000
deck = Deck.new

# ----------------------------------
# METHODS
# ----------------------------------
# Function to determine win or lose. Receives two players as arguments. In our case, human and dealer.
def win(h, d)
  human_total = h.sum_hand
  dealer_total = d.sum_hand

  if human_total == dealer_total
    p "It's a tie!"

  else

  return false if human_total > 21
  return true if dealer_total > 21
  return true if human_total == 21
  return true if human_total > dealer_total
  return false
  end
end


# ----------------------------------
# GAME LOGIC
# ----------------------------------

def player_name
    puts "What is your name?"
    name = gets.chomp
end

puts "Ok #{player_name}, let's get this road on the show!"

p "Do you want to [p]lay a round or [c]heck your bankroll?"
input = gets.chomp


# ------- CHECK BANKROLL --------
if input == "c"
  p "Your bankroll is currently at $#{human.bankroll}."
end

# ------- DEAL THE GAME --------
if input == "p"
  p "Do you want to be the [d]efault amount of $10, or [a]nother amount?"
  input = gets.chomp

  default_user_bet = 10

  if input == "d"
    user_bet = 10
  end

  if input == "a"
    p "How much would you like to bet? Type any amount less than or equal to your current bankroll ($#{human.bankroll})"
    bet = gets.chomp
    user_bet = bet.to_i
  end

while(true)


  ## DEAL CARDS
  deck.deal_card(human)
  deck.deal_card(human)
  deck.deal_card(dealer)
  deck.deal_card(dealer)

  # Show face-up cards
  puts "Your face up card is #{human.hand[0].face} of #{human.hand[0].suit}"
  puts "Dealers face up card is #{dealer.hand[0].face} of #{dealer.hand[0].suit}"

  # Ask player to hit or stand
  puts "Would you like to (H)it or (S)tand"
  input = gets.chomp

  # Deal card if player chooses to hit
  if input == "H"
      deck.deal_card(human)
      deck.deal_card(dealer)
  end

  # Show new cards
  puts "** Your new card is #{human.hand[1].face} of #{human.hand[1].suit}"
  puts "** Dealers' new card is #{dealer.hand[1].face} of #{dealer.hand[1].suit}"

  # Determine the winner and print hand values
  if win(human, dealer)
    p "-> You won! The dealer has #{dealer.sum_hand} and you have #{human.sum_hand}."
    # default_bankroll(human, dealer)
    # Subtract user_bet from player hand and add to dealer hand
    human.bankroll = human.bankroll + user_bet
    dealer.bankroll = dealer.bankroll - user_bet
    p "--> You made $10. Your current bankroll is #{human.bankroll} and the dealer's bankroll is #{dealer.bankroll}."
  else
    p "-> You lost! The dealer has #{dealer.sum_hand} and you have #{human.sum_hand}."
    # player_bankroll_change(dealer, human)
    # Subtract user_bet from player hand and add to dealer hand
    human.bankroll = human.bankroll - user_bet
    dealer.bankroll = dealer.bankroll + user_bet
    p "--> You lost $10. Your current bankroll is #{human.bankroll} and the dealer's bankroll is #{dealer.bankroll}."
  end

  # Ask if they want to stop playing
  p "----> Type (Y) if you want to end the game, otherwise type (N) to continue playing."
  gameover = gets.chomp

  # End the game
  if gameover == "Y"
    break
  end

  # Empty the hands
  human.hand.clear
  dealer.hand.clear

  # check if the deck is almost empty
  if deck.cards.length < 10
    deck = Deck.new
  end
end

  # Else let the loop repeat

end
