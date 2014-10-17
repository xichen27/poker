require "hand"

describe Hand do
  
  let(:hand1) {Hand.new([Card.new(:deuce, :clubs), Card.new(:deuce, :hearts),
          Card.new(:four, :clubs), Card.new(:four, :diamonds), Card.new(:four, :hearts)])}
        
  let(:hand2) {Hand.new([Card.new(:ace, :club), Card.new(:six, :spades),
          Card.new(:six, :hearts), Card.new(:six, :diamonds), Card.new(:six, :clubs)])}
          
  let(:hand3) {Hand.new([Card.new(:seven, :clubs), Card.new(:eight, :clubs),
          Card.new(:nine, :clubs), Card.new(:ten, :clubs), Card.new(:jack, :clubs)])}
          
  let(:hand4) {Hand.new([Card.new(:deuce, :clubs), Card.new(:deuce, :hearts),
          Card.new(:four, :clubs), Card.new(:four, :diamonds), Card.new(:seven, :hearts)])}
          



  it "should have 5 cards" do
    expect(Hand.new.cards.count).to eq(5)
  end  
  
  it "should recognize full house" do
    expect(hand1).to be_full_house
  end

  it "should recognize four of a kind" do
    expect(hand2).to be_four_of_a_kind
  end
    
  it "should recognize straight flush" do
    expect(hand3).to be_straight_flush
  end
  
  it "should recognize two pairs" do
    expect(hand4).to be_two_pairs
  end 

  # it "should have straight flush beat four of a kind" do
#     expect(hand3.beats?(four_of_a_kind)).to be_true
#   end
  

  
  
  
end


