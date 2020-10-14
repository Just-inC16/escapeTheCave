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
        # puts @@adjToRoom[self.number][0]
        for i in 0...@@adjToRoom[self.number].length
            # puts @@adjToRoom[self.number].to_a[i]
            if @@adjToRoom[self.number].to_a[i].number == adjNeighbor
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
        puts @@adjToRoom[self.number]
        if @@adjToRoom[self.number]
            puts @@adjToRoom[self.number].to_a.sample 
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
    #Room numbering starts at 0-19; 
    #Each index contains a set of adj rooms 
    @@GeneralRooms=[]
    def initialize(caveStruct)
        @@GeneralRooms=caveStruct
    end 
    #Needs to become docecahedron structure
    def self.dodecahedron
        @allTempRooms=[]
        #Room 1 - 2,5,8
        @allTempRooms[0]=Set.new([2,5,8])
        #Room 2 - 1,3,10
        @allTempRooms[1]=Set.new([1,3,10])
        #Room 3 - 2,4,12
        @allTempRooms[2]=Set.new([2,4,12])
        #Room 4 - 3,5,14
        @allTempRooms[3]=Set.new([3,5,14])
        #Room 5 - 1,4,6
        @allTempRooms[4]=Set.new([1,4,6])
        #Room 6 - 5,7,15
        @allTempRooms[5]=Set.new([5,7,15])
        #Room 7 - 6,8,17
        @allTempRooms[6]=Set.new([6,8,17])
        #Room 8 - 1,7,11
        @allTempRooms[7]=Set.new([1,7,11])
        #Room 9 - 10,12,19
        @allTempRooms[8]=Set.new([10,12,19])
        #Room 10 - 2,9,11
        @allTempRooms[9]=Set.new([2,9,11])
        #Room 11 - 8,10,20
        @allTempRooms[10]=Set.new([8,10,20])
        #Room 12 - 3,9,13
        @allTempRooms[11]=Set.new([3,9,13])
        #Room 13 - 12,14,18
        @allTempRooms[12]=Set.new([12,14,18])
        #Room 14 - 4,13,15
        @allTempRooms[13]=Set.new([ 4,13,15])
        #Room 15 - 6,14,16
        @allTempRooms[14]=Set.new([6,14,16])
        #Room 16 - 15,17,18
        @allTempRooms[15]=Set.new([15,17,18])
        #Room 17 - 7,16,20
        @allTempRooms[16]=Set.new([7,16,20])
        #Room 18 - 13,16,19
        @allTempRooms[17]=Set.new([13,16,19])
        #Room 19 - 9,18,20
        @allTempRooms[18]=Set.new([9,18,20])
        #Room 20 - 11,17,19
        @allTempRooms[19]=Set.new([11,17,19])
        return Cave.new(@allTempRooms)
    end
    #i cave.room(i)
    def room(specificRoom)
        return specificRoom
    end 
    #Select room randomly 
    #https://ruby-doc.org/core-2.4.1/Array.html#method-i-sample
    def random_room
        puts  (0...20).sample

    end
    #Hazards can move to different rooms  
    def move(action, prevRoom, newRoom)
        puts "Fello"
    end
    #Add hazard  
    def add_hazard(hazard, room)
    end
    #Look for room based on hazard  
    def room_with(hazard)
        puts "Fello"
    end
    #A safe entrance is located 
    def entrance
        puts "Fello"
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
    #Enter a new room
    def enter(room)
    end   
    #Determine if the hazard is encountered  
    def explore_room
    end 
    #Perform an action 
    def act(action, room)
    end 
end
cave =Cave.dodecahedron
puts cave

# cave =Cave.entrance
# puts cave.random_room
# player= Player.new
# player.explore_room