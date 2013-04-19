require "spec_helper"

describe VocabulariesController do
  describe "routing" do

    it "routes to #index" do
      get("/vocabularies").should route_to("vocabularies#index")
    end

    it "routes to #new" do
      get("/vocabularies/new").should route_to("vocabularies#new")
    end

    it "routes to #show" do
      get("/vocabularies/1").should route_to("vocabularies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vocabularies/1/edit").should route_to("vocabularies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vocabularies").should route_to("vocabularies#create")
    end

    it "routes to #update" do
      put("/vocabularies/1").should route_to("vocabularies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vocabularies/1").should route_to("vocabularies#destroy", :id => "1")
    end

  end
end
