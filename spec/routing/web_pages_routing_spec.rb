require "spec_helper"

describe WebPagesController do
  describe "routing" do

    it "routes to #index" do
      get("/web_pages").should route_to("web_pages#index")
    end

    it "routes to #new" do
      get("/web_pages/new").should route_to("web_pages#new")
    end

    it "routes to #show" do
      get("/web_pages/1").should route_to("web_pages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/web_pages/1/edit").should route_to("web_pages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/web_pages").should route_to("web_pages#create")
    end

    it "routes to #update" do
      put("/web_pages/1").should route_to("web_pages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/web_pages/1").should route_to("web_pages#destroy", :id => "1")
    end

  end
end
