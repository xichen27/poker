require "hand"

describe Hand do
  
  let(:hand_full_house) {Hand.new([Card.new(:deuce, :clubs), Card.new(:deuce, :hearts),
          Card.new(:four, :clubs), Card.new(:four, :diamonds), Card.new(:four, :hearts)])}
    
  let(:hand_full_house2) {Hand.new([Card.new(:deuce, :hearts), Card.new(:deuce, :spades),
                  Card.new(:three, :hearts), Card.new(:three, :diamonds), Card.new(:three, :clubs)])}
        
  let(:hand_four_of_a_kind) {Hand.new([Card.new(:ace, :club), Card.new(:six, :spades),
          Card.new(:six, :hearts), Card.new(:six, :diamonds), Card.new(:six, :clubs)])}
          
  let(:hand_straight_flush) {Hand.new([Card.new(:seven, :clubs), Card.new(:eight, :clubs),
          Card.new(:nine, :clubs), Card.new(:ten, :clubs), Card.new(:jack, :clubs)])}
 
  let(:hand_straight_flush2) {Hand.new([Card.new(:four, :hearts), Card.new(:five, :hearts),
          Card.new(:six, :hearts), Card.new(:seven, :hearts), Card.new(:eight, :hearts)])}
              
  let(:hand_two_pair) {Hand.new([Card.new(:deuce, :clubs), Card.new(:deuce, :hearts),
          Card.new(:four, :clubs), Card.new(:four, :diamonds), Card.new(:seven, :hearts)])}
  let(:hand_two_pair2) {Hand.new([Card.new(:deuce, :clubs), Card.new(:deuce, :hearts),
                Card.new(:eight, :clubs), Card.new(:eight, :diamonds), Card.new(:seven, :hearts)])}
          
          
          
  it "should have 5 cards" do
    expect(Hand.new.cards.count).to eq(5)
  end  
  
  it "should recognize full house" do
    expect(hand_full_house).to be_full_house
  end

  it "should recognize four of a kind" do
    expect(hand_four_of_a_kind).to be_four_of_a_kind
  end
    
  it "should recognize straight flush" do
    expect(hand_straight_flush).to be_straight_flush
  end
  
  it "should recognize two pairs" do
    expect(hand_two_pair).to be_two_pairs
  end 

  it "should have straight flush beat four of a kind" do
    expect(hand_straight_flush.beats?(hand_four_of_a_kind)).to be_true
  end
  
  it "should not have four of a kind beat straight flush" do
    expect(hand_four_of_a_kind.beats?(hand_straight_flush)).not_to be_true
  end
  
  it "should beat another straight flush with lower numbers" do
    expect(hand_straight_flush.beats?(hand_straight_flush2)).to be_true
  end
  
  it "should beat another full house of lower triple set" do
    expect(hand_full_house.beats?(hand_full_house2)).to be_true
  end
  
  it "should beat another two pairs of lower highest pair" do
    expect(hand_two_pair2.beats?(hand_two_pair)).to be_true
  end


  
  
  
end


