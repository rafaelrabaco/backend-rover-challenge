class Rover
    # (Anticlockwise) <-  |  -> (Clockwise)
    #                     N
    #                   W   E
    #                     S
    
    DIRECTIONS = ["N","E","S","W"].freeze

    def initialize(plateau, coord_x, coord_y, direction)
        @plateau = plateau
        @current_coord_x = coord_x.to_i
        @current_coord_y = coord_y.to_i
        @current_direction = direction

        validate
    end

    # Send movement command
    def command(commands)
        commands.each_char do |direction|
            case direction
                when 'L' then move_left
                when 'R' then move_right
                when 'M' then move_forward
            end
        end
        return commands
    end

    # Rotate the rover to the left (Anticlockwise)
    def move_left
        index = DIRECTIONS.index(@current_direction).method('-').call(1) % DIRECTIONS.length
        @current_direction = DIRECTIONS[index]
    end

    # Rotate the rover to the right (Clokwise)
    def move_right
        index = DIRECTIONS.index(@current_direction).method('+').call(1) % DIRECTIONS.length 
        @current_direction = DIRECTIONS[index]
    end

    # Move the rover forward according to your direction
    def move_forward
        case @current_direction
            when 'N' # North ↑
                if (@current_coord_y < @plateau.max_y) then
                    @current_coord_y += 1
                end
            when 'S' # South ↓
                if (@current_coord_y > @plateau.min_y) then
                    @current_coord_y -= 1
                end
            when 'E' # East →
                if (@current_coord_x < @plateau.max_x) then
                    @current_coord_x += 1
                end
            when 'W' # West ←
                if (@current_coord_x > @plateau.min_x) then
                    @current_coord_x -= 1
                end
        end
    end

    # Get final coordinates
    def directions
        "#{@current_coord_x} #{@current_coord_y} #{@current_direction}"
    end

    private 

    def validate
        raise "Rover deploy zone is invalid." unless @current_coord_x < @plateau.max_x
        raise "Rover deploy zone is invalid." unless @current_coord_y < @plateau.max_y
    end
end