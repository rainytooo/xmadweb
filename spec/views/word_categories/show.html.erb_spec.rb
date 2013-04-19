require 'spec_helper'

describe "word_categories/show" do
  before(:each) do
    @word_category = assign(:word_category, stub_model(WordCategory,
      :title => "Title",
      :desc => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
