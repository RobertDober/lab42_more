require 'spec_helper'

describe Behavior do

  def b ele
    described_class.new do |a|
      a << ele
    end
  end
  context 'pipeline' do 
    let( :adder ){ B(:succ) }
    let( :doubler ){ B(:*, 2) }

    it 'comes to the correct conclusion' do
      expect( (adder | doubler).(20) ).to eq 42
    end
    it 'can be done from right to left' do
      expect( ( doubler | adder | doubler | adder).(9) ).to eq 39
    end
    it 'has the correct associativity (for clarity)' do
      expect( (b(1)|b(2)|b(3)).([]) ).to eq [*1..3]
      
    end
    
  end # context 'pipeline'
  
end # describe Behavior
