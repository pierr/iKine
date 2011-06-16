require "spec_helper"

describe BilansController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/bilans" }.should route_to(:controller => "bilans", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/bilans/new" }.should route_to(:controller => "bilans", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/bilans/1" }.should route_to(:controller => "bilans", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/bilans/1/edit" }.should route_to(:controller => "bilans", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/bilans" }.should route_to(:controller => "bilans", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/bilans/1" }.should route_to(:controller => "bilans", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/bilans/1" }.should route_to(:controller => "bilans", :action => "destroy", :id => "1")
    end

  end
end
