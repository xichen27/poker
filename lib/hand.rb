require_relative 'card'
class Hand
  HANDS = Hash[:straight_flush?, 90,
          :four_of_a_kind?, 80,
          :full_house?, 70,
          :flush?, 60,
          :straight?, 50,
          :three_of_a_kind?, 40,
          :two_pairs?, 30,
          :one_pair?, 20
          ]
          
  def initialize(cards)
    @cards = cards
  end
  
  def beats?(other_hand)
    if best_hand_value > other_hand.best_hand_value
      return true
    elsif best_hand_value == other_hand.best_hand_value
      return true if beats_with_tie_breaker?(other_hand)
    end
    false
  end
  
  def beats_with_tie_breaker?(another_hand)
    case best_hand_value
    when 90, 60, 50
      puts " 2 SF / F / ST"
      return true if card_values.max > another_hand.card_values.max
    when 80, 70, 40, 20 #4 of a kind, full house, 
      best_set = number_of_occurence.max_by {|k,v| v}
      bsk = best_set.first
  
      best_set_other = another_hand.number_of_occurence.max_by {|k,v| v }
      bsok = best_set_other.first
      return true if bsk > bsok    
    when 30
      bpc =number_of_occurence.reject {|k, v| v == 1}.keys.max
      bspok = another_hand.number_of_occurence.reject {|k, v| v == 1}.keys.max
      return true if bpc > bspok
    else 
      puts "none of the above"
    end
    false
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
  
  def best_hand_value
    HANDS.each do |method, value|
      return value if self.send(method)
    end
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




#hand1 = Hand.new([Card.new(:deuce, :clubs), Card.new(:three, :clubs), 
 # Card.new(:four, :clubs), Card.new(:five, :clubs), Card.new(:six, :clubs)])
  
# hand2 = Hand.new([Card.new(:deuce, :clubs), Card.new(:deuce, :hearts),
#     Card.new(:four, :clubs), Card.new(:four, :diamonds), Card.new(:four, :hearts)])
#
straight_one = Hand.new([Card.new(:seven, :clubs), Card.new(:eight, :clubs),
          Card.new(:nine, :clubs), Card.new(:ten, :clubs), Card.new(:jack, :clubs)]) 
straight_two = Hand.new([Card.new(:seven, :clubs), Card.new(:eight, :clubs),
                    Card.new(:nine, :clubs), Card.new(:ten, :clubs), Card.new(:jack, :clubs)]) 
#p hand2
p straight_one.beats_with_tie_breaker?(straight_two)
# p hand1.straight?
# p hand1.straight_flush?
  