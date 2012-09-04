require 'spec_helper'

describe "web_pages/show" do
  before(:each) do
    @web_page = assign(:web_page, stub_model(WebPage,
      :domain => "Domain",
      :categroy => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Domain/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
