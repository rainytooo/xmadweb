require 'spec_helper'

describe "word_child_categories/edit" do
  before(:each) do
    @word_child_category = assign(:word_child_category, stub_model(WordChildCategory,
      :word_category_id => 1,
      :title => "MyString",
      :desc => "MyText"
    ))
  end

  it "renders the edit word_child_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => word_child_categories_path(@word_child_category), :method => "post" do
      assert_select "input#word_child_category_word_category_id", :name => "word_child_category[word_category_id]"
      assert_select "input#word_child_category_title", :name => "word_child_category[title]"
      assert_select "textarea#word_child_category_desc", :name => "word_child_category[desc]"
    end
  end
end
