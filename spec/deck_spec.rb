require "deck"

describe Deck do
  subject(:deck) {Deck.new}
  let(:player) { double("player", :hand => []) }
  it "should have 52 cards" do
    expect(deck.cards.count).to eq(52)
  end
  
  it "should have only unique cards" do
    expect(deck.cards.map{|card| 
      [card.suit, card.value]}.uniq.count).to eq(52)   
  end
    
  it "each card should have a correct suit" do
    expect(deck.cards.select{|card| 
      Card::SUIT_STRINGS.include?(card.suit)}.count).to eq(52)
  end
  
  it "should be in random order" do 
    expect(deck.plain_cards).not_to eq(Deck.new.plain_cards)
  end
  
end