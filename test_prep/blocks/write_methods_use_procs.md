#### Write Methods That Use Procs

In Ruby, we use `Proc` objects to implement closures. We can instantiate a `Proc` object by calling `Proc.new` and passing in a block.

```ruby
chunk_of_code = Proc.new {puts "hi John"}
```

After instantiating our `Proc` object, we can now use it in a method by explicitly calling it:

```ruby
def call_me(some_code)
  some_code.call
end

chunk_of_code = Proc.new { puts "hi John" }
call_me(chunk_of_code) # => "hi John"

```

To execute the block saved within our `Proc` object, we have to use `Proc#call`. 
