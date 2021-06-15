class Card
    attr_accessor :suit
    attr_accessor :face
    attr_accessor :value

    def initialize (suit, face, value)
        @suit = suit
        @value = value
        @face = face
    end
end

class Deck

    attr_accessor :cards

    def initialize
        @cards = []
        suits = ["Hearts", "Spades", "Clubs", "Diamonds"]
        faces = [
            ["Ace", 1],
            ["Two", 2],
            ["Three", 3],
            ["Four", 4],
            ["Five", 5],
            ["Six", 6],
            ["Seven", 7],
            ["Eight", 8],
            ["Nine", 9],
            ["Ten", 10],
            ["Jack", 10],
            ["Queen", 10],
            ["King", 10]
        ]

suits.each do |s|
    faces.each do |f|
        @cards.push(Card.new(s, f[0], f[1]))
    end
end

    @cards.shuffle!
    @cards.shuffle!
    @cards.shuffle!

    end
end

deck = Deck.new
p deck.cards

class Hand
    attr_accessor :hand
    
    def initialize
        @hand = []
    end
