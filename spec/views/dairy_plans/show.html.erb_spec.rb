require 'spec_helper'

describe "dairy_plans/show" do
  before(:each) do
    @dairy_plan = assign(:dairy_plan, stub_model(DairyPlan))
  end

  it "renders attributes in <p>" do
    render
  end
end
