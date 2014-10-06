# In the card game poker, a hand consists of five cards and are ranked, from
# lowest to highest, in the following way:
#
#   High Card: Highest value card.
#   One Pair: Two cards of the same value.
#   Two Pairs: Two different pairs.
#   Three of a Kind: Three cards of the same value.
#   Straight: All cards are consecutive values.
#   Flush: All cards of the same suit.
#   Full House: Three of a kind and a pair.
#   Four of a Kind: Four cards of the same value.
#   Straight Flush: All cards are consecutive values of same suit.
#   Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.
#   The cards are valued in the order:
#   2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.
#
# If two players have the same ranked hands then the rank made up of the highest
# value wins; for example, a pair of eights beats a pair of fives (see example
# 1 below). But if two ranks tie, for example, both players have a pair of
# queens, then highest cards in each hand are compared (see example 4 below); if
# the highest cards tie then the next highest cards are compared, and so on.
#
# The file, data/54.txt, contains one-thousand random hands dealt to two
# players. Each line of the file contains ten cards (separated by a single
# space): the first five are Player 1's cards and the last five are Player 2's
# cards. You can assume that all hands are valid (no invalid characters or
# repeated cards), each player's hand is in no specific order, and in each hand
# there is a clear winner.
#
# How many hands does Player 1 win?

require 'ostruct'
require_relative '../euler.rb'; include Euler
# http://www.mathcs.emory.edu/~cheung/Courses/170/Syllabus/10/pokerValue.html

class Hand
  include Comparable
  def <=>(other); self.score <=> other.score; end

  RANKS = %w[2 3 4 5 6 7 8 9 T J Q K A]

  def initialize(cards)
    @cards = cards.map do |c|
      OpenStruct.new(rank: RANKS.index(c[0]), suit: c[1])
    end
    @ranks = @cards.map(&:rank).sort == [2,3,4,5,14] ?
      [1,2,3,4,5] : @cards.map(&:rank).sort # Special case for [A 2 3 4 5]
  end

  STRAIGHT_FLUSH  = 8 * 10**6
  FOUR_OF_A_KIND  = 7 * 10**6
  FULL_HOUSE      = 6 * 10**6
  FLUSH           = 5 * 10**6
  STRAIGHT        = 4 * 10**6
  THREE_OF_A_KIND = 3 * 10**6
  TWO_PAIR        = 2 * 10**6
  ONE_PAIR        = 1 * 10**6
  HIGH_CARD       = 0 * 10**6

  def score
    if straight? && flush?
      STRAIGHT_FLUSH + high_card
    elsif of_a_kind(4).any?
      FOUR_OF_A_KIND + high_card(@ranks - of_a_kind(4) + of_a_kind(4))
    elsif of_a_kind(3).any? && of_a_kind(2).any?
      FULL_HOUSE + high_card(of_a_kind(2) + of_a_kind(3))
    elsif flush?
      FLUSH + high_card
    elsif straight?
      STRAIGHT + high_card
    elsif of_a_kind(3).any?
      THREE_OF_A_KIND + high_card(@ranks - of_a_kind(3) + of_a_kind(3))
    elsif of_a_kind(2).count == 2
      TWO_PAIR + high_card(@ranks - of_a_kind(2) + of_a_kind(2).sort)
    elsif of_a_kind(2).count == 1
      ONE_PAIR + high_card(@ranks - of_a_kind(2) + of_a_kind(2))
    else
      HIGH_CARD + high_card
    end
  end

private

  def straight?
    @ranks.uniq.count == 5 && @ranks.min+4 == @ranks.max
  end

  def flush?
    @cards.map(&:suit).uniq.count == 1
  end

  def of_a_kind(n)
    @ranks.uniq.select{|r| @ranks.frequency[r] == n}
  end

  def high_card(ranks=@ranks)
    ranks.map.with_index{|rank, i| rank * 14**i}.inject(:+)
  end
end

puts data_file('54.txt').read.split("\n")
      .map{|line| line.split.each_slice(5).to_a}
      .count{|p1, p2| Hand.new(p1) > Hand.new(p2)}

# => 376
# real    0m0.157s
# user    0m0.126s
# sys     0m0.030s
