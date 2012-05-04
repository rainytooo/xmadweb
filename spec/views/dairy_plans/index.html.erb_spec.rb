require 'spec_helper'

describe "dairy_plans/index" do
  before(:each) do
    assign(:dairy_plans, [
      stub_model(DairyPlan),
      stub_model(DairyPlan)
    ])
  end

  it "renders a list of dairy_plans" do
    render
  end
end
