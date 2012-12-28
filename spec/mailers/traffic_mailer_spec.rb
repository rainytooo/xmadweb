require "spec_helper"

describe TrafficMailer do
  describe "send_traffic" do
    let(:mail) { TrafficMailer.send_traffic }

    it "renders the headers" do
      mail.subject.should eq("Send traffic")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
