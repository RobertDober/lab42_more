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
    # We can however use a behavior for a more concise block
    Calculations.func.add.(1,20,&B(:*, 2)).assert == 42
```

The proxies returned by the non bang version just return `nil` if the behavior does not exist, this is not the case
for the bang versions, let us demonstrate

```ruby
    42.fn.does_not_exist.assert.nil?
    NameError.assert.raised? do
      42.fn!.does_not_exist
    end
```


### Behavior Combination

It is the foremost mean of expressing complex behavior in functional languages. Let us have a look at the most classic approach to do this...

#### Functional Composition

`(f * g)(a)` means `f(g(a))`

This is not the most readable notation, as we are applying from right to left but implemented for completeness

```ruby
    adder = B(:+, 1)
    doubler = B(:*, 2)
    trippler = Behavior.new do |x| x * 3 end

    (doubler * adder).(20).assert == 42
```

#### Functional Pipelining

Here `(f | g)(a)` means `g(f(a))` and now the application order is like in a (unix shell) pipeline.

```ruby
    ( adder | doubler ).(20).assert == 42
```


