require "spec_helper"

describe CourseContentsController do
  describe "routing" do

    it "routes to #index" do
      get("/course_contents").should route_to("course_contents#index")
    end

    it "routes to #new" do
      get("/course_contents/new").should route_to("course_contents#new")
    end

    it "routes to #show" do
      get("/course_contents/1").should route_to("course_contents#show", :id => "1")
    end

    it "routes to #edit" do
      get("/course_contents/1/edit").should route_to("course_contents#edit", :id => "1")
    end

    it "routes to #create" do
      post("/course_contents").should route_to("course_contents#create")
    end

    it "routes to #update" do
      put("/course_contents/1").should route_to("course_contents#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/course_contents/1").should route_to("course_contents#destroy", :id => "1")
    end

  end
end
