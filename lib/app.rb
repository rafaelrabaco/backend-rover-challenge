require_relative './models/plateau.rb' 
require_relative './models/rover.rb' 

class App
    def initialize
        plateau = File.readlines("data/plateau.txt")[0].split
        @plateau = Plateau.new(plateau[0],plateau[1])
    end

    def run
        puts @plateau.size # Show Plateau size

        rover_one = set_rover("data/rover1.txt")
        puts rover_one.directions # Show rover one initial directions
        puts send_command_to_rover("data/rover1.txt", rover_one)

        rover_two = set_rover("data/rover2.txt")
        puts rover_two.directions # Show rover two initial directions
        puts send_command_to_rover("data/rover2.txt", rover_two)

        puts "------"

        # Return rover final directions
        return [rover_one.directions, rover_two.directions]
    end

    def set_rover(input)
        rover_input = File.readlines(input)
        rover_deploy = rover_input[0].split
        rover =  Rover.new(@plateau, rover_deploy[0],rover_deploy[1], rover_deploy[2])
        return rover
    end

    def send_command_to_rover(input, rover)
        rover_input = File.readlines(input)
        return rover.command(rover_input[1])
    end
end
