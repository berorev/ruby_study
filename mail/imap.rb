require 'net/imap'
require './rfc2047.rb'

# References
# - http://ruby-doc.org/stdlib-2.0/libdoc/net/imap/rdoc/Net/IMAP.html
# - http://alvinalexander.com/blog/post/ruby/ruby-find-all-unique-email-addresses-in-your-inbox

# 1. Connect
# - def initialize(host, port_or_options = {}, usessl = false, certs = nil, verify = true)
imap = Net::IMAP.new('mail.example.com', 993, true, nil, false)
imap.login('user-email', 'user-password')

# 2. List all mailbox (Mailbox/*)
imap.list('Mailbox/', '*').each do |box|
  puts Net::IMAP.decode_utf7(box.name)
end

# 3. Checks if the specified box exists (Mailbox/Sub Mailbox)
REFNAME = 'Mailbox/'
MAILBOX_NAME = 'Sub Mailbox'
unless imap.list(REFNAME, MAILBOX_NAME) # return nil if the box does not exist.
  raise NameError, "No mailbox exists (#{REFNAME}#{MAILBOX_NAME})"
end

# 4. Search mail
imap.select(REFNAME + MAILBOX_NAME)

imap.search(['SINCE', '22-Feb-2014']).each do |msg_id|
  envelope = imap.fetch(msg_id, 'ENVELOPE')[0].attr['ENVELOPE']
  puts "#{RFC2047.decode(envelope.from[0].name)}: #{RFC2047.decode(envelope.subject)}"
  break # Prints one and only one mail.
end

imap.logout
imap.disconnect unless imap.disconnected?
