require 'spec_helper'

describe "Villes" do
  describe "GET /villes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get villes_path
      response.status.should be(200)
    end
  end
end
