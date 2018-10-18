class Person
  def self.run_this_code(some_code)
    some_code.call
  end
end

def call_me(some_code)
  some_code.call
end

def grab_name
  "Tony"
end

name = "Robert"


chunk_of_code = Proc.new {puts "hi #{grab_name} and #{name}"}
name = "John"
Person.run_this_code(chunk_of_code) # => "hi Tony and Robert"
