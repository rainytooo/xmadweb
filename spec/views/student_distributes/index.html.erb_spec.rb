require 'spec_helper'

describe "student_distributes/index" do
  before(:each) do
    assign(:student_distributes, [
      stub_model(StudentDistribute),
      stub_model(StudentDistribute)
    ])
  end

  it "renders a list of student_distributes" do
    render
  end
end
