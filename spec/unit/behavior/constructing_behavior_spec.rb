require 'spec_helper'

describe Behavior do
  context 'from sendmsg' do 
    it 'is a behavior' do
      expect( sendmsg :a ).to be_kind_of described_class
    end
    it 'behaving as expected' do
      expect( sendmsg(:size).([]) ).to eq 0
    end
    it 'or from B' do
      expect( B(:+, 1).(41) ).to eq 42
    end
  end # context 'from sendmsg'

  context 'from an object' do 
    context '(via fn)' do 
      it 'is a correctly behaving behavior to' do
        expect( 41.fn.+ ).to be_kind_of described_class
        expect( 41.fn.+.(1) ).to eq 42
      end
    end # context '(via fn)'
  end # context 'from an object (via fn)'

  context 'from a class' do 
    context '(via fm)' do 
      it 'comes from a class' do
        expect( Fixnum.fm.+ ).to be_kind_of described_class
        expect( Fixnum.fm.+.(1,41) ).to eq 42
      end
    end # context '(via fm)'
    context '(via func)' do 
      let( :klass ){ Class.new{ def a b, c,&d; d.(b+c) end } }
      
      it 'comes from a class' do
        expect( klass.func.a ).to be_kind_of described_class
        expect( klass.func.a.(1,2,&:succ) ).to eq 4
      end
    end # context '(via func)'
  end

  context 'from a module' do 
    let( :mod ){ Module.new{ def a b, c, &d; d.(b + c) end } }
    context '(via fm)' do 
      it 'or from a module' do
        expect( mod.fm.a ).to be_kind_of described_class
        expect( mod.fm.a.(:dummy, 1, 2, &:succ) ).to eq 4
      end
    end # context '(via fm)'
  end # context 'from a module'
end
