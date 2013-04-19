require "spec_helper"

describe WordChildCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/word_child_categories").should route_to("word_child_categories#index")
    end

    it "routes to #new" do
      get("/word_child_categories/new").should route_to("word_child_categories#new")
    end

    it "routes to #show" do
      get("/word_child_categories/1").should route_to("word_child_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/word_child_categories/1/edit").should route_to("word_child_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/word_child_categories").should route_to("word_child_categories#create")
    end

    it "routes to #update" do
      put("/word_child_categories/1").should route_to("word_child_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/word_child_categories/1").should route_to("word_child_categories#destroy", :id => "1")
    end

  end
end
