require 'time'

def str_to_time_test
  subject = 'Synced at 2014-02-27 16:46:54 +0900'
  time_str = subject.match(/Synced at (.+)$/)[1]
  time = Time.parse(time_str)
  puts time
end

if __FILE__ == $0
  str_to_time_test
end