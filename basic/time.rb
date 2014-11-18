require 'time'

puts Time.parse('2014-10-01')

puts t = Time.now
puts t = t.utc
puts t = t - t.hour * 60 * 60
