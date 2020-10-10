a=[1,2,34,5]
puts a[1]
puts a[10]		
puts a.map(2..4){|i|i.to_f} # Array 		[34.0,	5.0]	
puts a.map{|i|i.to_f} #array 	[1.0,	2.0,	34.0,	5.0]

b=["cat","bat","mat","sat"]
puts b[-1]	
puts b[5]	
puts b.map(2..10){|x|x[0].upcase+x[1,x.length]}   ["Mat","Sat"]
puts b.map(2..4) {|x|x[0].upcase+x[1,x.length]}	  ["Mat","Sat"]
puts b.map(-3..-1) {|x|	x[0].upcase	+x[1,x.length]}	   ["Bat",	"Mat",	“Sat”]
puts b.map{|x|x[0].upcase+x[1,x.length]}        ["Cat",	"Bat",	"Mat",	"Sat"]


#*****************************TEST CASES(pt1)***********************************
a=[1,2,34,5]
puts a[1]
puts " "
puts a[10]		
puts " "
puts a.map(2..4){|i|i.to_f} # Array 		
puts " "
puts a.map{|i|i.to_f} #array 	
puts " "
b=["cat","bat","mat","sat"]
puts b[-1]
puts " "
puts b[5]
puts " "
puts b.map(2..10){|x|x[0].upcase+x[1,x.length]}
puts " "
puts b.map(2..4) {|x|x[0].upcase+x[1,x.length]}
puts " "
puts b.map(-3..-1) {|x|	x[0].upcase+x[1,x.length]}
puts " " 
puts b.map{|x|x[0].upcase+x[1,x.length]}
puts " " 
a = [1,2,3,nil,nil,nil,nil,10]
puts a[3] # nil --> Empty string
Valid 
./rgrep.rb -w test.txt road -c