require "spec_helper"

describe TagTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/tag_types").should route_to("tag_types#index")
    end

    it "routes to #new" do
      get("/tag_types/new").should route_to("tag_types#new")
    end

    it "routes to #show" do
      get("/tag_types/1").should route_to("tag_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tag_types/1/edit").should route_to("tag_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tag_types").should route_to("tag_types#create")
    end

    it "routes to #update" do
      put("/tag_types/1").should route_to("tag_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tag_types/1").should route_to("tag_types#destroy", :id => "1")
    end

  end
end
