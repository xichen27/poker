require_relative 'card'

class Deck
  
  attr_reader :cards  
  def initialize
    @cards = []
    populate
  end
  
  def populate
    Card::VALUE_STRINGS.each_key do |val|
      Card::SUIT_STRINGS.each_key do |suit|
        @cards << Card.new(suit, val)
      end
    end
    @cards.shuffle!
  end
  
  def deal(player)
    player.hand = Hand.new(@cards.pop(5))
  end
  
  def give(player, num)
    player.hand += @cards.pop(num)
  end
  
  def plain_cards
    @cards.map do |card|
      [card.suit, card.value]
    end
  end
  
  def best_hand

  end
  
  def beats?
    
  end
  
end


