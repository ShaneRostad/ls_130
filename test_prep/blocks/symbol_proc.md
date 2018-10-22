We've seen the shorthand code:

```ruby
[1, 2, 3, 4, 5].map(&:to_s)
```

in the past and have used it without asking what is actually happening here.

This code is actually:

```ruby
[1, 2, 3, 4, 5].map { |num| num.to_s }
```

So how does this happen?

It's related to the use of & with explicit blocks, but since it's applied to a method parameter, it's also different.

The `&` in front of the object tells Ruby to try to convert this object into a block. To do so, it's expecting a `Proc` object. If the object is not a `Proc` object it will call `#to_proc` on the object.

In our example, ruby calls `Symbol#to_proc`, which will return a `Proc` object, and execute the method based on the name of the sumbol.
