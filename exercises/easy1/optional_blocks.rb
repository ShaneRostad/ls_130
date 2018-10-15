def compute(num)
  return "Does not compute." unless block_given?
  yield(num)
end


p compute(5) { |num| num + 3 } == 8
p compute(4) { 'a' + 'b' } == 'ab'
p compute(2) == 'Does not compute.'
