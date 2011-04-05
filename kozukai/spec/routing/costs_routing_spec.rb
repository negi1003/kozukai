require "spec_helper"

describe CostsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/costs" }.should route_to(:controller => "costs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/costs/new" }.should route_to(:controller => "costs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/costs/1" }.should route_to(:controller => "costs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/costs/1/edit" }.should route_to(:controller => "costs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/costs" }.should route_to(:controller => "costs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/costs/1" }.should route_to(:controller => "costs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/costs/1" }.should route_to(:controller => "costs", :action => "destroy", :id => "1")
    end

  end
end
