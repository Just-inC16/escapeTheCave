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
        return @@adjToRoom[self.number-1]
    end
    
    #Get the hazards for that room
    def hazardRoom
        return @@hazardRoom[self.number-1]
    end
    # def self.hazardInRoom
    #     return @@hazardRoom[self.number-1]
    # end
    # Check whether room i is hazard free
    def empty?
        #Check whether any hazard exist
        if !hazardRoom
            return true
        end
        return false 
    end 

    #Add hazard to room
    def add(haze)
        temp=Set.new([haze])
        #Check whether any hazard exist ==> Assign a new set 
        if !hazardRoom
            hazardRoom=temp
        else
            hazardRoom.add(haze)
        end
    end

    #Determine if a hazard exist in a room
    def has?(haze)
        #Return F if hazard list is empty 
        if !hazardRoom
            return false 
        end
        if hazardRoom.include?(haze)
            return true
        end
        return false
    end
    #Remove hazard from room 
    def remove(haze)
        #Return if hazard list is empty 
        if !hazardRoom
            return  
        end
        hazardRoom.delete(haze)
    end
    def connectBiDirectional(roomInstance , adj)
        adjNeighbor= @@adjToRoom[adj.number ]
        if !adjNeighbor
            adjNeighbor= Set.new([roomInstance])
        else 
            adjNeighbor.add(roomInstance)
        end
    end 
    #Given the room, connect the  room
    def connect(room)
        temp=Set.new([room])
        #Nil arr = false
        if !roomAdj 
            roomAdj=temp
            #Add bidirectionality
            connectBiDirectional(self,room)
        else  
            roomAdj.add(room) 
            #Add bidirectionality
            connectBiDirectional(self,room)
        end
    end
    # Check that self.room and room are neighbors based on #s
    def neighbor(adjNeighbor)
        #Obtain array of room adjacencies 
        
        for i in 0...roomAdj.length
            roomAdjList= roomAdj.to_a[i]
            #Check mathcing numbers 
            if roomAdjList.number == adjNeighbor
                return roomAdjList
            end
        end
    end 
    #Room i knows how to navigate to other rooms
    def exits
        extractNums= []
        for eIndex in 0...roomAdj.length
            extractNums.append(roomAdj.to_a[eIndex].number)
        end
        return extractNums
    end 
    #Neighboring rooms are selected at random 
    def random_neighbor
        if roomAdj
            # Choose neighboring adjacent room
            return roomAdj.to_a.sample 
        end 
    end
    #Safe if current and adjacent rooms are safe
    def safe?
        #Check the curr room hazard free 
        if !hazardRoom
            #Check that it has rooms
            if roomAdj
                for i in 0...roomAdj.length
                    #Return false if hazards exist inside
                    adjRoomNumber=roomAdj.to_a[i].number-1
                    if  @@hazardRoom[adjRoomNumber]
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
    #Index i (0-19) contains a cave structure
    @@GeneralStructure=[]
    #Contain index i (0-19) INSTANCES
    @@ListOfRooms=[]
    def initialize(caveStruct)
        @@GeneralStructure=caveStruct
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
        @@adjToRoom = Room.adjToRoom
        #Room 1 - 2,5,8
        @@adjToRoom[0]=Set.new([room2,room5,room8])
        #Room 2 - 1,3,10
        @@adjToRoom[1]=Set.new([room1,room3,room10])
        #Room 3 - 2,4,12
        @@adjToRoom[2]=Set.new([room2,room4,room12])
        #Room 4 - 3,5,14
        @@adjToRoom[3]=Set.new([ room3,room5,room14])
        #Room 5 - 1,4,6
        @@adjToRoom[4]=Set.new([room1,room4,room6])
        #Room 6 - 5,7,15
        @@adjToRoom[5]=Set.new([room5,room7,room15])
        #Room 7 - 6,8,17
        @@adjToRoom[6]=Set.new([room6,room8,room17])
        #Room 8 - 1,7,11
        @@adjToRoom[7]=Set.new([room1,room7,room11])
        #Room 9 - 10,12,19
        @@adjToRoom[8]=Set.new([room10,room12,room19])
        #Room 10 - 2,9,11
        @@adjToRoom[9]=Set.new([room2,room9,room11])
        #Room 11 - 8,10,20
        @@adjToRoom[10]=Set.new([room8,room10,room20])
        #Room 12 - 3,9,13
        @@adjToRoom[11]=Set.new([room3,room9,room13])
        #Room 13 - 12,14,18
        @@adjToRoom[12]=Set.new([room12,room14,room18])
        #Room 14 - 4,13,15
        @@adjToRoom[13]=Set.new([ room4,room13,room15])
        #Room 15 - 6,14,16
        @@adjToRoom[14]=Set.new([room6,room14,room16])
        #Room 16 - 15,17,18
        @@adjToRoom[15]=Set.new([room15,room17,room18])
        #Room 17 - 7,16,20
        @@adjToRoom[16]=Set.new([room7,room16,room20])
        #Room 18 - 13,16,19
        @@adjToRoom[17]=Set.new([room13,room16,room19])
        #Room 19 - 9,18,20
        @@adjToRoom[18]=Set.new([room9,room18,room20])
        #Room 20 - 11,17,19
        @@adjToRoom[19]=Set.new([room11,room17,room19])
        return Cave.new(@@adjToRoom)
    end
    #Return instance of room
    def self.roomInstance(specificRoom)
        return @@ListOfRooms[specificRoom]
    end 
    def roomInstance2(specificRoom)
        return @@ListOfRooms[specificRoom]
    end 
    def self.tempInstances
        return @@ListOfRooms
    end 
    #Select room randomly 
    def random_room
        #Room numbers available 
        rooms= [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
        #Obtain sample from 0 index
        chosenOne = rooms.sample(1)[0]  
        return roomInstance2(chosenOne)
    end
    #Remove action from curr and add to new
    def self.move(action, currRoom, newRoom)
        aCurRoomPos=currRoom-1
        aCurRoomPos=newRoom-1
        #Find the class instance of currRoom
        findCurrentRoom=roomInstance2(aCurRoomPos)
        #Find the class instance of newRoom
        findNewRoom=roomInstance2(aCurRoomPos)

        findCurrentRoom.remove(action)
        findNewRoom.add(action)
         
    end
    # Add hazard to room 
    def add_hazard(hazard, room)
        actualRoomIndex= room-1 
        #Find Room Instance
        roomToBeAdded = roomInstance2(actualRoomIndex)
        #Call Room.add(haze)
        roomToBeAdded.add(hazard)
    end
    #Look for room based on hazard  
    def room_with(hazard)
        roomHazard= []
        for room in 0...20
            checkRoom= roomInstance2(room)
            if checkRoom.has?(hazard)
                #Add instances to array
                roomHazard.append(checkRoom)
            end
        end
        return roomHazard
    end
    # Choose safe room 
    def entrance
        loop do
            #Obtain a random room number
            randRoom=random_room
            if randRoom.safe?
                #Set randRoom to Player's starting room
                # puts "Justin chan #{randRoom.number}"
                Player.setCurrentRoom(randRoom.number) 
                return randRoom
            end
        end
    end 
end
class Player
    @@currentRoom=0
    #Getter for current number 
    def room
        puts @@currentRoom
        # puts @@currentRoom #This is a room
        return Cave.roomInstance(@@currentRoom)
    end
    #Setter for current number 
    def setCurrRoomNumber(newRoom)
        #puts "Inside Set #{newRoom}"
        @@currentRoom=newRoom
    end
    def self.setCurrentRoom(currRoom)
      #  puts "Outside Set #{currRoom}"
        @@currentRoom=currRoom
    end
    
    #Determine if the hazard exist 
    def sense(hazard)
        #Return the adj rooms 
        rooms = room.roomAdj.to_a
        #Check current room for hazards 
        if !room.has?(hazard)
            #Return T if array exist;otherwise false
            if !(rooms.nil?)
                #Check whether any of the adj ones have it 
                rooms.each {|adjRoom|
                    # roomAdj= rooms[adjRoom]
                    if !adjRoom.nil? and adjRoom.has?(hazard)
                        return true
                    end 
                }
            else
                return false 
            end
        else
            return true
        end
        #Return if no room have it 
        return false 
    end
    #Return T if encountered and F if not encountered 
    def checkPlayerHazard(hazardRoom, hazard) 
        for haze  in 0...hazardRoom.length
            if hazard == hazardRoom[haze]
                return true
            end 
        end 
        return false 
    end 
    #Hazard encountered? 
    def encounter(hazard)
        #Obtain the hazards in that room stored as Set 
        hazerooms = room.hazardRoom
        #No hazards in Room
        if !hazerooms
            return false 
        end
        #Check whether 'hazard' exist
        checkPlayerHazard(hazerooms, hazard)
    end
    #Enter a new room instance 
    def enter(room) 
        #Set the current room to the new current room
        setCurrRoomNumber(room.number)
    end   
    #Does hazard exist nearby?
    def explore_room
        sense(:bats)
        sense(:guards)
        sense(:pits)
    end 
    def move(room)
        setCurrRoomNumber(room)
    end 
    def shoot (room)
        puts "Printing Nil here 4"
        if Cave.roomInstance(room).has?(:guard)
            return true
        else 
            return false 
        end
    end 
    def startle_guard(adjGuardToRoom)
        puts adjGuardToRoom.class
        #1= Stay; 2 = Move 
        options= [1,2]
        choice = options.sample(1)[0]  
        if choice == 2 
            chosenRoom = adjRooms.sample(1)[0] 
            Cave.move(:move, adjGuardToRoom, Cave.roomInstance(chosenRoom))
        end 
    end
    #Player's action 
    def action(playerAction)
        if (playerAction.to_s=="move" or playerAction.to_s=="shoot" or playerAction.to_s=="startle_guard" )
            return true
        end
        return false 
    end 
    # Perform an action 
    def act(action, room)
        case action.to_s
            when "move" then return move(room)
            when "shoot" then return shoot(room)	
            when "startle_guard" then return startle_guard(room)
        end
    end 
end