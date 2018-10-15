def count(*arguments)
  total = 0
  arguments.each { |item| total += 1 if yield(item)}
  total
end
