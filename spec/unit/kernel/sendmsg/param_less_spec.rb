require 'spec_helper'

describe Lab42::More do 
  context 'Kernel#sendmsg' do 
    it 'needs an argument to avoid late binding errors' do
      expect{ sendmsg }.to raise_error ArgumentError, "need a message name to be sent"
    end
    subject do
      sendmsg :succ
    end
    context 'without parameters' do 
      it 'which sends the message to its first argument' do
        expect( subject.(41) ).to eq 42
      end
    end # context 'without parameters'
  end # context 'Kernel#sendmsg'
end # describe Lab42::More
