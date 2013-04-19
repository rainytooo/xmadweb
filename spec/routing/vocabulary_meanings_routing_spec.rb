require "spec_helper"

describe VocabularyMeaningsController do
  describe "routing" do

    it "routes to #index" do
      get("/vocabulary_meanings").should route_to("vocabulary_meanings#index")
    end

    it "routes to #new" do
      get("/vocabulary_meanings/new").should route_to("vocabulary_meanings#new")
    end

    it "routes to #show" do
      get("/vocabulary_meanings/1").should route_to("vocabulary_meanings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vocabulary_meanings/1/edit").should route_to("vocabulary_meanings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vocabulary_meanings").should route_to("vocabulary_meanings#create")
    end

    it "routes to #update" do
      put("/vocabulary_meanings/1").should route_to("vocabulary_meanings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vocabulary_meanings/1").should route_to("vocabulary_meanings#destroy", :id => "1")
    end

  end
end
