# reference: http://ruby-doc.org/core-2.1.5/Enumerable.html

arr = (1..5)

p arr.map { |i| i ** 2 }
puts arr.reduce(:+)
puts arr.inject { |sum, n| sum + n } # iterate <1,2>, <3,3>, <6,4>, <10,5>
puts arr.inject(0) { |sum, n| sum + n } # iterate <0,1>, <1,2>, <3,3>, <6,4>, <10,5>
puts arr.reduce(1, :*)
puts arr.inject { |product, n| product * n } # iterate <1,2>, <2,3>, <6,4>, <24,5>
puts arr.inject(1) { |product, n| product * n } # iterate <1,1> <1,2>, <2,3>, <6,4>, <24,5>

puts %w{ cat sheep bear }.inject { |w1, w2| w1.length > w2.length ? w1 : w2 } # iterate <cat,sheep>, <sheep,bear>

puts arr.find { |i| i % 2 == 0 }
puts arr.find { |i| i % 7 == 0 }.nil?

p arr.find_all { |i| i % 2 == 0 }

c = IO.constants
p c.grep(/SEEK/)
p c.grep(/SEEK/) { |v| IO.const_get(v) }

puts %w{ cat sheep bear }.max_by { |x| x.length }
p %w{ cat sheep bear }.sort_by { |x| x.length }

