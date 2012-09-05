require 'spec_helper'

describe "tag_categories/index" do
  before(:each) do
    assign(:tag_categories, [
      stub_model(TagCategory,
        :name => "Name",
        :uid => 1,
        :description => "MyText"
      ),
      stub_model(TagCategory,
        :name => "Name",
        :uid => 1,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of tag_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
