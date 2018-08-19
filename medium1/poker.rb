require 'pry'

class Card
  attr_reader :rank, :suit
  include Comparable

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  protected

  def ==(other)
    rank == other.rank
  end

  def to_s
    "#{rank} of #{suit}"
  end

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
    cards.pop
  end

  def count
    cards.size
  end

  def deal
    cards.shuffle!
    5.times.with_object([]) { |_, array| array << cards.pop}
  end

  def shuffle
    cards.shuffle!
    self
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

  def self.occur_percentage(hand)
    occurances_needed = 15
    iterations = 0
    count = 0
    num_occur = 0
    result = []

    loop do
      loop do
        cards = Deck.new
        dealt_cards = PokerHand.new(cards.deal) 
        count += 1

        if [hand].include? dealt_cards.evaluate
          count += 1
          num_occur += 1
          puts "-------------"
          puts "TOTAL NUMBER TIMES #{hand.upcase} DEALT: #{num_occur}"
          puts "TOTAL NUMBER HANDS DEALT: #{count}"
          puts "HAND OCCURANCE PERCENTAGE: %#{(num_occur/count.to_f) * 100}\n\n"
          dealt_cards.print
        end

        break if num_occur == occurances_needed
      end

      puts "\n\n1 out of #{count.to_f/num_occur} hands will be dealt a #{hand}\n\n"
      result << count
      iterations += 1
      num_occur = 0
      count = 0
      break if iterations == 5
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
    grouped.values.any? { |grouping| grouping.size == 2 }
  end
end

# p PokerHand.occur_percentage("Royal flush")

class Odds
  def initialize(hand, occurances_needed)
    @hand = hand
    @occurances_needed = occurances_needed
    @iterations = 0
    @count = 0
    @total_occurances = 0
    @percentage = nil
  end

  def percentage
    loop do
      loop do
        binding.pry
        @deck = Deck.new
        @hand = PokerHand.new(@deck.deal) 
        @count += 1
        if [@hand].include? @hand.evaluate
          count += 1
          num_occur += 1
          puts "-------------"
          puts "TOTAL NUMBER TIMES #{@hand.upcase} DEALT: #{num_occur}"
          puts "TOTAL NUMBER HANDS DEALT: #{count}"
          puts "HAND OCCURANCE PERCENTAGE: %#{(num_occur/count.to_f) * 100}\n\n"
          dealt_cards.print
        end
        break if num_occur == occurances_needed
      end
      puts "\n\n1 out of #{count.to_f/num_occur} hands will be dealt a #{hand}\n\n"
      result << count
      iterations += 1
      num_occur = 0
      count = 0
      break if iterations == 5
    end
  end
end

deck = Deck.new.shuffle

odds_instance = Odds.new(PokerHand.new(deck.deal), 10)
