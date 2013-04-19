require 'spec_helper'

describe "word_child_categories/show" do
  before(:each) do
    @word_child_category = assign(:word_child_category, stub_model(WordChildCategory,
      :word_category_id => 1,
      :title => "Title",
      :desc => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
