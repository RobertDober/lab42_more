require 'spec_helper'

describe More::FunctionalEmancipation::MethodProxy do

  context 'proxying methods of an object' do
    subject do
      described_class.new 20
    end

    it 'which do the expected' do
      expect( subject.+.(22) ).to eq 42
    end
    it 'does not raise errors for undefined methods' do
      expect( subject.surely_not_a_fixnum_instance_method ).to be_nil
    end
    it 'unless told otherwise' do
      expect{
        described_class.new(20, raise_error: true).surely_not_a_fixnum_instance_method
      }.to raise_error NameError, %r{undefined method `surely}
      
    end
  end # context 'wrapping methods of an object'
end # describe More::FunctionalEmancipation::MethodProxy