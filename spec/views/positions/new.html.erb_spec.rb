require 'spec_helper'

describe "positions/new" do
  before(:each) do
    assign(:position, stub_model(Position,
      :name => "MyString",
      :upid => 1,
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new position form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => positions_path, :method => "post" do
      assert_select "input#position_name", :name => "position[name]"
      assert_select "input#position_upid", :name => "position[upid]"
      assert_select "textarea#position_description", :name => "position[description]"
    end
  end
end
