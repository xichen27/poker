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
  
  def give(player, num = 5)
    player.hand = @cards.pop(num)
  end
  
  def plain_cards
    @cards.map do |card|
      [card.suit, card.value]
    end
  end
end