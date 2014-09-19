require 'spec_helper'

describe More::FunctionalEmancipation::FunctionProxy do 
  let( :singleton ){ 
    Module.new do
      extend self
      def adder a, b, &c; c.(a + b) end
    end
  }
  subject do
    singleton.func
  end

  it 'gets the behavior' do
    expect( subject.adder.(1,20,&B(:*,2)) ).to eq 42
  end
  it 'does not complain about missing methods' do
    expect( subject.subber ).to be_nil
  end
  it 'unless told so' do
    expect{ singleton.func!.subber }.to raise_error NameError, %r{undefined method `subber}
  end
  

  
end # describe More::FunctionalEmancipation::FunctionProxy
