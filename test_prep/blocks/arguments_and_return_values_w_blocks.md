### Arguments and Return Values With Blocks

When working with blocks, we need to be aware of both the return values and how passing arguments work.

We've already mentioned that in Ruby, every method can take a block. Now whether we decide to do anything with that block is up to the method implementor.

What's interesting is when we do decide to use a block:

```ruby
def greeting(first_name, last_name)
  yield(first_name)
end

greeting('John', 'Johnson') { |first| puts first }
# "John"
```

In this case we get what we expected. We passed in a single argument to `yield`, and we initialize a single block variable `first`. This is in line with how we know Ruby to handle arguments.

Though, things change quickly:

```ruby
def greeting(first_name, last_name)
  yield(first_name)
end

greeting('John', 'Johnson') { |first, last| puts "#{first} #{last}" }
# "John"
```

here, we pass one variable in, but we specify two block variables `first` and `last`. Here we don't get an error, but instead `last` is initialized to `nil`, and is therefor printed as an empty string.

**Here's the first thing to remember: we can specify extraneous variables in a block and if no argument is passed to them, they initialize to `nil`**

What if we initialized too few method local variables?

```ruby
def greeting(first_name, last_name)
  yield(first_name, last_name)
end

greeting('John', 'Johnson') { |first| puts "#{first}" }
# "John"
```

In this case we see that Ruby ignores the second argument passed into the block.

These rules around enforcing the number of arguments you can call on a closure in Ruby is called its arity. In Ruby, blocks have lenient arity rules, which is why it doesn't complain when you pass in different number of arguments.



#### Return values


Blocks have a return value, and that return value is determined based on the last expression in the block. This implies that just like normal methods, blocks can either mutate the argument with a destructive method call or the block can return a value. Just like writing good normal methods, writing good blocks requires you to keep the distinction in mind.

For example:

```ruby
def print_this
  variable = yield
  puts variable
end

print_this { "Some random string" }
# "Some random string"
```

Here we see that the return value of `yield` is the string `"Some random string"`, which we can assign to a variable and then act on that variable.

In a similar vane, we can see how our blocks can mutate objects:
```ruby
def print_this
  variable = "String"
  puts yield(variable)
  puts variable
end

print_this { |str| str << "hello" }
# "Stringhello"
# "Stringhello"
```

Here the object `variable` points to was modified by the block. 













```
