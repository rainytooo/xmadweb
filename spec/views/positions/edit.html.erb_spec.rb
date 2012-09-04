require 'spec_helper'

describe "positions/edit" do
  before(:each) do
    @position = assign(:position, stub_model(Position,
      :name => "MyString",
      :upid => 1,
      :description => "MyText"
    ))
  end

  it "renders the edit position form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => positions_path(@position), :method => "post" do
      assert_select "input#position_name", :name => "position[name]"
      assert_select "input#position_upid", :name => "position[upid]"
      assert_select "textarea#position_description", :name => "position[description]"
    end
  end
end
