# Lab42::More More for Core

## Getting consistently rid of the Symbol#to_proc Kludge

This was the reason which gave birth to the deprecated predecessor of this gem. 

As it remains one of the main tasks of this gem we will start a description of this feature which is achieved in two
steps.




This is achieved via the `Kernel#sendmsg` method, one can imagine `Symbol#to_proc` as implemented as following


Which does its **simple** job

```ruby
    (1..3).map(&:succ).assert == [*2..4]
```

However, what if we want to add 2 to each element of the range?

We are out of luck as the syntactic convention which calls `to_proc` does not allow to pass in parameters, we can prove this with the following reimplementation of `Symbol#to_proc` 

```ruby
    class Symbol
      def to_proc *args, &blk
      require 'pry'
      binding.pry
        -> (rcv) {
          rcv.send self, *args, &blk
        }
      end
    end
```

which does not work

```ruby
    ArgumentError.assert.raised? do
      ->{(1..3).map(&(:+.to_proc(2)))}.assert.raise ArgumentError
    end
```

Anyway all that mess above comes from what I consider a misconception of responsibilities, which is that, WTH, `Symbol` shall be responsible for actions like sending methods to recievers?


The motive for this misconception is well founded in making code more readable and more fonctional. The implementation was a quick and conceptionally desastrous approach.

We try to do better, and that by breaking app the responsibilities.

### Step One, not using Symbol#to_proc

So, where should the responsibility lie, to send messages to objects?

It seems that `Kernel` is pretty much the best place as we will need this service potentially in every _High_ _Order_ method.


Let us demonstrate what it can do for us:

```ruby
    # A simple adder
    add2 = sendmsg :+, 2
    add2.( 40 ).assert == 42
```


Now that we have the `Kernel::sendmsg` method we can use it instead of the `Symbol#to_proc` kludge as follows

```ruby
    (1..2).map(&sendmsg(:-, 2)).assert == [*(-1..0)]
```

There remains the shocking fact that we need to invoke `Proc#to_proc` because of Ruby's syntax. 

Which brings us the the second part of the responsibility:

### Step Two, Specifying Behavior (In the Functional Sense)

If we want to have concise functional APIs for the usual suspects (e.g. `Enumerable` methods) we need to redefine them.

Reducing `map`, `filter` and friends to the block form, **enforces** the invocation of `to_proc` if we want to pass a lambda.

Furthermore it is so obvious that we want a lambda in the expression `something.map :succ` that the API itself should take care of it, to avoid the clumsy 'something.map sendmsg(:succ)'

The following `Enumerable` methods have thusly be redefined to accomodate the client's needs, and not the API's needs anymore.

N.B. That `Enumerable.reduce` just does that already, it remains hidden to my logic why this concept has not been generalized.

Using `Kernel#sendmsg` as a centralized _service_ the Enumerable methods are simply redefined.

```ruby
    digits = 0..9
    digits.map(:succ).assert == [*1..10]

```
