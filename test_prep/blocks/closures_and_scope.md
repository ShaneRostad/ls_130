## Closures and Scope

In programming, closures allow programmers to save a "chunk of code" and execute it at a later time. It's called a closure because it's said to bind its surrounding artifacts (variables, methods, objects, etc) and build an "enclosure" around anything so that they can be referenced when the closure is later executed.

In Ruby, we use `Proc` objects to implement closures.

We can think of a `Proc` object (or closure) as an object that carries around a chunk of code with the ability to reference its binding.

When the code within the closure is called, Ruby temporarily changes the current environment to that of where the Proc was instantiated in order to allow access to its most updated binding.

Take for example this bit of code:

```ruby
class Person
  def self.run_this_code(some_code)
    some_code.call
  end
end

def grab_name
  "Tony"
end

name = "Robert"
chunk_of_code = Proc.new { puts "hi #{grab_name} and #{name}" }
name = "Slobert"
Person.run_this_code(chunk_of_code) # => "hi Tony and Robert"


```

Here we instantiate a new `Proc` object on line 23. The local variable `chunk_of_code` is now pointing to the `Proc` `{puts "hi #{grab_name} and #{name}"}`.

What's interesting about this output is when we pass in the Proc object `chunk_of_code` into our Person class method `run_this_code`, the class method is able to access both the local method `grab_name` and the local variable `name`.

This illustrates the concept of binding, showing us that when executed, our Proc object has the ability to access elements from the scope in which it was instantiated.

Another nuance of closures and scope is how closures work with reassignment. For example, if we make this change to our code:

```ruby
#code omitted for brevity...
name = "Robert"
chunk_of_code = Proc.new { puts "hi #{grab_name} and #{name}" }
name = "Slobert"
Person.run_this_code(chunk_of_code) # => "hi Tony and Slobert"
```

We can see that when called, our `Proc` object references the most up-to-date value of `name`, rather than the value at instantiation.

As a last point, take this code for example:

```ruby
#code omitted for brevity...
chunk_of_code = Proc.new { puts "hi #{grab_name} and #{name}" }
name = "Slobert"
Person.run_this_code(chunk_of_code)
# => "undefined local variable or method `rob`..."
```

In this case, the `Proc` object fails to instantiate because there is no local variable `name` at the point of instantiation.

These two examples show us that `Proc` objects will always reference the most up-to-date value of a local variable. Although, quite obviously, that local variable must be initialized before we instantiate the `Proc` object.
