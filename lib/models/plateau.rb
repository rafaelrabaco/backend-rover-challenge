class Plateau
    attr_reader :min_x, :min_y, :max_x, :max_y

    def initialize(max_x,max_y)
        @min_x = 0
        @min_y = 0
        @max_x = max_x.to_i
        @max_y = max_y.to_i

        validate
    end

    # Get plateau size
    def size
        "#{@max_x} #{@max_y}"
    end

    private 

    def validate
        raise "Plateau size is invalid." unless @max_x > 0 
        raise "Plateau size is invalid." unless @max_y > 0
    end
end