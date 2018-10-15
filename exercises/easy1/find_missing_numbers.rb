# input:
# - sorted array of integers

#output:
# - an array that includes all the missing integers (in order) between the first and last elements of the argument
=begin
def missing(array_of_integers)
  output = []

  full_list = (array_of_integers.first..array_of_integers.last).to_a
  full_list.each do |num|
    unless array_of_integers.include?(num)
      output << num
    end
  end

  output
end


p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
=end

def missing(array)
  full_list = (array.first..array.last).to_a
  full_list - array
end
p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
