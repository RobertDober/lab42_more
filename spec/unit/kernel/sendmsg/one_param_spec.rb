require 'spec_helper'

describe Lab42::More do 
  context 'Kernel#sendmsg' do 
    subject do
      sendmsg :+, 2
    end
    context 'with one parameter' do 
      it 'which sends the message to its first argument, with the predefined parameters' do
        expect( subject.(40) ).to eq 42
      end
    end # context 'without parameters'
  end # context 'Kernel#sendmsg'
end # describe Lab42::More
