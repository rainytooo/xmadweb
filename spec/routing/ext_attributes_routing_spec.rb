require "spec_helper"

describe ExtAttributesController do
  describe "routing" do

    it "routes to #index" do
      get("/ext_attributes").should route_to("ext_attributes#index")
    end

    it "routes to #new" do
      get("/ext_attributes/new").should route_to("ext_attributes#new")
    end

    it "routes to #show" do
      get("/ext_attributes/1").should route_to("ext_attributes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ext_attributes/1/edit").should route_to("ext_attributes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ext_attributes").should route_to("ext_attributes#create")
    end

    it "routes to #update" do
      put("/ext_attributes/1").should route_to("ext_attributes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ext_attributes/1").should route_to("ext_attributes#destroy", :id => "1")
    end

  end
end
