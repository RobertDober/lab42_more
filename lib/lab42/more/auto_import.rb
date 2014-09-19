require_relative '../more'

More = Lab42::More

class Array
  include  More::EnumerableMethods
end

module Enumerable
  include  More::EnumerableMethods
end # module Enumerable

class Enumerator
  class Lazy
    include  More::EnumerableMethods
  end
end




