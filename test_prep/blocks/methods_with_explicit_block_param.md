Every method, regardless of its definition, takes an implicit block. It may ignore the implicit block, but it still accepts it. However, there are times when you want a method to explicitly require a block; you do that by defining a parameter prefixed by an & character in the method definition:

```ruby
def test(&block)
  puts "What's &block? #{block}"
end
```

Here, the `&block` is a special parameter that converts the block argument to what we call a "simple" `Proc` object. We can then drop the `&` when referring to the `Proc` within the method

When we use the method, here's what happens:

```ruby
test { sleep(1) }

# What's &block? #<Proc:03412395123f931f>
# => nil
```

We can see the `block` local variable is now a `Proc` object. Why would we want to do this?

We've seen previously that we can simply `yield` to a block, and then we can even save the return value to a variable. What we couldn't do was reference the block itself, we could only execute the block and access its return value.

Now, we can pass `block` into another method and execute it when we need to using `Proc#call`.

When a method explicitly requires a block, we could pass in a `Proc` object or a `Lambda`, which Ruby will pass in unchanged. If the argument passed in is neither a Proc object or a lambda, Ruby calls `#to_proc` on the object and passes the result to the method.




``
