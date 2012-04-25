require 'spec_helper'

describe "teaching_problems/show" do
  before(:each) do
    @teaching_problem = assign(:teaching_problem, stub_model(TeachingProblem))
  end

  it "renders attributes in <p>" do
    render
  end
end
