# Using the Card class from the previous exercise, 
# create a Deck class that contains all of the standard 52 playing cards. 
# Use the following code to start your work:

class Card
  attr_reader :rank, :suit
  include Comparable

  FACE_ORDER = [2, 3, 4, 5, 6, 7, 8, 9 , 10, 'Jack', 'Queen', 'King', 'Ace'].zip((2..14)).to_h

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def ==(other_card)
    rank == other_card.rank
  end

  def to_s
    "#{rank} of #{suit}"
  end

  protected

  def <=>(other_card)
    FACE_ORDER[rank] <=> FACE_ORDER[other_card.rank]
  end
end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  include Comparable

  attr_reader :cards

  def initialize
    reset
  end

  def draw
    reset if @cards.empty?
    cards.pop
  end

  def count
    cards.size
  end

  protected

  def <=>(other_deck)
    cards <=> other_deck.cards.shuffle
  end

  def reset
    cards = []

    RANKS.each do |rank|
      SUITS.each do |suit|
        cards << Card.new(rank, suit)
      end
    end

    @cards = cards
  end
end

