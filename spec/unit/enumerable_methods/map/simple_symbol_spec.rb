require 'spec_helper'

describe More do 
  context 'Enumerable Methods' do 
    context 'map' do 
      context 'simple symbol' do 
        context 'empty' do 
          it 'empty ary remains empty' do
            expect( [].map :anything  ).to eq []
          end
          it 'empty range becomes empty ary' do
            expect( (2..1).map :anything ).to eq []
          end
          it 'empty enumerator becomes an empty ary' do
            expect( [].enum_for(:each).map{ |x| x.anything }).to eq []
          end
          it 'empty lazy enumerator remains an empty lazy enumerator' do
            lenum = [].enum_for( :each ).lazy.map :anything
            expect( lenum ).to be_kind_of Enumerator::Lazy
            expect( lenum ).to be_none
          end
        end # context 'empty'
        context 'not empty' do 
          it 'ary remains an array' do
            expect( [1,2].map :succ ).to eq [2,3]
          end
          it 'enum becomes an array' do
            expect( (1..2).map :succ ).to eq [2,3]
          end
          it 'enumerator becomes an array' do
            expect( (1..2).enum_for(:each).map :succ ).to eq [2,3]
          end
          it 'lazy enumerator remains a lazy enumerator' do
            lenum = [1,2].enum_for( :each ).lazy.map :succ
            expect( lenum ).to be_kind_of Enumerator::Lazy
            expect( lenum.to_a ).to eq [2,3]
          end
        end # context 'not empty'
        context 'param case' do 
          it 'can send messages with parameters' do
            expect( (1..2).map :+, 2 ).to eq [3,4]
          end
        end # context 'param case'
      end # context 'simple symbol'
    end # context 'map'
  end # context 'Enumerable Methods'
end # describe Lab42::More
