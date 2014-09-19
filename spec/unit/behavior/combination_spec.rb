require 'spec_helper'

describe Behavior do

  def b ele
    Behavior.new{ |a| a << ele }
  end

  context 'combination' do 
    let( :adder ){ B(:succ) }
    let( :doubler ){ B(:*, 2) }

    it 'comes to the correct conclusion' do
      expect( (doubler * adder).(20) ).to eq 42
    end
    it 'can be done from right to left' do
      expect( ( doubler * adder * doubler * adder).(9) ).to eq 42
    end
    it 'has the correct associativity (for clarity)' do
      expect( (b(1)*b(2)*b(3)).([]) ).to eq [3,2,1]
      
    end
    
  end # context 'combination'
  
end # describe Behavior
