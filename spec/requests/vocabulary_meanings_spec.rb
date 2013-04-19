require 'spec_helper'

describe "VocabularyMeanings" do
  describe "GET /vocabulary_meanings" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get vocabulary_meanings_path
      response.status.should be(200)
    end
  end
end
