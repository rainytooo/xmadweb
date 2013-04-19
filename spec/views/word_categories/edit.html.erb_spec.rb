require 'spec_helper'

describe "word_categories/edit" do
  before(:each) do
    @word_category = assign(:word_category, stub_model(WordCategory,
      :title => "MyString",
      :desc => "MyText"
    ))
  end

  it "renders the edit word_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => word_categories_path(@word_category), :method => "post" do
      assert_select "input#word_category_title", :name => "word_category[title]"
      assert_select "textarea#word_category_desc", :name => "word_category[desc]"
    end
  end
end
