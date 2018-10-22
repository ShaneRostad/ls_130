### How Blocks Work and when we want to use them

We see blocks everywhere in Ruby. Take the common `Array#each` method:

```ruby
[1, 2, 3].each do |num|
  puts num
end
#or
[1, 2, 3].each { |num| puts num }
```

The block is the `do..end` or `{..}` part.

While we use blocks constantly in Ruby, up until this point we haven't discussed exactly _how_ they work. Let's break it down.

Looking at our `Array#each` method, we're actually passing the block into the method as an argument. In fact, any method in Ruby can take a block--it's just a matter of whether the method is implemented in a way that uses our block.

Let's use a simpler example:

```ruby
def greeting
  puts "Hello!"
end

greeting { puts "Goodbye!" } # => "Hello!"
```

Here we've defined a custom method `greeting`, which prints `"Hello!"` to the screen. As you can tell, we have attempted to pass a block in to our `greeting` method but nothing happened. In order to enable our method to use the block, we must use the `yield` keyword.

```ruby
def greeting
  yield
end

greeting { puts "Goodbye!" } # => "Goodbye!"
```

In this example, we `yield` to the block within our method which executes the code in the block. What happens if we were to `yield` to a block, but not pass one in as an argument?

```ruby
def greeting
  yield
end

greeting # => LocalJumpError (no block given (yield))
```
In this case we get a `LocalJumpError`, telling us that we did not pass in a block and our method needs one. So, what if we want to only yield to a block _sometimes_?

```ruby
def greeting
  if block_given?
    yield
  end
end

greeting #=> nil
```
For this, we use the method `block_given?` which will evaluate to `true` only if we pass in a block.

This is where we start to see the power and flexibility provided by blocks even with our simple method:

```ruby
def greeting
  if block_given?
    "Hello #{yield}!"
  else
    "Hello!"
  end
end

greeting            # => "Hello!"
greeting { "John" } # => "Hello John!"
```

In the first invocation of `greeting` we returned a generic "Hello!", and in the second greeting we were able to allow ourselves to customize the method by passing in a block.

This is the first major use-case of blocks: allowing future you, or another developer to customize the method at invocation. In this way we can write very flexible methods that can be used to accomplish various goals within our program.

We also saw in this example that `yield` has a return value, which is the block's return value.


#### More on yield

We've now seen that we can choose to `yield` to a block within our method implementations and leave the decision up to future-you if it might be beneficial. What we haven't seen, is something that is common in our `Array#each` method--passing a value to our block.

Let's look at an example:

```ruby
[1, 2, 3].each { |num| puts num }

# => 1
# => 2
# => 3
```
Here we have our `#each` method from earlier. As we know, the each method assigns the element of the current iteration to the block variable `num`, and then execute the block on each iteration.

But how does this actually work? Let's take a look:

```ruby
def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end
end

each([1, 2, 3]) { |num| puts num}
# => 1
# => 2
# => 3
# nil
```

Here is how we could define our own custom `#each` method. As we can see, we define a loop in which on each loop we pass an element of our array into the block.

This element is then set to `num` by `|num|`, and the block is executed.  A similar looping structure is used to implement `Array#each`, `Array#select`, and other common methods in Ruby.

We've already discussed the first use-case for blocks--defer some implementation code to method invocation decision.

The second, would be methods that need to perform some `before` and `after` actions - sandwich code.

Here we can imagine a method `time_it` which would give us the ability to time our code execution.

```ruby
def time_it
  time_before = Time.now
  yield
  time_after = Time.now

  puts "It took #{time_after - time_before} seconds"
end

time_it { sleep(10) } # => "It took 10.00636 seconds"
```
