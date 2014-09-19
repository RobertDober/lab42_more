module Lab42
  module More
    module FunctionalEmancipation

      class FunctionProxy
        attr_reader :raise_error, :object
        
        private
        def initialize object, raise_error: false
          @object = object
          @raise_error = raise_error
        end

        def method_missing name, *args, &blk
          Behavior.new( object.method name )
        rescue
          raise if raise_error
        end

      end # class FunctionProxy

    end # module FunctionalEmancipation
  end # module More
end # module Lab42

