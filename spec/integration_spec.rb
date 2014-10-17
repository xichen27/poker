require "deck"
require "player"

describe Deck do
  subject(:deck) {Deck.new}
  let(:player) { Player.new }
  
  it "should give out 5 cards to each player at start of game" do 
    # allow(player).to receive(:hand=)
    deck.give(player)
    expect(deck.cards.count).to eq(47)
    expect(player.hand.count).to eq(5)
  end
end