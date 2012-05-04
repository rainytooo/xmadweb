require "spec_helper"

describe DairyPlansController do
  describe "routing" do

    it "routes to #index" do
      get("/dairy_plans").should route_to("dairy_plans#index")
    end

    it "routes to #new" do
      get("/dairy_plans/new").should route_to("dairy_plans#new")
    end

    it "routes to #show" do
      get("/dairy_plans/1").should route_to("dairy_plans#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dairy_plans/1/edit").should route_to("dairy_plans#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dairy_plans").should route_to("dairy_plans#create")
    end

    it "routes to #update" do
      put("/dairy_plans/1").should route_to("dairy_plans#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dairy_plans/1").should route_to("dairy_plans#destroy", :id => "1")
    end

  end
end
