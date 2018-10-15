# recreating the Range#step method, which allows you to iterate over a range of values where each value in the iteration is the previous value plus a "step" value.

# input:
# - 3 integer arguments:
# - - the starting value
# - - the ending value
# - - the step value to be applied to each iteration
# - should also take a block which it will yield successive iteration values.

# output:

# return:
# - the original range


def step(start, stop, step)
  sum = start
  result = []
  until sum > stop
    yield(sum)
    result << sum
    sum += step
  end
  result
end

p step(1, 10, 3) { |value| puts "value = #{value}"}
