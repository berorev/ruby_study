p 'id = ?' =~ /(?<!AND )id = ?/
p 'AND id = ?' =~ /(?<!AND )id = ?/
p "AND USERID LIKE ? + '%'".gsub(/(?<= LIKE )([^\+]+) \+ (?='%')/, '\1 || ')
