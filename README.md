# Lab42::More More for Core

This is an extionsion of the _lab42_core_ gem, which will not be maintained anymore. It therefore
remimplements the features of that gem.

_lab42_more_ is intended as a base gem depending on Ruby 2.1 or greater and not on any other gem.


## Philosophy

## Get rid of inconsistencies and kludges

Meaning basically `Symbol#to_proc` for the kludges part and the tough way to specify behavior when **not** using blocks.

The desire for a more concise expression of behavior - in the functional sense - was satisfied very early by means of the
`Symbol#to_proc` kludge and the way Ruby interprets the syntactic construct of `&<expression>`.

Please refer to the [corresponding demo](https://github.com/RobertDober/lab42_more/blob/master/demo/001-base-concepts.md) 
for more details.


## Concise Specification of Functional Behavior

Direct declination of the above, the desire to express behavior (message sending, but also others) will be implemented on side
of the APIs, not the clients anymore.

IOW, it is the API that gives the correct semantic meaning to a parameter and not the paramter itself. It is, AAMOF, a simple
question of putting the _Semantic_ _Responsibility_ where it belongs.

## Functional Emancipation

Ruby intends itself to be _Multi_ _Paradigm_. However in its core there are serious breaks to achieving functional emancipation.

By design for syntactic sugar, and we adhere to this at 100%, `rcv.msg` is a method **invocation**. However we would love to get 
our hands on the _Behavior_, **without** a clumsy `rcv.method(:msg) rescue nil`.


And that is where the former lab42_core/fn module comes in. Instance methods and methods becoming available via `Module#fn` and `Object#fm` proxies
giving us code like `rcv.fm.msg`, `cls.fn.msg` or the exception raising bang versions of these.

Please refer to the [corresponding demo](https://github.com/RobertDober/lab42_more/blob/master/demo/011-functional-emancipation.md) 
for more details.


## Detailed Verified Documentation, Using QED

Please see the [QED](http://rubyworks.github.io/qed/) demos [here](https://github.com/RobertDober/lab42_more/blob/master/demo)
for a detailed description of all features.
