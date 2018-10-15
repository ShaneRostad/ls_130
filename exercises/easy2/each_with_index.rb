def each_with_index(array)
  array.each do |item|
    index = array.index(item)
    yield(item, index)
  end
  array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
