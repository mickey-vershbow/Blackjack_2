1. We need to make two objects - deck and cards. Deck is an object made up of other (card) object

```
# create Card class, and initialize suit, face, and value. Make them accessible.
# create Deck class, create empty @cards array, suits array, and faces array. Each face should be an array within the faces array (ex. ["Ace", 11]). Make :cards accessible.
```

2. Loop through the card suits and faces to create a deck of 52 cards. Use nested loops -- first loop through suits, then loop through faces, and push each Card.new into the @cards array. When you pass Card.new, also pass (s, f[0],f[1]).

3. After you've looped through the @cards array, shuffle them a few times. Research whether to use shuffle or shuffle!

4. Store Deck.new in deck variable, and print deck.cards to check that you've populated the deck with shuffled cards

5. Next we're going to create a Hand class. Initialize @hand as an empty array and make it accessible.

6. Make a method in the deck to deal_cards. Pass in (h)and as an argument, i.e. which hand we're wanting to deal to.

```
h.hand.push(@cards.pop)
```

7. Inside hand class, make a method to find the sum of a hand. `@hand.reduce(0) { |sum, num| num + sum}`
