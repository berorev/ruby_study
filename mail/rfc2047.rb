
# References
# - https://github.com/ConradIrwin/rfc2047-ruby

module RFC2047
  ENCODED_WORD_REGEXP = /=\?([^\?]+)\?([Bb])\?([^\?]+)\?=/ # "=?<charset>?<encoding>?<encoded-text>?=", Only supports encoding=[Bb]
  
  def self.decode(encoded_words)
    # FIX encoding for Korean
    encoded_words.gsub!('ks_c_5601-1987', 'cp949')
    
    encoded_words.gsub(ENCODED_WORD_REGEXP) do |encoded_word|
      charset = $1
      encoding = $2
      encoded_text = $3
      
      begin
        encoded_text = encoded_text.unpack('m*')[0]
        encoded_text = encoded_text.encode('UTF-8', charset)
      rescue
        raise Unparseable, encoded_words
      end
    end
  end
end
