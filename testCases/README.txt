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

a = [1,2,3,4,5]
puts a.map(2..4){|x| x * 2}.class
puts " "
puts a.map(-5...-3){|x| x * 2}.class
puts " "
puts a.map(-10..10){|x| x * 2}.class
puts " "
puts a.map(2..1){|x| x * 2}.class
puts " "
# puts a.map('a'..'z') {|x| x * 2}
# puts " "
# puts a.map('pie'){|x| x * 2}
# puts " "
# puts a.map("a") {|x| x * 2}

******************Part 2********************************************************************

Valid 
./rgrep.rb -w test.txt road -c

Invalid 
./rgrep.rb test.txt -w -c -m road


References 
https://www.rubyguides.com/2019/07/ruby-string-concatenation/
.class ==> check type


# a= [1,2,3,4,5]
# b=["cat","bat","mat","sat"]
# puts a[1]
# puts " "
# puts a[10]	
# puts " "
# puts b[-1]
# puts " "
# puts b[5]
# puts a[1..30]
# puts "hello"
# puts a[1..-1]
# puts "ff "
# puts a[-10..10].class
# puts " "
# puts a[-1..-4].class
# puts " "
# x=a.length+1
# x1=a.length*-1-1
# puts x
# puts "a "
# puts a[x..10].class
# puts " b"
# puts a[x1..100000].class
# puts " c"
# puts a[10..10].class
# puts " d"
# puts a[x..40].class
# puts " e"
# puts a[(x1+1)..100000].class
# puts a[-10]
# puts a[2]
# puts a[10]
# puts a[1..30]
# puts a[1..30].class
# puts 123
# puts a[1..-1]
# puts a[1..-1].class
# puts a[-1..-4]
# puts a[-1..-4].class
# puts a[-10..10]
# puts a[-10..10].class
# puts a[6].class
# b=[]
# puts a[2]
# puts a[2].class

# puts a[9]
# puts a[9].class

# puts a[3..1]
# # puts a[1..3].class

# puts b[2]
# puts b[2].class
# b	=	["cat","bat","mat","sat"]
# puts b[-1]
# puts b[-1].class


m
1
m
8
m
11
m
10
m
2
m
3
m
4
m
5
m
6
m
7
m
8
m
7
m
17
m
20
m
19
m
9
m
12
m
13
m
14
m
15
m
16
m
18
m
19
m
20
m
11



