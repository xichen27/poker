require_relative 'card'
class Hand
  
  def initialize(cards)
    @cards = cards
  end
  
  def beats?
    
  end
  
  def straight_flush?
    flush? && straight?
  end
  
  def flush?
    (@cards.map {|card| card.suit}.uniq.count) == 1
  end
  
  def straight?
    values = card_values
    (0...values.length - 1).each do |index|
      if values[index] != values[index + 1] - 1
        return false 
      end
    end
    true
  end
  
  def four_of_a_kind?
    return true if number_of_occurence.any? {|key, value| value == 4}
    false
  end
  
  def full_house?
    three_of_a_kind? && one_pair? 
  end
  
  
  def three_of_a_kind?
    number_of_occurence.any?{|key, value| value == 3}
  end
  
  def one_pair?
    number_of_pairs == 1
  end
  
  def two_pairs?
    number_of_pairs == 2
  end
  
  def number_of_pairs
    number_of_pairs = 0
    number_of_occurence.each_value do |v|
      number_of_pairs += 1 if v == 2
    end
    number_of_pairs
  end
    
    
  def number_of_occurence
    number_of_occurence = Hash.new(0)
    card_values.each do |v|
      number_of_occurence[v] += 1
    end
    number_of_occurence
  end
  
  def card_values
    card_values = @cards.map {|card| Card::POKER_VALUE[card.value] }.sort
  end
  
end

# [:straight?, :four_of_a_kind?, :full_house?].each do |method|
#   self.send(method)
# end

#hand1 = Hand.new([Card.new(:deuce, :clubs), Card.new(:three, :clubs), 
 # Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
  
hand2 = Hand.new([Card.new(:deuce, :clubs), Card.new(:deuce, :hearts), 
    Card.new(:four, :clubs), Card.new(:four, :diamonds), Card.new(:four, :hearts)])  
  
# p hand1
# p hand1.flush?
# p hand1.straight?
# p hand1.straight_flush?

p hand2
p hand2.full_house?
# p hand1.straight?
# p hand1.straight_flush?
  