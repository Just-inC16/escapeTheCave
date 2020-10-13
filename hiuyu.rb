#!/usr/bin/env ruby
params = ARGV
len =params.length
exp =Regexp.new(params[len-1])
File.open(params[0], "r") do |aFile|
aFile.each_line{|line|
    if line =~exp
	 puts "#{$&}"
    end
} 
end
