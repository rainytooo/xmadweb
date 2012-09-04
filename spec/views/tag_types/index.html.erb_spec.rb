require 'spec_helper'

describe "tag_types/index" do
  before(:each) do
    assign(:tag_types, [
      stub_model(TagType,
        :name => "Name",
        :descrition => "MyText",
        :upid => 1
      ),
      stub_model(TagType,
        :name => "Name",
        :descrition => "MyText",
        :upid => 1
      )
    ])
  end

  it "renders a list of tag_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
