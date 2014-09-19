require 'spec_helper'

describe More do 
  context 'Enumerable Methods' do
    context 'filter' do 
      context 'simple symbol' do 
        context 'empty' do 
          it 'empty ary remains empty' do
            expect( [].filter :anything  ).to eq []
          end
          it 'empty range becomes empty ary' do
            expect( (2..1).filter :anything ).to eq []
          end
          it 'empty enumerator becomes an empty ary' do
            expect( [].enum_for(:each).filter{ |x| x.anything }).to eq []
          end
          it 'empty lazy enumerator remains an empty lazy enumerator' do
            lenum = [].enum_for( :each ).lazy.filter :anything
            expect( lenum ).to be_kind_of Enumerator::Lazy
            expect( lenum ).to be_none
          end
        end # context 'empty'
        context 'not empty' do 
          it 'ary remains an array' do
            expect( [1,2].filter :odd? ).to eq [1]
          end
          it 'enum becomes an array' do
            expect( (1..2).filter :odd? ).to eq [1]
          end
          it 'enumerator becomes an array' do
            expect( (1..2).enum_for(:each).filter :odd? ).to eq [1]
          end
          it 'lazy enumerator remains a lazy enumerator' do
            lenum = [1,2].enum_for( :each ).lazy.filter :odd?
            expect( lenum ).to be_kind_of Enumerator::Lazy
            expect( lenum.to_a ).to eq [1]
          end
        end # context 'not empty'
        context 'param case' do 
          it 'can send messages with parameters' do
            expect( (1..2).filter :==, 2 ).to eq [2]
          end
        end # context 'param case'
      end # context 'simple symbol'
    end # context 'filter'
  end # context 'Enumerable Methods'
end # describe Lab42::More
