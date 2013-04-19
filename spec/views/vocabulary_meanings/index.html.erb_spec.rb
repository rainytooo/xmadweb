require 'spec_helper'

describe "vocabulary_meanings/index" do
  before(:each) do
    assign(:vocabulary_meanings, [
      stub_model(VocabularyMeaning,
        :vocabulary_id => 1,
        :content => "MyText"
      ),
      stub_model(VocabularyMeaning,
        :vocabulary_id => 1,
        :content => "MyText"
      )
    ])
  end

  it "renders a list of vocabulary_meanings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
