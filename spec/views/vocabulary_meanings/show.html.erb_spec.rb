require 'spec_helper'

describe "vocabulary_meanings/show" do
  before(:each) do
    @vocabulary_meaning = assign(:vocabulary_meaning, stub_model(VocabularyMeaning,
      :vocabulary_id => 1,
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
