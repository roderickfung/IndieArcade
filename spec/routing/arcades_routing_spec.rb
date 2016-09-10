require "rails_helper"

RSpec.describe ArcadesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/arcades").to route_to("arcades#index")
    end

    it "routes to #new" do
      expect(:get => "/arcades/new").to route_to("arcades#new")
    end

    it "routes to #show" do
      expect(:get => "/arcades/1").to route_to("arcades#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/arcades/1/edit").to route_to("arcades#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/arcades").to route_to("arcades#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/arcades/1").to route_to("arcades#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/arcades/1").to route_to("arcades#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/arcades/1").to route_to("arcades#destroy", :id => "1")
    end

  end
end
