
module Lab42
  module More
    module EnumerableMethods
      UnifiedMethods = {
        map: ->(*args, &blk) do
          # It is important to maintain the original API first
          return __lab42_more__map__ &blk if blk
          return __lab42_more__map__ &args.first if args.first.respond_to? :call
          __lab42_more__map__ &sendmsg(*args)
        end,
        filter: ->(*args, &blk) do
          return select &blk if blk
          return select &args.first if args.first.respond_to? :call
          select &sendmsg(*args)
        end
      }

      def self.included into
        UnifiedMethods.each do | umname, umbody |
          into.send :alias_method, "__lab42_more__#{umname}__", umname rescue nil
          into.send :define_method, umname, &umbody
        end
      end
    end # module EnumerableMethods
  end
end
