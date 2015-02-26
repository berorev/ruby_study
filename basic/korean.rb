# @see http://helloworld.naver.com/helloworld/76650

class KoreanJamoSeparator
  INITIALS = [ 'ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ', 'ㅇ' , 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ' ]
  MEDIALS = [ 'ㅏ', 'ㅐ', 'ㅑ', 'ㅒ', 'ㅓ', 'ㅔ', 'ㅕ', 'ㅖ', 'ㅗ', 'ㅘ', 'ㅙ', 'ㅚ', 'ㅛ', 'ㅜ', 'ㅝ', 'ㅞ', 'ㅟ', 'ㅠ', 'ㅡ', 'ㅢ', 'ㅣ' ]
  FINALS = [ ' ', 'ㄱ', 'ㄲ', 'ㄳ', 'ㄴ', 'ㄵ', 'ㄶ', 'ㄷ', 'ㄹ', 'ㄺ', 'ㄻ', 'ㄼ', 'ㄽ', 'ㄾ', 'ㄿ', 'ㅀ', 'ㅁ', 'ㅂ', 'ㅄ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ' ]
  
  def separate_from_utf8(str)
    separated = []
    str.each_codepoint do |c|
      if c < 0xAC00 || c > 0xD7A3
        separated << [c].pack('U')
        next
      end
      
      c = c - 0xAC00
      
      initial = c / (21 * 28)
      medial = c % (21 * 28) / 28
      final = c % 28
      
      separated << INITIALS[initial]
      separated << MEDIALS[medial]
      separated << FINALS[final] if final > 0
    end
    
    separated
  end
end

if __FILE__ == $0
  puts KoreanJamoSeparator.new.separate_from_utf8('가힣한글123abc').join(', ')
end