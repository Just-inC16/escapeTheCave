#!/usr/bin/env ruby
class Array
    def [](index)
        #Check if array is empty 
        if self.empty?
            return nil
        end 
        #Check for index out of bounds
        if index > self.length-1 or index < self.length*-1
            return '\0'
        else  
            return self.values_at(index).join
        end
    end
    def map (seq="all")
         temp=[]
         #Check for no sequence; Print all
        if seq=="all"
            i=0;
            while i < self.length
                temp.append(yield(self[i]))
                i=i+1
            end
            return temp
        end
        #Return the elements in sequence excluding out of bounds
        for i in seq
            #Check to see if not out of bounds
            if self[i]=='\0'
                return temp
            end
            temp.append(yield(self[i]))
        end
        return temp
    end
end

#puts b.map(0) {|x|x}

# a = [1,2,3,4,5]
# b = a.map(2..4){|x| x * 2}
# puts b
# b = a.map(-5...-3){|x| x * 2}
# puts b
# b = a.map(-10..10){|x| x * 2}
# puts b
# b = a.map(2..1){|x| x * 2}
# puts b
# b = a.map('a'..'z'){|x| x * 2}
# puts b
# b = a.map('pie'){|x| x * 2}
# puts b
# b = a.map(5){|x| x * 2}
# puts b
a=[1,2,3,4,5]
b=a.map
puts b