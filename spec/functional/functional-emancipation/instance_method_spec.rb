require 'spec_helper'

describe More do 
  context 'functional emancipation' do
    context 'allows simple access to instance methods' do
      subject do
        Fixnum.fm.+
      end

      it 'can add' do
        expect( subject.(20, 22) ).to eq 42
      end
      
    end # context 'allows simple access to methods'

    context 'allows simple access to methods (bang variation)' do 
      subject do
        Fixnum.fm!.+
      end

      it 'can add' do
        expect( subject.(20, 22) ).to eq 42
      end

      it 'can raise a NameError' do
        expect{ Fixnum.fm!.surely_not_a_fixnum_method }.to raise_error NameError, %r{undefined method `surely}
      end

      it 'can be partially applied' do
        expect( Fixnum.fm.+( 20 ).( 22 ) ).to eq 42
      end
      
    end # context 'allows simple access to methods (bang variation)'
  end # context 'functional emancipation'
end # describe More
