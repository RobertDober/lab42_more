require 'spec_helper'

describe More do 
  context 'functional emancipation' do
    context 'function access' do 

      context 'cannot be used for every class, and shall not be used for classes in general' do
        it{
          expect{ Fixnum.func.+.(1,2) }.to raise_error
          expect{ Fixnum.func!.+.(1,2) }.to raise_error
        }

      end # context 'cannot be used for every class, and shall not be used for classes in general'

      let :mod do
        Module.new{
          def a b, c, &d; d.(b + c) end
        }
      end

      context 'allows simple access to instance functions (removing the receiver from the param list)' do
        subject do
          mod.func.a
        end
        it 'can add' do
          expect( subject.(20, 1, &B(:*, 2)) ).to eq 42
        end
      end # context 'allows simple access to methods'

      context 'allows simple access to instance methods (bang variation)' do 
        subject do
          mod.func!.a
        end

        it 'can add' do
          expect( subject.(20, 1, &B(:*, 2)) ).to eq 42
        end

        it 'can raise a NameError' do
          expect{ mod.func!.surely_not_a_fixnum_method }.to raise_error NameError, %r{undefined method `surely}
        end

        it 'can be partially applied', :next do
          expect( subject.(1).(20).(&B(:*, 2)) ).to eq 42
        end

      end # context 'allows simple access to methods (bang variation)'
    end # context 'function access'
  end # context 'functional emancipation'
end # describe More
