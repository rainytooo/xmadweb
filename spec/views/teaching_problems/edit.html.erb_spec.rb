require 'spec_helper'

describe "teaching_problems/edit" do
  before(:each) do
    @teaching_problem = assign(:teaching_problem, stub_model(TeachingProblem))
  end

  it "renders the edit teaching_problem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => teaching_problems_path(@teaching_problem), :method => "post" do
    end
  end
end
