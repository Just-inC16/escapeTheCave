#!/usr/bin/env ruby
def wOption(params)
    len = params.length
    exp = Regexp.new(params[len-1])
    exp = /\b#{params[len-1]}/
    File.open(params[0] , "r") do |aFile|
        aFile.each_line {|line| puts line if line.match?(exp)}
    end
end 
def pOption(params)
    len =params.length
    exp =Regexp.new(params[len-1])
    File.open(params[0], "r") do |aFile|
        aFile.each_line{|line| puts line if line =~exp }
    end
end 
def vOption(params)
    len =params.length
    exp =Regexp.new(params[len-1])
    File.open(params[0], "r") do |aFile|
        aFile.each_line{|line| puts line if !line =~exp }
    end
end 
#Fetch arguments in Array 
params = ARGV
#Check to see if arguments exist(Less than 2)
if params.length ==0 or params.length == 1
    puts "Missing required arguments"
#More than 2 args
else 
    #Check if no options (default -p)
    if params.length == 2 
        pOption(params)
    #More than 2 options 
    elsif params.length >4
         puts "Invalid combination of options"
    #Just enough arguments     
    else
        #Only 1 option
        opt1=params[1]
        if( params.length ==3 and opt1 =~ /\-[wpv]/)
            case opt1
                #Return all lines with word
                when '-w' then wOption(params)
                #Return all lines with regular expression
                when '-p' then pOption(params)
                #Return all lines without regular expression
                else vOption(params)
            end
        else 
            puts "Invalid option"   
        end
    end 
end
# puts params.length 

# puts params[0]
# puts params[1]