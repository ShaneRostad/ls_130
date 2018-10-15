#input: a positive integer
#output: a list of all divisors of the integer passed in.



def divisors(integer)
  counter = 1
  result = []
  until counter > integer
    result << counter if integer % counter == 0
      counter += 1
  end
  result
end

p divisors(7)
p divisors(12)
p divisors(98)
p divisors(99400891) == [1, 9967, 9973, 99400891]
