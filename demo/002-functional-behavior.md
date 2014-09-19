# Lab42::More More for Core

## Functional Behavior

Inspired by modern functional languages à la [Haskell](http://www.haskell.org/haskellwiki/Haskell), [Elixir](http://elixir-lang.org/), [Livescript](http://livescript.net/), [Clojure](http://clojure.org/) and many more, this part of `Lab42::More` tries to implement features nowadays considered more and more normal.


### Expressive Access to Behavior

In Ruby **Behavior** is either a `Method` or a `Proc` instance. The herewith introduced `Behavior` class unifies them.

`Behavior` can be constructed from a callable or a block, however there are helpers to do this more concisely


```ruby
    Behavior.new{ |a| 2 * a }.(21).assert == 42
    sendmsg( :a ).assert.kind_of? Behavior
    B(:+, 1).(41).assert == 42
    Fixnum.fm.+.assert.kind_of? Behavior
    Fixnum.fm.+.(1,41).assert == 42
    42.fn.*.assert.kind_of? Behavior
    41.fn.+.(1).assert == 42
```

Sometime the receiver just does not matter, e.g. if a module acts as a namespace for
functions.

Then the associated `Behavior` can also be accessed:

```ruby
    module Calculations
      def add lhs, rhs, &wrapper
        wrapper.( lhs + rhs )
      end
    end

    Calculations.func.add.assert.kind_of? Behavior
    Calculations.func.add.(1,20){|r| r * 2 }.assert == 42
```


