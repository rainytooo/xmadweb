require 'spec_helper'

describe "ext_attributes/show" do
  before(:each) do
    @ext_attribute = assign(:ext_attribute, stub_model(ExtAttribute))
  end

  it "renders attributes in <p>" do
    render
  end
end
