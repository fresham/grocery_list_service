require "rails_helper"

RSpec.describe GroceryItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/grocery_items").to route_to("grocery_items#index")
    end


    it "routes to #show" do
      expect(:get => "/grocery_items/1").to route_to("grocery_items#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/grocery_items").to route_to("grocery_items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/grocery_items/1").to route_to("grocery_items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/grocery_items/1").to route_to("grocery_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/grocery_items/1").to route_to("grocery_items#destroy", :id => "1")
    end

  end
end
