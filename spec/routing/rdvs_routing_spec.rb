require "spec_helper"

describe RdvsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/rdvs" }.should route_to(:controller => "rdvs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/rdvs/new" }.should route_to(:controller => "rdvs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/rdvs/1" }.should route_to(:controller => "rdvs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/rdvs/1/edit" }.should route_to(:controller => "rdvs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/rdvs" }.should route_to(:controller => "rdvs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/rdvs/1" }.should route_to(:controller => "rdvs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/rdvs/1" }.should route_to(:controller => "rdvs", :action => "destroy", :id => "1")
    end

  end
end
