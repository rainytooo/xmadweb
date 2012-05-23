require 'spec_helper'

describe "ext_attributes/new" do
  before(:each) do
    assign(:ext_attribute, stub_model(ExtAttribute).as_new_record)
  end

  it "renders new ext_attribute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ext_attributes_path, :method => "post" do
    end
  end
end
