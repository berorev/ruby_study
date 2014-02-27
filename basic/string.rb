# reference: http://stackoverflow.com/questions/15478738/ruby-imap-searching-a-subject-with-special-characters-doesnt-work

def encoding_test
  puts 'START// encoding_test'
  
  a = /[\x80-\xff\r\n]/n
  str = "olÃ¡가나다xx"
  
  puts "Original: #{str.inspect} (#{str.encoding})"

  puts "Do force_encoding (#{str.encoding} -> ascii-8bit)"  
  str = str.force_encoding('ascii-8bit')
  
  puts "Changed: #{str.inspect} (#{str.encoding})"
  
  puts "Regular expression works fine. (#{a =~ str})"
  puts 'END// encoding_test'
end

if __FILE__ == $0
  encoding_test
end