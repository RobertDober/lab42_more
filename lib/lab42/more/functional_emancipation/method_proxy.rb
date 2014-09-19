module Lab42
  module More
    module FunctionalEmancipation

      class MethodProxy
        attr_reader :raise_error, :receiver
        private
        def initialize rcv, raise_error: false
          @receiver = rcv
          @raise_error = raise_error
        end

        def method_missing name, *args, &blk
          Behavior.new receiver.method( name )
        rescue NameError
          raise if raise_error
        end
      end

    end # module FunctionalEmancipation
  end # module More
end # module Lab42

