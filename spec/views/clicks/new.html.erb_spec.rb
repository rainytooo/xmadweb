require 'spec_helper'

describe "clicks/new" do
  before(:each) do
    assign(:click, stub_model(Click,
      :tagname => "MyString",
      :clicks => 1
    ).as_new_record)
  end

  it "renders new click form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clicks_path, :method => "post" do
      assert_select "input#click_tagname", :name => "click[tagname]"
      assert_select "input#click_clicks", :name => "click[clicks]"
    end
  end
end
