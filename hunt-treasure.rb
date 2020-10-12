require "set"
class Room
    @@adjToRoom= []   #Determine if room i is adj to which other rooms
    @@hazardRoom= []  #Determine if room i has hazards 
    # Iniitialize method
    def initialize(roomNum)
        @roomNum=roomNum  
    end

    #Getter for number 
    def number
        return @roomNum
    end

    #Get the adjacency rooms for that room
    def roomAdj
        return @@adjToRoom[self.number]
    end
    #Get the collection of all room sets
    def allRoomSet
        puts @@adjToRoom[self.number]
        puts @@adjToRoom[11]
        puts @@adjToRoom[3]
        puts @@adjToRoom[7]
    end
    #Get the hazards for that room
    def hazardRoom
        return @@hazardRoom[self.number]
    end

    #Determine if empty 
    def empty?
        #Nil arr = false
        if !@@hazardRoom[self.number]
            return true
        end
        return false 
    end 

    #Add hazards into a room
    def add(haze)
        temp=Set.new([haze])
        #Nil arr = false
        if !@@hazardRoom[self.number]
            @@hazardRoom[self.number]=temp
        else
            #Check whether haze exist
            i=0 
            while (i < @@hazardRoom[self.number].length)
                if( @@hazardRoom[self.number].to_a[i]==haze)
                    return 
                end
                i+=1
            end
            @@hazardRoom[self.number].add(haze)
        end
        #puts @@hazardRoom[self.number]
    end

    #Determine if a hazard exist in a room
    def has?(haze)
        hazardsInRoom= @@hazardRoom[self.number]
        #Return if hazard list is empty 
        if !hazardsInRoom
            return false 
        end
        # i=0
        # while i < hazardsInRoom.length
        #     if(hazardsInRoom[i]==haze )
        #         return true
        #     end
        #     i=i+1
        # end
       # puts @@hazardRoom[self.number]
        if @@hazardRoom[self.number].include?(haze)
            return true
        end
        return false
    end
    #Rm the hazard from room
    def remove(haze)
        hazardsInRoom= @@hazardRoom[self.number]
        #Return if hazard list is empty 
        if !hazardsInRoom
            return  
        end
        # i=0
        # while i < hazardsInRoom.length
        #     if(hazardsInRoom[i]==haze )
        #         hazardsInRoom.delete(hazardsInRoom[i])
        #         return
        #     end
        #     i=i+1
        # end
        hazardsInRoom.delete(haze)
        return 
    end
    def connectBiDirectional(curr , neighbor)
        puts @@adjToRoom[neighbor.number ]
        if !@@adjToRoom[neighbor.number ]
            @@adjToRoom[neighbor.number ]= Set.new([curr])
        else 
            @@adjToRoom[neighbor.number ].add(curr)
        end
    end 
    #Given the room, connect the  room
    def connect(room)
        temp=Set.new([room])#room.number
        #Nil arr = false
        if !@@adjToRoom[self.number]
            @@adjToRoom[self.number]=temp
            #Add connectivity to reciprocal  list 
            connectBiDirectional(self,room)
        else
            #Check whether room already connected
            # i=0 
            # while (i < @@adjToRoom[self.number].length)
            #     if( @@adjToRoom[self.number][i]==room.number)
            #         return 
            #     end
            #     i+=1
            # end
            @@adjToRoom[self.number].add(room) #room.number
            #Add connectivity to reciprocal  list 
            connectBiDirectional(self,room)
        end
        # @@adjToRoom[self.number].each {|x| puts x.number}
    end
    #bi-directional connections 
    def neighbor(adjNeighbor)
        # puts adjNeighbor
        # puts "Hello"
        # puts @@adjToRoom[self.number]
        # puts "Bye"
        # puts @@adjToRoom[self.number][0]
        for i in 0...@@adjToRoom[self.number].length
            # puts @@adjToRoom[self.number].to_a[i]
            if @@adjToRoom[self.number].to_a[i].number ==adjNeighbor
                return @@adjToRoom[self.number].to_a[i]
            end
        end
    end 
    #Understands the exit number 
    def exits
        extractNums= []
        for extract in 0...@@adjToRoom[self.number].length
            extractNums.append(@@adjToRoom[self.number].to_a[extract].number)
            puts @@adjToRoom[self.number].to_a[extract].number
        end
        return extractNums
    end 
    #Neighboring rooms are selected at random 
    def random_neighbor
        if @@adjToRoom[self.number]
            return @@adjToRoom[self.number].to_a.sample 
        end 
    end
    #Safe if current and adjacent rooms are safe
    def safe?
        #Check the current room first 
        if !@@hazardRoom[self.number]
            #Check adj rooms; nil if empty 
            adj=@@adjToRoom[self.number] 
            #Check not nil
            if adj
                for i in 0...adj.length
                    #Return false if hazards exist inside
                    if  @@hazardRoom[adj.to_a[i].number]
                        return false
                    end
                end 
            end
        else 
            return false
        end
        
        return true
    end

    
end

class Cave
    @@GeneralRooms= []
    #Needs to become docecahedron structure
    def initialize(strut)
    end
    #i cave.room(i)
    def room(specificRoom)
    end 
    #Select room randomly 
    #https://ruby-doc.org/core-2.4.1/Array.html#method-i-sample
    def random_room
    end
    #Hazards can move to different rooms  
    def move(action, prevRoom, newRoom)
    end
    #Add hazard  
    def move(hazard, room)
    end
    #Look for room based on hazard  
    def room_with(hazard)
    end
    #A safe entrance is located 
    def room_with(hazard)
    end 
end


class Player
    #Determine if the hazard exist 
    def sense(hazard)
    end
    #Determine if the hazard is encountered  
    def encounter(hazard)
    end
    #Player's action 
    def action(playerAction)
    end
    #Determine if the hazard is encountered  
    def enter(room)
    end   
    def explore_room
    end 
    def act(action, room)
    end 
end

room =Room.new(12)
puts room.number ==12 

puts room.empty?
room.add(:guard)
room.add(:bats)
puts room.empty?
puts room.has?(:guard) 
puts room.has?(:wall)
room.remove(:bats)
puts room.has?(:bats)

exit_numbers = [11, 3, 7]
exit_numbers.each { |i|
    room.connect(Room.new(i))
}
puts room.allRoomSet
# exit_numbers.each { |i|

#     room.neighbor(i).number == i
# room.neighbor(i).neighbor(room.number) == room
# }
puts "hello"
x=room.exits 
puts x
puts x == exit_numbers
puts exit_numbers.include?(room.random_neighbor.number)
room.add(:guard)
puts room.safe?
room
.random_neighbor
.add(:bats)

room.safe?
room = Room.new(9)
room.safe? 