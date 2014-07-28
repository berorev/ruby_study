require 'rexml/document'

include REXML

doc = Document.new(%Q(
<?xml version="1.0" encoding="UTF-8" ?>
<result>
    <message><![CDATA[Hello World]]></message>
</result>
))
message = XPath.first(doc, '/result/message')
p message.text