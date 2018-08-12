class Array
  alias_method :draw, :pop
end

class Card
  attr_reader :rank, :suit
  include Comparable

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def ==(other)
    rank == other.rank
  end

  def to_s
    "#{rank} of #{suit}"
  end

  protected

  def <=>(other)
    PokerHand::FACE_ORDER[rank] <=> PokerHand::FACE_ORDER[other.rank]
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
    cards.draw
  end

  def count
    cards.size
  end

  protected

  def <=>(other)
    cards <=> other.cards.shuffle
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

class PokerHand
  FACE_ORDER = [2, 3, 4, 5, 6, 7, 8, 9 , 10, 'Jack', 'Queen', 'King', 'Ace'].zip((2..14)).to_h

  attr_reader :hand

  def initialize(hand)
    @hand = hand
  end

  def print
    hand.each do |card|
      puts card
    end
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    arr = @hand.map { |card| FACE_ORDER[card.rank] }.sort
    flush? && arr == [10, 11, 12, 13, 14]
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    grouped = @hand.group_by(&:rank)
    grouped.values.sort.first.count == 4
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def flush?
    @hand.map(&:suit).uniq.size == 1
  end

  def straight?
    arr = @hand.map { |card| FACE_ORDER[card.rank] }.sort
    arr == (arr[0]..arr[-1]).to_a
  end

  def three_of_a_kind?
    grouped = @hand.group_by(&:rank)
    grouped.values.sort.first.count == 3
  end

  def two_pair?
    grouped = @hand.group_by(&:rank)
    grouped.values.sort.first.count == 2 && grouped.values.count == 3
  end

  def pair?
    grouped = @hand.group_by(&:rank)
    grouped.values.max.count == 2
  end
end
