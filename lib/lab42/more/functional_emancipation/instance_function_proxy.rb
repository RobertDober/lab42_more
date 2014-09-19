module Lab42
  module More
    module FunctionalEmancipation

      class InstanceFunctionProxy
        attr_reader :raise_error, :klass

        private
        def initialize klass, raise_error: false
          @klass = klass
          @raise_error = raise_error
        end

        def method_missing name, *args, &blk
          unbound_method = _get_unbound_method name
          return unless unbound_method
          dummy = _mk_legal_receiver
          Behavior.new do | *a, &b |
            unbound_method.bind( dummy ).(*(args+a), &(blk||b||->{}))
          end 
        end

        def _get_unbound_method name
           klass.instance_method name
        rescue
          raise if raise_error
        end

        def _mk_legal_receiver
          @__legal_receiver__ ||= case klass
                                  when Class
                                    klass.allocate
                                  when Module
                                    Object.new.extend klass
                                  end
        end
      end # class InstanceFunctionProxy

    end # module FunctionalEmancipation
  end # module More
end # module Lab42

