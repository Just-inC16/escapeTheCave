#!/usr/bin/env ruby
class Array
    alias oldArr [] 
    alias oldMap map   
    def [](index)
        #Check if array is empty 
        if self.empty?
            return '\0'
        end 
        #Handle a range of numbers 
        if(index.class.to_s == "Range" )
            pos=index.to_a
            len= pos.length-1
            arrLen=self.length
            #Check for nil
            if(pos.length==0)
                return oldArr(index) 
            end
            #check for positive out of bounds
            if (pos.at(0) > arrLen)
                return '\0'
            #Check for negative out of bounds
            elsif ( pos.at(0)<(arrLen)*-1)
                return '\0'
            else  
                return oldArr(index)
            end
        #Handle singular index
        else 
            #Check for index out of bounds
            if index > self.length-1 or index < self.length*-1
                return '\0'
            else  
                return oldArr(index) 
            end
        end
        # return oldArr(index)
    end
    def map (seq="all")
        temp=[]
        #Check for no sequence; Print all
        if seq=="all"
            i=0;
            while i < self.length
                temp.append(yield(self.at(i)))
                i=i+1
            end
            return temp
        else 
            begin
                pos=seq.to_a
                s= pos.at(0)
                b= pos.at(pos.length-1)
                
                arrLen=self.length
                
                if(pos.length==0)
                    return temp
                end
                #Place in valid sequence  
                if s < arrLen*-1
                    s = 0
                end  
                if b > arrLen
                    b = arrLen
                end  
                for i in s..b
                    #Check to see if not out of bounds
                    if self[i]=='\0'
                        return temp
                    end
                    temp.append(yield(self.at(i)))
                end
                return temp  
            rescue Exception 
                raise TypeError.new
            end
        end
   end
end
