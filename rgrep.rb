#!/usr/bin/env ruby
def wOption(params)
    len = params.length
    exp = Regexp.new(params[len-1])
    exp = /\b#{params[len-1]}\b/
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
        aFile.each_line{|line| puts line if line !~exp }
    end
end 
def wcOption(params)
    count=0
    len = params.length
    exp = Regexp.new(params[len-1])
    exp = /\b#{params[len-1]}\b/
    File.open(params[0] , "r") do |aFile|
        aFile.each_line {|line|  
            count+=1  if line.match?(exp)
        }
        puts count
    end
end 
def pcOption(params)
    count=0
    len =params.length
    exp =Regexp.new(params[len-1])
    File.open(params[0], "r") do |aFile|
        aFile.each_line{|line| 
            count+=1  if line =~exp    
        }
        puts count
    end
end 
def vcOption(params)
    count=0
    len =params.length
    exp =Regexp.new(params[len-1])
    File.open(params[0], "r") do |aFile|
        aFile.each_line{|line|
            count+=1 if line !~exp
        }
        puts count 
    end
end 
def wmOption(params)
    len = params.length
    exp = Regexp.new(params[len-1])
    exp = /\b#{params[len-1]}\b/
    File.open(params[0] , "r") do |aFile|
        aFile.each_line {|line|  
            puts params[len-1] if line.match?(exp)
        }
    end
end 
def pmOption(params)
    # count =1
    len =params.length
    exp =Regexp.new(params[len-1])
    File.open(params[0], "r") do |aFile|
        aFile.each_line{|line| 
            puts "#{$&}" if line =~exp       
        }
    end
end 
def combinationOfOpt(params, option1, option2)
    case option1
        when 'c'then handleC(params, option2)
        when 'm' then handleM(params, option2)
        else puts "Invalid combination of options"
    end
end

def handleC(params, option2)
    case option2 
        when 'w' then wcOption(params)
        when 'p' then pcOption(params)
        when 'v' then vcOption(params)
        else puts "Invalid combination of options"
    end 
end
def handleM(params, option2)
    case option2 
        when 'w' then wmOption(params)
        when 'p' then pmOption(params)
        else puts "Invalid combination of options"
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
        #Check if options with filename or option with pattern(len,'-', match regexp) ==> Invalid option -f 
        if (params[1].length==2 and params[1][0]=='-' and params[1] !~ /\-[wpvcm]/)
            puts "Invalid option" 
        elsif (params[0].length==2 and params[0][0]=='-' and params[0] !~ /\-[wpvcm]/)
            puts "Invalid option" 
        #Option at beggining/end
        elsif (params[0].length==2 and params[0][0]=='-' and params[0] =~ /\-[wpvcm]/)
            puts "Missing required arguments" 
        elsif (params[1].length==2 and params[1][0]=='-' and params[1] =~ /\-[wpvcm]/)
            puts "Missing required arguments" 
        else 
            pOption(params)
        end 
    #More than 2 options 
    elsif params.length >4
         puts "Invalid combination of options"

    #Just enough arguments     
    else
        #Only 1 option
        opt1=params[1]

        if(opt1=='-c' or opt1=='-m' )
            puts "Invalid option"
        end
        if(params.length ==3 and opt1 =~ /\-[wpv]/)
            case opt1
                #Return all lines with word
                when '-w' then wOption(params)
                #Return all lines with regular expression
                when '-p' then pOption(params)
                #Return all lines without regular expression
                else vOption(params)
            end
        end

        #2 options 
        if(params.length ==4 )#and opt1 =~ /\-[wpv]/)
            #Combine and sort 
            options=params[1]+params[2]
            sortOpt=options.split('').sort
            #Check for - and options to variables 
            if (sortOpt[0]=='-' and sortOpt[1]=='-' && sortOpt.length==4)
                if(params[1]!~ /\-[wpvcm]/ or params[2]!~ /\-[wpvcm]/)
                    puts "Invalid option"
                
                else
                    #Assign to variables 
                    opt1 = sortOpt[2]
                    opt2 = sortOpt[3]
                    combinationOfOpt(params, opt1, opt2)
                end
            else 
                puts "Invalid combination of options"
            end
        end
    end 
end
