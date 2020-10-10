a=[1,2,34,5]
puts a[1]
puts a[10]		
puts a.map(2..4){|i|i.to_f}		
puts a.map{|i|i.to_f}

b=["cat","bat","mat","sat"]
puts b[-1]	
puts b[5]	
puts b.map(2..10){|x|x[0].upcase+x[1,x.length]}
puts b.map(2..4) {|x|x[0].upcase+x[1,x.length]}	
puts b.map(-3..-1) {|x|	x[0].upcase	+x[1,x.length]}	
puts b.map{|x|x[0].upcase+x[1,x.length]}	