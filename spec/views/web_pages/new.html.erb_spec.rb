require 'spec_helper'

describe "web_pages/new" do
  before(:each) do
    assign(:web_page, stub_model(WebPage,
      :domain => "MyString",
      :categroy => 1
    ).as_new_record)
  end

  it "renders new web_page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => web_pages_path, :method => "post" do
      assert_select "input#web_page_domain", :name => "web_page[domain]"
      assert_select "input#web_page_categroy", :name => "web_page[categroy]"
    end
  end
end
