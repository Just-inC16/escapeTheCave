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
    #Getter for adjToRoom
    def self.adjToRoom
        @@adjToRoom
    end
    #Getter for hazardRoom
    def self.hazardRoom
        @@hazardRoom
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
        temp=Set.new([haze])
        #Nil arr = false
        if !@@hazardRoom[self.number]
            @@hazardRoom[self.number]=temp
        else
            
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
        hazardsInRoom.delete(haze)
        return 
    end
    def connectBiDirectional(curr , neighbor)
        # puts @@adjToRoom[neighbor.number ]
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
            @@adjToRoom[self.number].add(room) #room.number
            #Add connectivity to reciprocal list 
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
            # puts @@adjToRoom[self.number].to_a[extract].number
        end
        return extractNums
    end 
    #Neighboring rooms are selected at random 
    def random_neighbor
        # puts @@adjToRoom[self.number]
        if @@adjToRoom[self.number]
            # puts @@adjToRoom[self.number].to_a.sample 
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
    @@GeneralRooms
    @@ListOfRooms=[]
    def initialize(caveStruct)
        @@GeneralRooms=caveStruct
    end
    #Needs to become docecahedron structure
    def self.dodecahedron
        #Create a list of rooms
        room1= Room.new(1)
        room2= Room.new(2)
        room3= Room.new(3)
        room4= Room.new(4)
        room5= Room.new(5)
        room6= Room.new(6)
        room7= Room.new(7)
        room8= Room.new(8)
        room9= Room.new(9)
        room10= Room.new(10)
        room11= Room.new(11)
        room12= Room.new(12)
        room13= Room.new(13)
        room14= Room.new(14)
        room15= Room.new(15)
        room16= Room.new(16)
        room17= Room.new(17)
        room18= Room.new(18)
        room19= Room.new(19)
        room20= Room.new(20)

        #Attach all rooms to one array to be stored in one class variable
        @@ListOfRooms.append(room1)
        @@ListOfRooms.append(room2)
        @@ListOfRooms.append(room3)
        @@ListOfRooms.append(room4)
        @@ListOfRooms.append(room5)
        @@ListOfRooms.append(room6)
        @@ListOfRooms.append(room7)
        @@ListOfRooms.append(room8)
        @@ListOfRooms.append(room9)
        @@ListOfRooms.append(room10)
        @@ListOfRooms.append(room11)
        @@ListOfRooms.append(room12)
        @@ListOfRooms.append(room13)
        @@ListOfRooms.append(room14)
        @@ListOfRooms.append(room15)
        @@ListOfRooms.append(room16)
        @@ListOfRooms.append(room17)
        @@ListOfRooms.append(room18)
        @@ListOfRooms.append(room19)
        @@ListOfRooms.append(room20)

        #Add to rooms to Adj List 
        @adjToRoom = Room.adjToRoom
        #Room 1 - 2,5,8
        @adjToRoom[0]=Set.new([room2,room5,room8])
        #Room 2 - 1,3,10
        @adjToRoom[1]=Set.new([room1,room3,room10])
        #Room 3 - 2,4,12
        @adjToRoom[2]=Set.new([room2,room4,room12])
        #Room 4 - 3,5,14
        @adjToRoom[3]=Set.new([ room3,room5,room14])
        #Room 5 - 1,4,6
        @adjToRoom[4]=Set.new([room1,room4,room6])
        #Room 6 - 5,7,15
        @adjToRoom[5]=Set.new([room5,room7,room15])
        #Room 7 - 6,8,17
        @adjToRoom[6]=Set.new([room6,room8,room17])
        #Room 8 - 1,7,11
        @adjToRoom[7]=Set.new([room1,room7,room11])
        #Room 9 - 10,12,19
        @adjToRoom[8]=Set.new([room10,room12,room19])
        #Room 10 - 2,9,11
        @adjToRoom[9]=Set.new([room2,room9,room11])
        #Room 11 - 8,10,20
        @adjToRoom[10]=Set.new([room8,room10,room20])
        #Room 12 - 3,9,13
        @adjToRoom[11]=Set.new([room3,room9,room13])
        #Room 13 - 12,14,18
        @adjToRoom[12]=Set.new([room12,room14,room18])
        #Room 14 - 4,13,15
        @adjToRoom[13]=Set.new([ room4,room13,room15])
        #Room 15 - 6,14,16
        @adjToRoom[14]=Set.new([room6,room14,room16])
        #Room 16 - 15,17,18
        @adjToRoom[15]=Set.new([room15,room17,room18])
        #Room 17 - 7,16,20
        @adjToRoom[16]=Set.new([room7,room16,room20])
        #Room 18 - 13,16,19
        @adjToRoom[17]=Set.new([room13,room16,room19])
        #Room 19 - 9,18,20
        @adjToRoom[18]=Set.new([room9,room18,room20])
        #Room 20 - 11,17,19
        @adjToRoom[19]=Set.new([room11,room17,room19])
        return Cave.new(@adjToRoom)
    end

    #i cave.room(i)
    def room(specificRoom)
        return @@ListOfRooms[specificRoom]
    end 
    #Select room randomly 
    def random_room
        #Room numbers available 
        rooms= [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
        chosenOne = rooms.sample(1)[0]  #Sample converts into array
        return @@ListOfRooms[chosenOne]
        # puts "Choosen room: #{randomRoom}"
        
        # return randomRoom
    end
    #Hazards can move to different rooms  
    def move(action, currRoom, newRoom)
        #Find the class instance of currRoom
        findCurrentRoom=@@ListOfRooms[currRoom-1]
        # puts findCurrentRoom.number
        #Find the class instance of newRoom
        findNewRoom=@@ListOfRooms[newRoom-1]
        # puts findNewRoom.number
        hazardRoom=Room.hazardRoom[currRoom].to_a
        # puts hazardRoom
        findCurrentRoom.remove(action)
        # puts Room.hazardRoom[currRoom].to_a
        findNewRoom.add(action)
        # puts Room.hazardRoom[newRoom].to_a
        
    end
    #Add hazard  
    def add_hazard(hazard, room)
        #Access the array of hazards 
        # haz=Room.hazardRoom[room-1]
        #Find Room Object Reference 
        room = @@ListOfRooms[room-1]

        #Call Room.add(haze)
        room.add(hazard)
    end
    #Look for room based on hazard  
    def room_with(hazard)
        tempRooms= []
        for room in 0..20
            # if !Room.hazardRoom[room].nil?
            #     Room.hazardRoom[room].has?(hazard)
            # end
            if @@ListOfRooms[room].has?(hazard)
                tempRooms.append(room+1)
            end
        end
        return tempRooms
    end
    #A safe entrance is located using Room#safe?
    def entrance
        loop do
            randRoom=random_room
            Player.setCurrentRoom(randRoom)
            # testing = Player.new
            # puts testing.room.number
            return randRoom if randRoom.safe?
        end
        
    end 
end
class Player
    @@currentRoom=0
    # @@fromRoomAdjToRoom
    # @@fromRoomHazardRoom

    #Gettter for current number 
    def room
        return @@currentRoom
    end
    def self.setCurrentRoom(currRoom)
        @@currentRoom=currRoom
    end
    #Determine if the hazard exist 
    def sense(hazard)
        # room = Room.new(@@currentRoom)
        room=@@currentRoom
        # puts "Room #{room.number}"
        #Return the adj rooms 
        rooms = room.roomAdj.to_a
        
        #Check whether the current that the player is in 
        #have any hazards 
        if !room.has?(hazard)
            #Return false if there are no adj rooms
            if (rooms.nil?)
                return false 
            end
            #Check whether any of the adj ones have it 
            for chkAdjForH in 0...rooms.length
                # puts "Room #{rooms[chkAdjForH].number}"
               
                adjRoom=  rooms[chkAdjForH]
                # puts adjRoom 
                # puts adjRoom.class
                #Check the adj's room is nil
                if !adjRoom.nil?
                    if  adjRoom.has?(hazard)
                        # puts "Room #{rooms[chkAdjForH].number} is the winner"
                        return true
                    end 
                end
            end
        else
            return true
        end
        #Return if no room have it 
        return false 
    end
    def checkPlayerHazard(hazardRoom, hazard) 
        #Return T if encountered and F if not encountered  
        # puts hazardRoom.length
        for haz  in 0...hazardRoom.length
            if hazard == hazardRoom[haz]
                return true
            end 
        end 
        return false 
    end 

    #Determine if the hazard is encountered  
    def encounter(hazard)
        #Obtain the hazards in that room stored as Set 

        hazerooms = Room.hazardRoom[room.number-1]#.to_a
        # puts "up to this method"
        # puts hazerooms
        if !hazerooms
            return false 
        end
        #Check whether 'hazard' exist
        checkPlayerHazard(hazerooms, hazard)
    end

    #Enter a new room
    def enter(room) #room = Room.new(1)
        #Set the current room to the new current room
        @@currentRoom=room.number
    end   
    #Determine if the hazard is encountered  
    # def explore_room
    #     # Find adj rooms and hazards 
    #     @@fromRoomAdjToRoom=Room.adjToRoom
    #     @@fromRoomHazardRoom=Room.hazardRoom
    # end 
    
    #Player's action 
    def action(playerAction)
        case playerAction.to_s
            when "move" then puts 123
            when "shoot" then puts 456
            when "startle_guard" then puts 78
        end 
    end
    # Perform an action 
    def act(mSIAction, room)
        
    end 
end

# cave=Cave.dodecahedron
# cave.entrance
# player = Player.new
# puts player.encounter(:bats)