z=0;File.read("input").split.each_slice(3){|a,b,c|c.scan /[#{a.scan(/[#{b}]/)*""}]/
z+=$&.ord-($&.ord>96&&96||38)}
p z
