require 'spec_helper'
require_relative '../lib/app'
require_relative '../lib/models/rover'
require_relative '../lib/models/plateau'

describe "AppTest" do
    it "Should run the application without problems" do
        app = App.new.run
        puts app
        expect(app).to eq ["1 3 N", "5 1 E"]
    end
end