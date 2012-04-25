require 'spec_helper'

describe "teaching_problems/index" do
  before(:each) do
    assign(:teaching_problems, [
      stub_model(TeachingProblem),
      stub_model(TeachingProblem)
    ])
  end

  it "renders a list of teaching_problems" do
    render
  end
end
