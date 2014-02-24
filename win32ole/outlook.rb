require 'win32ole'

outlook = WIN32OLE.new('Outlook.Application')

mapi = outlook.GetNameSpace('MAPI')

inbox = mapi.GetDefaultFolder(6)
tss = inbox.Folders.Item('5. TSS')

puts "[INBOX] #{inbox.UnreadItemCount} unread messages"
puts "[5. TSS] #{tss.UnreadItemCount} unread messages"


