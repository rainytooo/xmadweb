require 'spec_helper'

describe "ext_attributes/edit" do
  before(:each) do
    @ext_attribute = assign(:ext_attribute, stub_model(ExtAttribute))
  end

  it "renders the edit ext_attribute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ext_attributes_path(@ext_attribute), :method => "post" do
    end
  end
end
