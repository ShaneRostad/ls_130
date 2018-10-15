class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.



class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def done?
    @todos.all?(true)
  end

  def to_a
    @todos
  end

  def add(item)
    raise TypeError, "Can only add Todo objects" if item.class != Todo

    todos << item
  end

  def <<(item)
    @todos << item
  end

  def size
    todos.size
  end

  def first
    todos[0]
  end

  def last
    todos[-1]
  end

  def item_at(index)
    raise IndexError if index > size
    todos[index]
  end

  def mark_done_at(index)
    raise IndexError if index > size
    todos[index].done!
  end

  def mark_undone_at(index)
    raise IndexError if index > size
    todos[index].undone!
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    raise IndexError if index > size
    todos.delete_at(index)
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def each
    counter = 0
    while counter < todos.size
      yield(todos[counter])

      counter += 1
    end

    self

  end

  def select
    result = TodoList.new(@title)
    @todos.each do |todo|
      if yield(todo)
        result << todo
      end
    end
    result
  end

  def find_by_title(string)
    @todos.select do |todo|
      todo.title == string
    end
  end

  def all_done
    @todos.select do |todo|
      todo.done?
    end
  end

  def all_not_done
    @todos.select do |todo|
      !todo.done?
    end
  end

  def mark_done(string)
    @todos.each do |todo|
      todo.done! if todo.title == string
    end
  end

  def mark_all_done
    @todos.each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    @todos.each do |todo|
      todo.undone!
    end
  end

end



# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
#list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

todo1.done!

#results = list.select { |todo| todo.done? }    # you need to implement this method

#puts results.inspect
puts list
list.mark_all_undone
puts list

list.mark_done_at(1)

puts list.all_not_done




=begin
# ---- Interrogating the list -----

# size
puts list.size                       # returns 3

# first
puts list.first                      # returns todo1, which is the first item in the list

# last
puts list.last                       # returns todo3, which is the last item in the list

# ---- Retrieving an item in the list ----


# item_at
#list.item_at                    # raises ArgumentError
puts list.item_at(1)                 # returns 2nd item in list (zero based index)
#puts list.item_at(100)               # raises IndexError



# ---- Marking items in the list -----

# mark_done_at
#list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
#list.mark_done_at(100)          # raises IndexError

# mark_undone_at
#list.mark_undone_at             # raises ArgumentError
#list.mark_undone_at(1)          # marks the 2nd item as not done,
#list.mark_undone_at(100)        # raises IndexError

# ---- Deleting from the the list -----

# shift
#list.shift                      # removes and returns the first item in list

# pop
#list.pop                        # removes and returns the last item in list

# remove_at
#list.remove_at                  # raises ArgumentError
#list.remove_at(1)               # removes and returns the 2nd item
#list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

# to_s
list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym
=end
