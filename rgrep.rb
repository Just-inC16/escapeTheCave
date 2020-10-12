#!/usr/bin/env ruby
#Able to use optionParser
# filename(.txt) will always be the first arg with extensions
#display the results to console (Ex. grep)
#-p is default option
#Invalid combination of options
#Invalid option
#Missing required arguments

#Fetch arguments in Array 
params = ARGV
#Check to see if arguments exist(Less than 2)
if params.length ==0 or params.length ==1
    puts "Missing required arguments"
end