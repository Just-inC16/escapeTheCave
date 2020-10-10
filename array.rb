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
            # print self.values_at(index)
            # print self.values_at(index).class
            # puts self.values_at(index).join
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
