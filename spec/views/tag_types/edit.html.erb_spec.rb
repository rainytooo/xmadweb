require 'spec_helper'

describe "tag_types/edit" do
  before(:each) do
    @tag_type = assign(:tag_type, stub_model(TagType,
      :name => "MyString",
      :descrition => "MyText",
      :upid => 1
    ))
  end

  it "renders the edit tag_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tag_types_path(@tag_type), :method => "post" do
      assert_select "input#tag_type_name", :name => "tag_type[name]"
      assert_select "textarea#tag_type_descrition", :name => "tag_type[descrition]"
      assert_select "input#tag_type_upid", :name => "tag_type[upid]"
    end
  end
end
