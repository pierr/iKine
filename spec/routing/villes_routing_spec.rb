require "spec_helper"

describe VillesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/villes" }.should route_to(:controller => "villes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/villes/new" }.should route_to(:controller => "villes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/villes/1" }.should route_to(:controller => "villes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/villes/1/edit" }.should route_to(:controller => "villes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/villes" }.should route_to(:controller => "villes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/villes/1" }.should route_to(:controller => "villes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/villes/1" }.should route_to(:controller => "villes", :action => "destroy", :id => "1")
    end

  end
end
