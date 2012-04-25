require "spec_helper"

describe TeachingProblemsController do
  describe "routing" do

    it "routes to #index" do
      get("/teaching_problems").should route_to("teaching_problems#index")
    end

    it "routes to #new" do
      get("/teaching_problems/new").should route_to("teaching_problems#new")
    end

    it "routes to #show" do
      get("/teaching_problems/1").should route_to("teaching_problems#show", :id => "1")
    end

    it "routes to #edit" do
      get("/teaching_problems/1/edit").should route_to("teaching_problems#edit", :id => "1")
    end

    it "routes to #create" do
      post("/teaching_problems").should route_to("teaching_problems#create")
    end

    it "routes to #update" do
      put("/teaching_problems/1").should route_to("teaching_problems#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/teaching_problems/1").should route_to("teaching_problems#destroy", :id => "1")
    end

  end
end
