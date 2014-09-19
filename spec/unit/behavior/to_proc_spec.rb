require 'spec_helper'

describe Behavior do
  context '#to_proc, to serve block needing apis' do 
    let( :proc ){ Behavior.new{ 42 }.to_proc }
    
    it 'is returns a Proc instance' do
      expect( proc ).to be_kind_of Proc
    end
    it 'which does more or less what it was supposed to do' do
      expect( proc.() ).to eq 42
   end
  end # context '#to_proc, to serve block needing apis'
end # describe Behavior
