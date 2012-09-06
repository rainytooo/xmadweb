require "spec_helper"

describe TagCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/tag_categories").should route_to("tag_categories#index")
    end

    it "routes to #new" do
      get("/tag_categories/new").should route_to("tag_categories#new")
    end

    it "routes to #show" do
      get("/tag_categories/1").should route_to("tag_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tag_categories/1/edit").should route_to("tag_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tag_categories").should route_to("tag_categories#create")
    end

    it "routes to #update" do
      put("/tag_categories/1").should route_to("tag_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tag_categories/1").should route_to("tag_categories#destroy", :id => "1")
    end

  end
end
