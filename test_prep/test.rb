class Person
  def self.run_this_code(some_code)
    some_code.call
  end
end

def grab_name
  "Tony"
end



chunk_of_code = Proc.new {puts "hi #{grab_name} and #{rob}"}
name = "John"
rob = "slobert"
Person.run_this_code(chunk_of_code) # => "hi Tony and Robert"
