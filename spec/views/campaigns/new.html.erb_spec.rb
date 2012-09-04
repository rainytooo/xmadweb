require 'spec_helper'

describe "campaigns/new" do
  before(:each) do
    assign(:campaign, stub_model(Campaign,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new campaign form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => campaigns_path, :method => "post" do
      assert_select "input#campaign_name", :name => "campaign[name]"
      assert_select "textarea#campaign_description", :name => "campaign[description]"
    end
  end
end
