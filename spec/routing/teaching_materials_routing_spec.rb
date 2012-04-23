require "spec_helper"

describe TeachingMaterialsController do
  describe "routing" do

    it "routes to #index" do
      get("/teaching_materials").should route_to("teaching_materials#index")
    end

    it "routes to #new" do
      get("/teaching_materials/new").should route_to("teaching_materials#new")
    end

    it "routes to #show" do
      get("/teaching_materials/1").should route_to("teaching_materials#show", :id => "1")
    end

    it "routes to #edit" do
      get("/teaching_materials/1/edit").should route_to("teaching_materials#edit", :id => "1")
    end

    it "routes to #create" do
      post("/teaching_materials").should route_to("teaching_materials#create")
    end

    it "routes to #update" do
      put("/teaching_materials/1").should route_to("teaching_materials#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/teaching_materials/1").should route_to("teaching_materials#destroy", :id => "1")
    end

  end
end
