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
        temp=[haze]
        #Nil arr = false
        if !@@hazardRoom[self.number]
            @@hazardRoom[self.number]=temp
        else
            #Check whether haze exist
            i=0 
            while (i < @@hazardRoom[self.number].length)
                if( @@hazardRoom[self.number][i]==haze)
                    return 
                end
                i+=1
            end
            @@hazardRoom[self.number].append(haze)
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
        i=0
        while i < hazardsInRoom.length
            if(hazardsInRoom[i]==haze )
                return true
            end
            i=i+1
        end
        return false
    end
    #Rm the hazard from room
    def remove(haze)
        hazardsInRoom= @@hazardRoom[self.number]
        #Return if hazard list is empty 
        if !hazardsInRoom
            return false 
        end
        i=0
        while i < hazardsInRoom.length
            if(hazardsInRoom[i]==haze )
                hazardsInRoom.delete(hazardsInRoom[i])
                return
            end
            i=i+1
        end
        return 
    end
    #Given the room, connect the  room
    def connect(room)
        temp=[room] #room.number
        #Nil arr = false
        if !@@adjToRoom[self.number]
            @@adjToRoom[self.number]=temp
            #Add connectivity to reciprocal  list 
            if !@@adjToRoom[room]
                @@adjToRoom[room]= [self.number]
            else 
                @@adjToRoom[room].append(self.number)
            end
        else
            #Check whether room already connected
            i=0 
            while (i < @@adjToRoom[self.number].length)
                if( @@adjToRoom[self.number][i]==room.number)
                    return 
                end
                i+=1
            end
            @@adjToRoom[self.number].append(room) #room.number
            #Add connectivity to reciprocal  list 
            if !@@adjToRoom[room]
                @@adjToRoom[room]= [self.number]
            else 
                @@adjToRoom[room].append(self.number)
            end
        end
        # for i in 0...3
        #     puts @@adjToRoom[self.number][i]
        # end
    
    end
    #bi-directional connections 
    def neighbor(adjNeighbor)
        # puts adjNeighbor
        # puts "Hello"
        # puts @@adjToRoom[self.number]
        # puts "Bye"
        # puts @@adjToRoom[self.number][0]
        for i in 0...@@adjToRoom[self.number]
            puts @@adjToRoom[self.number][i]
            if @@adjToRoom[self.number][i].number ==adjNeighbor
                return @@adjToRoom[self.number][i]
            end
        end
    end 
    #Understands the exit number 
    def exits
        extractNums= []
        for extract in 0...@@adjToRoom[self.number].length
            extractNums.append(@@adjToRoom[self.number][extract].number)
            puts @@adjToRoom[self.number][extract].number
        end
        return extractNums
    end 
    #Neighboring rooms are selected at random 
    def random_neighbor

    end
    #Safe if current and adjacent rooms are safe
    def safe?
        #Check the current room first 
        if !@@hazardRoom[self.number]
            #Check adj rooms
            adj=@@adjToRoom[self.number] 
            #Check not nil
            if adj
                for i in 0...adj.length
                    #Return false if items exist inside
                    if  @@hazardRoom[adj[i].number]
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
#puts room.number ==12 
# puts room.empty?
# room.add(:guard)
# room.add(:bats)
# puts room.empty?
# puts room.has?(:guard) 
# puts room.has?(:wall)
# room.remove(:bats)
# puts room.has?(:bats)
# exit_numbers = [11, 3, 7]

# exit_numbers.each { |i|
#     room.connect(Room.new(i))
# }
# exit_numbers.each { |i|

#     room.neighbor(i).number == i
# room.neighbor(i).neighbor(room.number) == room
}
#puts room.exits == exit_numbers
#exit_numbers.include?(room.random_neighbor.number)
# room.add(:guard)
# puts room.safe?