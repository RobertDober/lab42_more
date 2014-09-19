require_relative 'more/enumerable_methods'
module Lab42
  module More
    module ::Kernel
      def sendmsg *args
        raise ArgumentError, "need a message name to be sent" if args.empty?
        ->(rcv){ rcv.send *args }
      end
    end
  end
end # module Lab42
