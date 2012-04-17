require "spec_helper"

describe StudentTimelinesController do
  describe "routing" do

    it "routes to #index" do
      get("/student_timelines").should route_to("student_timelines#index")
    end

    it "routes to #new" do
      get("/student_timelines/new").should route_to("student_timelines#new")
    end

    it "routes to #show" do
      get("/student_timelines/1").should route_to("student_timelines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/student_timelines/1/edit").should route_to("student_timelines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/student_timelines").should route_to("student_timelines#create")
    end

    it "routes to #update" do
      put("/student_timelines/1").should route_to("student_timelines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/student_timelines/1").should route_to("student_timelines#destroy", :id => "1")
    end

  end
end
