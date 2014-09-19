module Lab42
  module More
    module FunctionalEmancipation

      class InstanceMethodProxy
        attr_reader :raise_error, :klass
        

        private
        def initialize klass, raise_error: false
          @klass = klass
          @raise_error = raise_error
        end

        def method_missing name, *args, &blk
          unbound_method = _get_unbound_method name
          return unless unbound_method
          Behavior.new do | rcv, *a, &b |
            unbound_method.bind( rcv ).(*(args+a), &(blk||b||->{}))
          end 
        end

        def _get_unbound_method name
           klass.instance_method name
        rescue
          raise if raise_error
        end
      end # class InstanceMethodProxy

    end # module FunctionalEmancipation
  end # module More
end # module Lab42

