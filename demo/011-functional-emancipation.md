# Lab42::More More for Core

## Functional Emancipation

In short terms. The fact that, very conveniently, `rcv.msg` sends a message to the reciever (or invokes a method as one might conclude a little bit prematurely)
shall not inihibit us to access the - potentially - associated method in a simple way.

In long terms. 
We will use proxies for accessing methods

```ruby
  add20 = 20.fn.+
  add20.(22).assert == 42

  # fn plays nicely, but be aware of the nil
  20.fn.no_such_method.assert == nil

  # fn! does not, which you might want sometimes
  proxy = 20.fn!
  NameError.assert.raised? do
    proxy.no_such_method
  end
    
```

and instance methods

```ruby
    add = Fixnum.fm.+

    add.(20, 22).assert == 42
    # Which can be a partial application
    
    add20 = Fixnum.fm.+ 20
    add20.(22).assert == 42

    # The receiver is not partially applied, because that can be done
    # with #fn
    # C4Uself
    sub20 = Fixnum.fm.- 20
    sub20.(22).assert == +2 # !!!! yes +2
    20.fn.-.(22).assert == -2
```


These parital applications of the parametes are very useful for HO methods

```ruby
    (1..2).map( Fixnum.fm.*( 2 ) ).assert == [2,4]
    # However, in this case, the API itself gives us an even more concise way
    # (1..2).map( :*, 2 ).assert == [2,4]
```
