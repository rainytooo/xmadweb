require "spec_helper"

describe VocabularyExamsController do
  describe "routing" do

    it "routes to #index" do
      get("/vocabulary_exams").should route_to("vocabulary_exams#index")
    end

    it "routes to #new" do
      get("/vocabulary_exams/new").should route_to("vocabulary_exams#new")
    end

    it "routes to #show" do
      get("/vocabulary_exams/1").should route_to("vocabulary_exams#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vocabulary_exams/1/edit").should route_to("vocabulary_exams#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vocabulary_exams").should route_to("vocabulary_exams#create")
    end

    it "routes to #update" do
      put("/vocabulary_exams/1").should route_to("vocabulary_exams#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vocabulary_exams/1").should route_to("vocabulary_exams#destroy", :id => "1")
    end

  end
end
