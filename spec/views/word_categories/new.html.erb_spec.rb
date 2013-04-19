require 'spec_helper'

describe "word_categories/new" do
  before(:each) do
    assign(:word_category, stub_model(WordCategory,
      :title => "MyString",
      :desc => "MyText"
    ).as_new_record)
  end

  it "renders new word_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => word_categories_path, :method => "post" do
      assert_select "input#word_category_title", :name => "word_category[title]"
      assert_select "textarea#word_category_desc", :name => "word_category[desc]"
    end
  end
end
