require 'spec_helper'
require_relative '../../lib/models/rover'
require_relative '../../lib/models/plateau'

describe "RoverTest" do

    let(:plateau) { Plateau.new(5,5) }

    it "Must set rover without problems" do
        rover = Rover.new(plateau, 1, 2, "N")
        expect(rover.directions).to eq '1 2 N'
    end

    it "Must get error if deploy zone is invalid." do
        expect { Rover.new(plateau, 6, 6, "N") }.to raise_error(RuntimeError, "Rover deploy zone is invalid.")
    end

    it "Must send command to rover without problems." do
        rover = Rover.new(plateau, 1, 2, "N")
        expect(rover.command("LRM")).to eq 'LRM'
        expect(rover.directions).to eq '1 3 N'

        rover = Rover.new(plateau, 1, 2, "S")
        expect(rover.command("LRM")).to eq 'LRM'
        expect(rover.directions).to eq '1 1 S'

        rover = Rover.new(plateau, 1, 2, "E")
        expect(rover.command("LRM")).to eq 'LRM'
        expect(rover.directions).to eq '2 2 E'

        rover = Rover.new(plateau, 1, 2, "W")
        expect(rover.command("LRM")).to eq 'LRM'
        expect(rover.directions).to eq '0 2 W'
    end
    
end