require 'spec_helper'

describe "clicks/edit" do
  before(:each) do
    @click = assign(:click, stub_model(Click,
      :tagname => "MyString",
      :clicks => 1
    ))
  end

  it "renders the edit click form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clicks_path(@click), :method => "post" do
      assert_select "input#click_tagname", :name => "click[tagname]"
      assert_select "input#click_clicks", :name => "click[clicks]"
    end
  end
end
