class S1
  def initialize
    puts 'S1'
    px
  end
  
  def px
    puts 'hi'
  end
end

class C1 < S1
  def initialize
    @a = 10
    puts 'C1'
    px
    super
  end
  
  def px
    puts @a
  end
end

c = C1.new
