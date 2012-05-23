require 'spec_helper'

describe "ext_attributes/index" do
  before(:each) do
    assign(:ext_attributes, [
      stub_model(ExtAttribute),
      stub_model(ExtAttribute)
    ])
  end

  it "renders a list of ext_attributes" do
    render
  end
end
