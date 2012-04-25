require 'spec_helper'

describe "teaching_problems/new" do
  before(:each) do
    assign(:teaching_problem, stub_model(TeachingProblem).as_new_record)
  end

  it "renders new teaching_problem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => teaching_problems_path, :method => "post" do
    end
  end
end
