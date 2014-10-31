class Mail
  def initialize
    yield(self)
    puts @from_email
  end
  
  def from(from_email)
    @from_email = from_email
  end
end

Mail.new do |m|
  m.from 'from@gmail.com'
end

