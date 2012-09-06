require 'spec_helper'

describe "tag_categories/new" do
  before(:each) do
    assign(:tag_category, stub_model(TagCategory,
      :name => "MyString",
      :uid => 1,
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new tag_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tag_categories_path, :method => "post" do
      assert_select "input#tag_category_name", :name => "tag_category[name]"
      assert_select "input#tag_category_uid", :name => "tag_category[uid]"
      assert_select "textarea#tag_category_description", :name => "tag_category[description]"
    end
  end
end
