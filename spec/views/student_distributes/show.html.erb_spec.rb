require 'spec_helper'

describe "student_distributes/show" do
  before(:each) do
    @student_distribute = assign(:student_distribute, stub_model(StudentDistribute))
  end

  it "renders attributes in <p>" do
    render
  end
end
