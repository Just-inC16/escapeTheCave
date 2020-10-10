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
            return self.values_at(index) 
        end
    end
    def map (seq="all")
         temp=[]
         #Check for no sequence
        if seq=="all"
            #Print all
            i=0;
            while i < self.length
                temp.append(yield(self[i]))
                i=i+1
            end
            return self
        end

        #Return the elements in sequence excluding out of bounds
        for i in seq
            puts self[i]
            if self[i]=='\0'
                return temp
            end
            temp.append(yield(self[i]))
        end
        return temp
    end
end
a=[1,2,34,5]	
puts a.map(2..4){|i|i.to_f}		
puts a.map{|i|i.to_f}

