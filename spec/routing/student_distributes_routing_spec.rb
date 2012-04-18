require "spec_helper"

describe StudentDistributesController do
  describe "routing" do

    it "routes to #index" do
      get("/student_distributes").should route_to("student_distributes#index")
    end

    it "routes to #new" do
      get("/student_distributes/new").should route_to("student_distributes#new")
    end

    it "routes to #show" do
      get("/student_distributes/1").should route_to("student_distributes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/student_distributes/1/edit").should route_to("student_distributes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/student_distributes").should route_to("student_distributes#create")
    end

    it "routes to #update" do
      put("/student_distributes/1").should route_to("student_distributes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/student_distributes/1").should route_to("student_distributes#destroy", :id => "1")
    end

  end
end
