require 'spec_helper'

describe HomeController do

  describe "GET 'send_mail'" do
    it "returns http success" do
      get 'send_mail'
      response.should be_success
    end
  end

end
