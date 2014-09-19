class Behavior
  attr_reader :behavior

  def call *a, &b; behavior.(*a, &b) end
  alias_method :to_proc, :behavior

  private
  def initialize behavior=nil, &blk
    @behavior = behavior || blk
  end

end

module Kernel
  def sendmsg *args, &blk
    raise ArgumentError, "need a message name to be sent" if args.empty?
    Behavior.new do |rcv|
      rcv.send(*args, &blk)
    end
  end
  alias_method :B, :sendmsg
end
