require 'spec_helper'

describe More do 
  context 'functional emancipation' do
    context 'allows simple access to methods' do 
      subject do
        20.fn.+
      end

      it 'can add' do
        expect( subject.(22) ).to eq 42
      end
      
    end # context 'allows simple access to methods'

    context 'allows simple access to methods (bang variation)' do 
      subject do
        20.fn!.+
      end

      it 'can add' do
        expect( subject.(22) ).to eq 42
      end

      it 'can raise a NameError' do
        expect{ 20.fn!.surely_not_a_fixnum_method }.to raise_error NameError, %r{undefined method `surely}
      end
      
    end # context 'allows simple access to methods (bang variation)'
  end # context 'functional emancipation'
end # describe More
