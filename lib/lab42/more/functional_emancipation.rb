require_relative 'functional_emancipation/method_proxy'
require_relative 'functional_emancipation/function_proxy'
require_relative 'functional_emancipation/instance_method_proxy'
require_relative 'functional_emancipation/instance_function_proxy'

module Lab42
  module More
    module FunctionalEmancipation

      class ::Object
        def fn
          MethodProxy.new self
        end

        def fn!
          MethodProxy.new self, raise_error: true
        end
        def func
          FunctionProxy.new self
        end
        def func!
          FunctionProxy.new self, raise_error: true
        end
      end # class ::Object

      class ::Module
        def fm
          InstanceMethodProxy.new self
        end
        def fm!
          InstanceMethodProxy.new self, raise_error: true
        end
        def func
          InstanceFunctionProxy.new self
        end
        def func!
          InstanceFunctionProxy.new self, raise_error: true
        end
      end # class ::Module
      
    end # module FunctionalEmancipation
  end # module More
end # module Lab42
