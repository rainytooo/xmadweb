require 'spec_helper'

describe "tag_categories/edit" do
  before(:each) do
    @tag_category = assign(:tag_category, stub_model(TagCategory,
      :name => "MyString",
      :uid => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit tag_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tag_categories_path(@tag_category), :method => "post" do
      assert_select "input#tag_category_name", :name => "tag_category[name]"
      assert_select "input#tag_category_uid", :name => "tag_category[uid]"
      assert_select "textarea#tag_category_description", :name => "tag_category[description]"
    end
  end
end
