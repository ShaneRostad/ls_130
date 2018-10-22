Though many people use RSpec, Minitest is the default testing library that comes with Ruby. From a pure functionality standpoint, Minitest can do everything RSpec can, except Minitest uses a more straight forward syntax.

RSpec is what we call a Domain Specific Language; it's a DSL for writing tests.

With Minitest we use _assertion_ or _assert-style_ syntax. Minitest also can use a different syntax called _expectation_ or _spec-style_ syntax.

It looks like:

```ruby
require 'minitest/autorun'

require_relative 'car'

describe 'Car#wheels' do
  it 'has 4 wheels' do
    car = Car.new
    car.wheels.must_equal 4           # this is the expectation
  end
end
```

This syntax mimics RSpec's syntax, but is not important to know.
