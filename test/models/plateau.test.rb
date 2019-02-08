require 'spec_helper'
require_relative '../../lib/models/plateau'

describe "PlateauTest" do
    it "Must set the plateau without problems" do
        plateau = Plateau.new(5,5)
        expect(plateau.size).to eq '5 5'
    end

    it "Must get error if plateau size is invalid." do
        expect { Plateau.new(0,0) }.to raise_error(RuntimeError, "Plateau size is invalid.")
    end
end