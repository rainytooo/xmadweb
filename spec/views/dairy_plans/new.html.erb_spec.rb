require 'spec_helper'

describe "dairy_plans/new" do
  before(:each) do
    assign(:dairy_plan, stub_model(DairyPlan).as_new_record)
  end

  it "renders new dairy_plan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dairy_plans_path, :method => "post" do
    end
  end
end
