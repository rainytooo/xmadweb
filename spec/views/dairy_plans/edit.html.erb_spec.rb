require 'spec_helper'

describe "dairy_plans/edit" do
  before(:each) do
    @dairy_plan = assign(:dairy_plan, stub_model(DairyPlan))
  end

  it "renders the edit dairy_plan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dairy_plans_path(@dairy_plan), :method => "post" do
    end
  end
end
