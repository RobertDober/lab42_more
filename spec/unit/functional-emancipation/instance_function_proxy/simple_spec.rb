require 'spec_helper'

describe More::FunctionalEmancipation::InstanceFunctionProxy do 
  context 'modules' do 

    let( :mod ){ 
      Module.new do
        def adder a, b, &c; c.(a + b) end
      end
    }
    subject do
      described_class.new mod
    end

    it 'gets the behavior' do
      expect( subject.adder.(1,20,&B(:*,2)) ).to eq 42
    end
    it 'does not complain about missing methods' do
      expect( subject.subber ).to be_nil
    end
    it 'unless told so' do
      expect{ described_class.new( mod, raise_error: true ).subber }.to raise_error NameError, %r{undefined method `subber}
    end

  end # context 'modules'


end # describe More::FunctionalEmancipation::FunctionProxy
